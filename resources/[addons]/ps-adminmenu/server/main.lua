local coreResource = Config.Core == "qbx_core" and "qb-core" or Config.Core
QBCore = exports[coreResource]:GetCoreObject()

local adminDuty = {}

local function IsAdminOnDuty(src)
    return adminDuty[src] == true
end

local function SetAdminDuty(src, state)
    adminDuty[src] = state == true
    TriggerClientEvent('ps-adminmenu:client:SetDuty', src, adminDuty[src])
end

local function NotifyDutyRequired(src)
    TriggerClientEvent('ps-adminmenu:client:NotifyDutyRequired', src)
end

AddEventHandler('playerDropped', function()
    adminDuty[source] = nil
end)

lib.addCommand(Config.DutyCommand or 'duty', {
    help = 'Enter or leave admin duty',
    restricted = 'qbcore.mod'
}, function(source)
    local newState = not IsAdminOnDuty(source)
    SetAdminDuty(source, newState)

    TriggerClientEvent('ps-adminmenu:client:NotifyDutyChanged', source, newState)
end)

lib.addCommand('admin', {
    help = 'Open the admin menu',
    restricted = 'qbcore.mod'
}, function(source)
    if not IsAdminOnDuty(source) then
        NotifyDutyRequired(source)
        return
    end

    TriggerClientEvent('ps-adminmenu:client:OpenUI', source)
end)

RegisterNetEvent('ps-adminmenu:server:ValidateClientAction', function(key, selectedData, event, perms)
    local src = source
    if not CheckPerms(src, perms) then return end
    if not IsAdminOnDuty(src) then
        NotifyDutyRequired(src)
        return
    end

    TriggerClientEvent(event, src, key, selectedData)
end)

RegisterNetEvent('ps-adminmenu:server:ValidateCommand', function(command, perms)
    local src = source
    if not CheckPerms(src, perms) then return end
    if not IsAdminOnDuty(src) then
        NotifyDutyRequired(src)
        return
    end
    
    if command == 'vector2' or command == 'vector3' or command == 'vector4' or command == 'heading' then
        TriggerClientEvent('ps-adminmenu:client:CopyCoords', src, command)
    elseif command == 'setammo' then
        TriggerClientEvent('ps-adminmenu:client:SetAmmoCommand', src)
    end
end)
