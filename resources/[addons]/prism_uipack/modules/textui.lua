local isOpen = false
local currentText = nil

function ShowTextUI(text, options)
    -- evita reenviar o mesmo texto
    if currentText == text then
        return
    end

    options = options or {}
    options.text = text

    currentText = text
    isOpen = true

    SendNUIMessage({
        action = "textUi",
        data = options
    })
end

function HideTextUI()
    SendNUIMessage({
        action = "textUiHide"
    })

    isOpen = false
    currentText = nil
end

function IsTextUIOpen()
    return isOpen, currentText
end

local TextUIZones = {}
local activeZone = nil
local isShowing = false

function CreateTextUIZone(data)
    if not data.coords then return end

    data.radius = data.radius or 2.0
    table.insert(TextUIZones, data)
end

exports("CreateTextUIZone", CreateTextUIZone)

CreateThread(function()
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local foundZone = nil

        for _, zone in pairs(TextUIZones) do
            local dist = #(coords - zone.coords)

            if dist <= zone.radius then
                foundZone = zone
                sleep = 0
                break
            end
        end

        -- Entrou numa zona
        if foundZone and activeZone ~= foundZone then
            activeZone = foundZone
            isShowing = true

            exports.prism_uipack:ShowTextUI(
                foundZone.title,
                {
                    description = foundZone.description,
                    position = foundZone.position or "left-center"
                }
            )
        end

        -- Saiu da zona
        if not foundZone and activeZone then
            activeZone = nil
            isShowing = false
            exports.prism_uipack:HideTextUI()
        end

        -- Interação
        if activeZone and IsControlJustPressed(0, 38) then -- E
            if activeZone.onSelect then
                activeZone.onSelect()
            end
        end

        Wait(sleep)
    end
end)

-- exports.prism_uipack:CreateTextUIZone({
--     coords = vector3(75.40, -1392.92, 29.37),
--     radius = 2.0,
--     title = "Abrir Garagem",
--     description = "Pressione E para acessar",
--     position = "left-center",
--     onSelect = function()
--         exports.prism_uipack:Notify({
--             type = "success",
--             title = "Garagem",
--             description = "Garagem aberta com sucesso!"
--         })

--         print("Garagem interagida!")
--     end
-- })

-- CreateThread(function()
-- 	for i = 1, #Skinshops do
-- 		local coords = vector3(Skinshops[i][1], Skinshops[i][2], Skinshops[i][3])
-- 		exports.prism_uipack:CreateTextUIZone({
-- 			coords = coords,
-- 			radius = 2.0,
-- 			title = "Abrir Loja de Roupas",
-- 			position = "left-center",
-- 			onSelect = function()
-- 				if vSERVER and vSERVER.Verify and vSERVER.Verify() then
-- 					OpenSkinshop()
-- 				else
-- 					TriggerEvent("skinshop:Open")
-- 				end
-- 			end
-- 		})
-- 	end
-- end)

