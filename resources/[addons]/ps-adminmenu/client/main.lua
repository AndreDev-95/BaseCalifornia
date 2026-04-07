local coreResource = Config.Core == "qbx_core" and "qb-core" or Config.Core
QBCore = exports[coreResource]:GetCoreObject()
PlayerData = {}
local AdminDuty = false

local function IsAdminOnDuty()
	return AdminDuty == true
end

-- Functions
local function setupMenu()
	Wait(500)
	PlayerData = QBCore.Functions.GetPlayerData()
	local resources = lib.callback.await('ps-adminmenu:callback:GetResources', false)
	local commands = lib.callback.await('ps-adminmenu:callback:GetCommands', false)
	GetData()
	SendNUIMessage({
		action = "setupUI",
		data = {
			actions = Config.Actions,
			resources = resources,
			playerData = PlayerData,
			commands = commands
		}
	})
end

RegisterNetEvent('ps-adminmenu:client:SetDuty', function(state)
	AdminDuty = state == true
end)

RegisterNetEvent('ps-adminmenu:client:NotifyDutyChanged', function(state)
	AdminDuty = state == true

	lib.notify({
		title = 'Admin Duty',
		description = AdminDuty and 'Entraste em duty de administração.' or 'Saíste de duty de administração.',
		type = AdminDuty and 'success' or 'inform'
	})
end)

RegisterNetEvent('ps-adminmenu:client:NotifyDutyRequired', function()
	lib.notify({
		title = 'Admin Duty',
		description = 'Tens de entrar em duty para usar o sistema admin.',
		type = 'error'
	})
end)

-- Event Handlers
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
	setupMenu()
end)

AddEventHandler("onResourceStart", function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		setupMenu()
	end
end)

-- NUICallbacks
RegisterNUICallback("hideUI", function()
	ToggleUI(false)
end)

RegisterNUICallback("clickButton", function(data)
	local selectedData = data.selectedData
	local key = data.data
	local data = CheckDataFromKey(key)
	if not data then return end

	if not IsAdminOnDuty() then
		lib.notify({
			title = 'Admin Duty',
			description = 'Tens de entrar em duty para usar o sistema admin.',
			type = 'error'
		})
		return
	end

	if data.type == "client" then
		TriggerServerEvent('ps-adminmenu:server:ValidateClientAction', key, selectedData, data.event, data.perms)
	elseif data.type == "server" then
		TriggerServerEvent(data.event, key, selectedData)
	elseif data.type == "command" then
		ExecuteCommand(data.event)
	end

	Log("Action Used: " .. key,
            PlayerData.name ..
            " (" ..
            PlayerData.citizenid ..
            ") - Used: " .. key .. (selectedData and (" with args: " .. json.encode(selectedData)) or ""))
end)

-- Open UI Event
RegisterNetEvent('ps-adminmenu:client:OpenUI', function()
	if not IsAdminOnDuty() then
		lib.notify({
			title = 'Admin Duty',
			description = 'Tens de entrar em duty para usar o sistema admin.',
			type = 'error'
		})
		return
	end

	ToggleUI(true)
end)

-- Close UI Event
RegisterNetEvent('ps-adminmenu:client:CloseUI', function()
	ToggleUI(false)
end)

-- Change resource state
RegisterNUICallback("setResourceState", function(data, cb)
	local resources = lib.callback.await('ps-adminmenu:callback:ChangeResourceState', false, data)
	cb(resources)
end)

-- Get players
RegisterNUICallback("getPlayers", function(data, cb)
	local players = lib.callback.await('ps-adminmenu:callback:GetPlayers', false)
	cb(players)
end)
