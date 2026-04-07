local Config = require 'config.shared'

local vampireData = {}

local function notify(src, key, type, data)
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Temac Vampires',
        description = locale(key, data),
        type = type or 'inform'
    })
end

local function defaultData()
    return {
        isVampire = false,
        transformed = false,
        blood = Config.blood.start,
        level = 1,
        xp = 0,
    }
end

local function normalize(data)
    local base = defaultData()
    if type(data) ~= 'table' then return base end
    base.isVampire = data.isVampire == true
    base.transformed = data.transformed == true
    base.blood = math.max(0, math.min(Config.blood.max, tonumber(data.blood) or Config.blood.start))
    base.level = math.max(1, math.min(#Config.levels, tonumber(data.level) or 1))
    base.xp = math.max(0, tonumber(data.xp) or 0)
    return base
end

local function saveData(src)
    local player = exports.qbx_core:GetPlayer(src)
    if not player then return end
    local data = vampireData[src] or defaultData()
    player.Functions.SetMetaData('temac_vampires', data)
    Player(src).state:set('temac_vampires', data, true)
end

local function sendState(src)
    TriggerClientEvent('temac_vampires:client:setState', src, vampireData[src] or defaultData())
end

local function levelFromXp(xp)
    local level = 1
    for lvl, info in pairs(Config.levels) do
        if xp >= info.xpRequired and lvl > level then
            level = lvl
        end
    end
    return level
end

local function addXp(src, amount)
    local data = vampireData[src]
    if not data then return end
    data.xp = data.xp + amount
    local newLevel = levelFromXp(data.xp)
    if newLevel ~= data.level then
        data.level = newLevel
        notify(src, 'notify.level_up', 'success', { level = newLevel, name = Config.levels[newLevel].label })
    end
end

local function addBlood(src, amount)
    local data = vampireData[src]
    if not data then return end
    data.blood = math.max(0, math.min(Config.blood.max, data.blood + amount))
end

local function setVampireState(src, bool)
    local data = vampireData[src] or defaultData()
    data.isVampire = bool
    data.transformed = bool and data.transformed or false
    if bool and data.blood <= 0 then
        data.blood = Config.blood.start
    end
    vampireData[src] = data
    saveData(src)
    sendState(src)
end

RegisterNetEvent('temac_vampires:server:playerLoaded', function()
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    if not player then return end

    local metadata = player.PlayerData.metadata.temac_vampires
    vampireData[src] = normalize(metadata)
    saveData(src)
    sendState(src)
end)

RegisterNetEvent('temac_vampires:server:requestStatus', function()
    local src = source
    TriggerClientEvent('temac_vampires:client:showStatus', src, vampireData[src] or defaultData())
end)

RegisterNetEvent('temac_vampires:server:toggleTransformation', function()
    local src = source
    local data = vampireData[src]
    if not data or not data.isVampire then return end

    data.transformed = not data.transformed
    saveData(src)
    TriggerClientEvent('temac_vampires:client:playTransform', src, data)
end)

RegisterNetEvent('temac_vampires:server:feedNpc', function()
    local src = source
    local data = vampireData[src]
    if not data or not data.isVampire then return end

    addBlood(src, Config.feeding.bloodFromNpc)
    addXp(src, Config.feeding.xpFromNpc)
    saveData(src)
    sendState(src)
    notify(src, 'notify.feed_success_npc', 'success')
end)

RegisterNetEvent('temac_vampires:server:feedPlayer', function(target)
    local src = source
    target = tonumber(target)
    if not target or target == src then return end

    local ped = GetPlayerPed(src)
    local targetPed = GetPlayerPed(target)
    if ped == 0 or targetPed == 0 then return end

    local distance = #(GetEntityCoords(ped) - GetEntityCoords(targetPed))
    if distance > Config.feeding.maxDistance + 0.5 then return end

    local data = vampireData[src]
    if not data or not data.isVampire then return end

    addBlood(src, Config.feeding.bloodFromPlayer)
    addXp(src, Config.feeding.xpFromPlayer)
    saveData(src)
    sendState(src)
    notify(src, 'notify.feed_success_player', 'success')

    local victim = exports.qbx_core:GetPlayer(target)
    if victim then
        local current = victim.PlayerData.metadata.thirst or 100
        victim.Functions.SetMetaData('thirst', math.max(0, current - 10))
        TriggerClientEvent('ox_lib:notify', target, {
            title = 'Temac Vampires',
            description = locale('notify.you_were_fed_on'),
            type = 'error'
        })
    end
end)

RegisterNetEvent('temac_vampires:server:useBloodPouch', function()
    local src = source
    local data = vampireData[src]
    if not data or not data.isVampire then
        notify(src, 'notify.not_vampire', 'error')
        return
    end

    addBlood(src, Config.blood.pouchRestore)
    saveData(src)
    TriggerClientEvent('temac_vampires:client:bloodPouchUsed', src, data)
end)

RegisterNetEvent('temac_vampires:server:useAntidote', function()
    local src = source
    vampireData[src] = defaultData()
    saveData(src)
    TriggerClientEvent('temac_vampires:client:playCure', src, vampireData[src])
end)

RegisterNetEvent('temac_vampires:server:useDaylightRing', function()
    local src = source
    local data = vampireData[src]
    if not data or not data.isVampire then
        notify(src, 'notify.not_vampire', 'error')
        return
    end

    TriggerClientEvent('temac_vampires:client:ringUsed', src, GetGameTimer() + Config.sun.ringDurationMs)
end)

CreateThread(function()
    while true do
        Wait(Config.blood.drainIntervalMs)
        for src, data in pairs(vampireData) do
            if data.isVampire then
                data.blood = math.max(0, data.blood - Config.blood.drainAmount)
                if data.blood <= Config.blood.starvingThreshold then
                    notify(src, 'notify.starving', 'error')
                elseif data.blood <= Config.blood.criticalThreshold then
                    notify(src, 'notify.critical_blood', 'error')
                end
                saveData(src)
                sendState(src)
            end
        end
    end
end)

AddEventHandler('playerDropped', function()
    local src = source
    if vampireData[src] then
        saveData(src)
        vampireData[src] = nil
    end
end)

lib.addCommand(Config.commandNames.toggle, {
    help = locale('commands.toggle_help')
}, function(source)
    local data = vampireData[source] or defaultData()
    if not data.isVampire then
        setVampireState(source, true)
        TriggerClientEvent('temac_vampires:client:playTransform', source, vampireData[source])
    else
        TriggerClientEvent('temac_vampires:client:showStatus', source, data)
    end
end)

lib.addCommand(Config.commandNames.status, {
    help = locale('commands.status_help')
}, function(source)
    TriggerClientEvent('temac_vampires:client:showStatus', source, vampireData[source] or defaultData())
end)

lib.addCommand(Config.commandNames.useBloodPouch, {
    help = locale('commands.blood_pouch_help')
}, function(source)
    TriggerEvent('temac_vampires:server:useBloodPouch', source)
end)

lib.addCommand(Config.commandNames.useAntidote, {
    help = locale('commands.antidote_help')
}, function(source)
    TriggerEvent('temac_vampires:server:useAntidote', source)
end)

lib.addCommand(Config.commandNames.useRing, {
    help = locale('commands.ring_help')
}, function(source)
    TriggerEvent('temac_vampires:server:useDaylightRing', source)
end)

lib.addCommand(Config.commandNames.adminSet, {
    help = locale('commands.admin_set_help'),
    restricted = 'group.admin',
    params = {
        { name = 'id', type = 'number' }
    }
}, function(source, args)
    setVampireState(args.id, true)
    TriggerClientEvent('temac_vampires:client:playTransform', args.id, vampireData[args.id])
    notify(source, 'notify.admin_set', 'success', { id = args.id })
end)

lib.addCommand(Config.commandNames.adminRemove, {
    help = locale('commands.admin_remove_help'),
    restricted = 'group.admin',
    params = {
        { name = 'id', type = 'number' }
    }
}, function(source, args)
    vampireData[args.id] = defaultData()
    saveData(args.id)
    TriggerClientEvent('temac_vampires:client:playCure', args.id, vampireData[args.id])
    notify(source, 'notify.admin_removed', 'success', { id = args.id })
end)
