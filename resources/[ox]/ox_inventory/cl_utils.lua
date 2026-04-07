local QBCore = nil

if shared.framework == "qb" or shared.framework == "qbx" then
    QBCore = exports["qb-core"]:GetCoreObject()
end

local function GetPlayerMoney()
    local cash, bank = 0, 0

    if shared.framework == "esx" then
        local ESX = exports.es_extended:getSharedObject()
        local playerData = ESX.GetPlayerData()

        local function GetAccountMoney(accountName)
            for i = 1, #playerData.accounts do
                if playerData.accounts[i].name == accountName then
                    return playerData.accounts[i].money
                end
            end
            return 0
        end

        cash = GetAccountMoney("money")
        bank = GetAccountMoney("bank")

        return cash, bank
    end

    if shared.framework == "qbx" or shared.framework == "qb" then
        local playerData = QBCore.Functions.GetPlayerData()
        cash = playerData.money.cash
        bank = playerData.money.bank
        return cash, bank
    end

    return 0, 0
end

CreateThread(function()
    SendNUIMessage({
        action = "setupNotifyTheme",
        data = { Prism = Prism.ThemeSettings }
    })

    SendNUIMessage({
        action = "updateThemePrism",
        data = { ThemeSettings = Prism.ThemeSettings }
    })
end)

function SetupPrismInventory(leftInventory, rightInventory)
    leftInventory.mugshot = mugshot

    local playerId = GetPlayerServerId(PlayerId())

    if Prism.UseCitizenId and QBCore then
        local playerData = QBCore.Functions.GetPlayerData()
        if playerData and playerData.citizenid then
            playerId = playerData.citizenid
        end
    end

    leftInventory.id = playerId

    local cash, bank = GetPlayerMoney()
    leftInventory.pdata = { money = cash, bank = bank }
    leftInventory.slots = shared.playerslots

    SendNUIMessage({
        action = "setupInventory",
        data = {
            leftInventory = leftInventory,
            rightInventory = rightInventory,
            mouseTrailActive = Prism.mouseTrailActive,
            ThemeSettings = Prism.ThemeSettings,
            Texts = Prism.Texts,
            UseNativeLabeling = Prism.UseNativeLabeling
        }
    })
end
