local Config = require 'config.shared'

local vampireState = {
    isVampire = false,
    transformed = false,
    blood = Config.blood.start,
    level = 1,
    xp = 0,
    nightBuffActive = false,
    daylightProtectedUntil = 0,
    lastFeed = 0
}

local function notify(key, type, data)
    local text = locale(key, data)
    lib.notify({
        title = 'Temac Vampires',
        description = text,
        type = type or 'inform'
    })
end

local function isNight()
    local hour = GetClockHours()
    return hour >= Config.night.startsAt or hour <= Config.night.endsAt
end

local function isSunTime()
    local hour = GetClockHours()
    return hour >= Config.sun.startsAt and hour < Config.sun.endsAt
end

local function currentLevelData()
    return Config.levels[vampireState.level] or Config.levels[1]
end

local function applyCombatBuffs()
    if not vampireState.isVampire then
        SetRunSprintMultiplierForPlayer(cache.playerId, 1.0)
        SetPlayerMeleeWeaponDamageModifier(cache.playerId, 1.0)
        return
    end

    local levelData = currentLevelData()
    if isNight() then
        SetRunSprintMultiplierForPlayer(cache.playerId, levelData.speedMultiplier)
        SetPlayerMeleeWeaponDamageModifier(cache.playerId, levelData.meleeModifier)
    else
        SetRunSprintMultiplierForPlayer(cache.playerId, 1.0)
        SetPlayerMeleeWeaponDamageModifier(cache.playerId, 1.0)
    end
end

local function setState(data)
    vampireState.isVampire = data.isVampire or false
    vampireState.blood = data.blood or Config.blood.start
    vampireState.level = data.level or 1
    vampireState.xp = data.xp or 0
    vampireState.transformed = data.transformed or false
    applyCombatBuffs()
end

RegisterNetEvent('temac_vampires:client:setState', function(data)
    setState(data)
end)

RegisterNetEvent('temac_vampires:client:playTransform', function(data)
    setState(data)
    local anim = Config.anims.transform
    lib.requestAnimDict(anim.dict)
    TaskPlayAnim(cache.ped, anim.dict, anim.clip, 8.0, -8.0, 3500, 49, 0.0, false, false, false)
    Wait(3500)
    ClearPedTasks(cache.ped)
    notify('notify.transformed', 'success')
end)

RegisterNetEvent('temac_vampires:client:playCure', function(data)
    setState(data)
    local anim = Config.anims.transform
    lib.requestAnimDict(anim.dict)
    TaskPlayAnim(cache.ped, anim.dict, anim.clip, 8.0, -8.0, 2500, 49, 0.0, false, false, false)
    Wait(2500)
    ClearPedTasks(cache.ped)
    notify('notify.cured', 'success')
end)

RegisterNetEvent('temac_vampires:client:ringUsed', function(expireAt)
    vampireState.daylightProtectedUntil = expireAt
    notify('notify.ring_active', 'success')
end)

RegisterNetEvent('temac_vampires:client:bloodPouchUsed', function(data)
    setState(data)
    notify('notify.blood_restored', 'success', { amount = Config.blood.pouchRestore })
end)

local function getNearestPlayer(maxDistance)
    local closestPlayer, closestDistance
    local coords = GetEntityCoords(cache.ped)

    for _, player in ipairs(GetActivePlayers()) do
        local serverId = GetPlayerServerId(player)
        if serverId ~= cache.serverId then
            local ped = GetPlayerPed(player)
            local dist = #(coords - GetEntityCoords(ped))
            if not closestDistance or dist < closestDistance then
                closestPlayer = serverId
                closestDistance = dist
            end
        end
    end

    if closestPlayer and closestDistance and closestDistance <= maxDistance then
        return closestPlayer, closestDistance
    end
end

local function getNearestNpc(maxDistance)
    local peds = GetGamePool('CPed')
    local coords = GetEntityCoords(cache.ped)
    local nearest, nearestDist

    for i = 1, #peds do
        local ped = peds[i]
        if ped ~= cache.ped and not IsPedAPlayer(ped) and DoesEntityExist(ped) and IsPedHuman(ped) and not IsPedDeadOrDying(ped) then
            local dist = #(coords - GetEntityCoords(ped))
            if not nearestDist or dist < nearestDist then
                nearest = ped
                nearestDist = dist
            end
        end
    end

    if nearest and nearestDist and nearestDist <= maxDistance then
        return nearest, nearestDist
    end
end

local function playFeedAnim(targetPed)
    local anim = Config.anims.feed
    lib.requestAnimDict(anim.dict)
    TaskTurnPedToFaceEntity(cache.ped, targetPed, 500)
    Wait(500)
    TaskPlayAnim(cache.ped, anim.dict, anim.clip, 8.0, -8.0, Config.feeding.durationMs, 49, 0.0, false, false, false)
