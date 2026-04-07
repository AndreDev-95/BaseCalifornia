local currentPromise = nil
local dialogId = 0

function AlertDialog(data, timeout)
    if currentPromise then return end

    dialogId += 1
    local thisId = dialogId

    local p = promise.new()
    currentPromise = p

    Utils.setNuiFocus(false)

    SendNUIMessage({
        action = "sendAlert",
        data = data
    })

    if timeout then
        SetTimeout(timeout, function()
            if thisId == dialogId then
                CloseAlertDialog("timeout")
            end
        end)
    end

    return Citizen.Await(p)
end

function CloseAlertDialog(reason)
    if not currentPromise then return end

    Utils.resetNuiFocus()

    SendNUIMessage({
        action = "closeAlertDialog"
    })

    local p = currentPromise
    currentPromise = nil

    if reason then
        p:reject(reason)
    else
        p:resolve()
    end
end

RegisterNUICallback("closeAlert", function(data, cb)
    cb(1)

    Utils.resetNuiFocus()

    local p = currentPromise
    currentPromise = nil

    p:resolve(data)
end)

RegisterNetEvent("ox_lib:alertDialog", AlertDialog)

-- {
--     header = "Título",
--     content = "Mensagem do alerta",
--     centered = true,
--     cancel = true
-- }

-- local result = exports.prism_uipack:AlertDialog({
--     header = "Aviso",
--     content = "Você deseja continuar?",
--     cancel = true
-- })
--
-- print(result)

-- local success, response = pcall(function()
--     return exports.prism_uipack:AlertDialog({
--         header = "Tempo limite",
--         content = "Você tem 5 segundos para responder",
--         cancel = true
--     }, 5000)
-- end)
--
-- if success then
--     print("Jogador respondeu:", response)
-- else
--     print("Alert fechado por timeout")
-- end

-- if exports.prism_uipack:AlertDialog({
--     header = "Emprego",
--     content = "Deseja iniciar o trabalho agora?",
--     cancel = true
-- }) then
--     print("Aceitou o trabalho")
-- else
--     print("Recusou")
-- end

-- RegisterCommand("alerttest", function()
--     local success, result = pcall(function()
--     return exports.prism_uipack:AlertDialog({
--             header = "Teste de Alert",
--             content = "Isso é um alerta de teste.\nDeseja continuar?",
--             cancel = true,
--             centered = true
--         }, 5000) -- 5 segundos
--     end)

--     if success then
--         if result == "cancel" then
--             print("Jogador cancelou")
--         elseif result == "confirm" then
--           print("Jogador confirmou")
--         end
--     else
--         print("Alerta fechado por timeout ou erro:", result)
--         exports.prism_uipack:Notify({
--             type = "warning",
--             title = "TEMPO ESGOTADO!",
--             description = "Alerta fechado por Tempo Esgotado!"
--         })
--     end
-- end)