end

local function canFeed()
    if not vampireState.isVampire then
        notify('notify.not_vampire', 'error')
        return false
    end

    if GetGameTimer() - vampireState.lastFeed < Config.feeding.cooldownMs then
        notify('notify.feed_cooldown', 'error')
        return false
    end

    return true
end

local function attemptFeed()
    if not canFeed() then return end

    local playerServerId = getNearestPlayer(Config.feeding.maxDistance)
    if playerServerId then
        local targetPed = GetPlayerPed(GetPlayerFromServerId(playerServerId))
        if targetPed and targetPed ~= 0 then
            playFeedAnim(targetPed)
            local ok = lib.progressBar({
                duration = Config.feeding.durationMs,
                label = locale('progress.feeding_player'),
                canCancel = true,
                disable = { move = true, car = true, combat = true }
            })

            ClearPedTasks(cache.ped)

            if ok then
                vampireState.lastFeed = GetGameTimer()
                TriggerServerEvent('temac_vampires:server:feedPlayer', playerServerId)
            end
            return
        end
    end

    local npc = getNearestNpc(Config.feeding.maxDistance)
    if npc then
        playFeedAnim(npc)
        local ok = lib.progressBar({
            duration = Config.feeding.durationMs,
            label = locale('progress.feeding_npc'),
            canCancel = true,
            disable = { move = true, car = true, combat = true }
        })

        ClearPedTasks(cache.ped)

        if ok then
            vampireState.lastFeed = GetGameTimer()
            TriggerServerEvent('temac_vampires:server:feedNpc')
            SetEntityHealth(npc, 0)
        end
        return
    end

    notify('notify.no_target', 'error')
end

local function toggleTransformation()
    if not vampireState.isVampire then
        notify('notify.not_vampire', 'error')
        return
    end

    TriggerServerEvent('temac_vampires:server:toggleTransformation')
end

lib.addKeybind({
    name = 'temac_vampires_feed',
    description = locale('info.feed_keybind'),
    defaultKey = Config.keybinds.feed,
    defaultMapper = 'keyboard',
    onPressed = attemptFeed,
})

lib.addKeybind({
    name = 'temac_vampires_transform',
    description = locale('info.transform_keybind'),
    defaultKey = Config.keybinds.transform,
    defaultMapper = 'keyboard',
    onPressed = toggleTransformation,
})

RegisterCommand(Config.commandNames.status, function()
    TriggerServerEvent('temac_vampires:server:requestStatus')
end, false)

RegisterNetEvent('temac_vampires:client:showStatus', function(data)
    local levelData = Config.levels[data.level] or Config.levels[1]
    lib.alertDialog({
        header = 'Temac Vampires',
        content = ('**Estado:** %s\n\n**Forma transformada:** %s\n\n**Sede de sangue:** %s/%s\n\n**Nível:** %s - %s\n\n**XP:** %s'):format(
            data.isVampire and 'Vampiro' or 'Humano',
            data.transformed and 'Sim' or 'Não',
            data.blood,
            Config.blood.max,
            data.level,
            levelData.label,
            data.xp
        ),
        centered = true
    })
end)

CreateThread(function()
    while true do
        Wait(Config.sun.tickMs)
        if not vampireState.isVampire then goto continue end

        local protected = vampireState.daylightProtectedUntil > GetGameTimer()
        if isSunTime() and not protected and not IsPedInAnyVehicle(cache.ped, false) and not IsEntityDead(cache.ped) then
            local extra = vampireState.blood <= Config.blood.criticalThreshold and Config.sun.criticalBloodExtraDamage or 0
            ApplyDamageToPed(cache.ped, Config.sun.damage + extra, false)
            StartEntityFire(cache.ped)
            SetTimeout(1500, function()
                if DoesEntityExist(cache.ped) then
                    StopEntityFire(cache.ped)
                end
            end)
            notify('notify.sun_damage', 'error')
        end

        ::continue::
    end
end)

CreateThread(function()
    while true do
        Wait(Config.night.regenTickMs)
        if not vampireState.isVampire then goto continue end

        if isNight() and not IsEntityDead(cache.ped) then
            local levelData = currentLevelData()
            local newHealth = math.min(GetEntityMaxHealth(cache.ped), GetEntityHealth(cache.ped) + Config.night.regenAmount + levelData.regenBonus)
            SetEntityHealth(cache.ped, newHealth)
        end

        ::continue::
    end
end)

CreateThread(function()
    while true do
        Wait(3000)
        applyCombatBuffs()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(1500)
    TriggerServerEvent('temac_vampires:server:playerLoaded')
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    Wait(1500)
    TriggerServerEvent('temac_vampires:server:playerLoaded')
end)
