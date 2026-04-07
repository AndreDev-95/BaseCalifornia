--================================================--
--  PRISM_UI WRAPPER (Bytecode Clean Version)
--================================================--

local prism = exports.prism_uipack
local bridge = {}

----------------------------------------------------
-- NOTIFY / UI
----------------------------------------------------
function bridge.notify(data)
    prism:Notify(data)
end

function bridge.showTextUI(text, opts)
    prism:ShowTextUI(text, opts)
end

function bridge.hideTextUI()
    prism:HideTextUI()
end

function bridge.isTextUIOpen()
    return prism:IsTextUIOpen()
end

----------------------------------------------------
-- PROGRESS BARS
----------------------------------------------------
function bridge.progressBar(data)
    return prism:ProgressBar(data)
end

function bridge.progressCircle(data)
    data.variant = "secondary"
    return prism:ProgressBar(data)
end

function bridge.progressActive()
    return prism:ProgressActive()
end

function bridge.cancelProgress()
    prism:CancelProgress()
end

----------------------------------------------------
-- RADIAL MENU
----------------------------------------------------
function bridge.addRadialItem(data)
    prism:AddRadialItem(data)
end

function bridge.removeRadialItem(id)
    prism:RemoveRadialItem(id)
end

function bridge.clearRadialItems()
    prism:ClearRadialItems()
end

function bridge.registerRadial(data)
    prism:RegisterRadial(data)
end

function bridge.hideRadial()
    prism:HideRadial()
end

function bridge.disableRadial(state)
    prism:DisableRadial(state)
end

function bridge.getCurrentRadialId()
    return prism:GetCurrentRadialId()
end

----------------------------------------------------
-- SKILL CHECK
----------------------------------------------------
function bridge.skillCheck(...)
    return prism:SkillCheck(...)
end

function bridge.skillCheckActive()
    return prism:SkillCheckActive()
end

function bridge.cancelSkillCheck()
    prism:CancelSkillCheck()
end

----------------------------------------------------
-- INPUT DIALOG
----------------------------------------------------
function bridge.inputDialog(...)
    return prism:InputDialog(...)
end

function bridge.closeInputDialog()
    prism:CloseInputDialog()
end

----------------------------------------------------
-- CONTEXT MENU
----------------------------------------------------
function bridge.registerContext(data)
    prism:RegisterContext(data)
end

function bridge.showContext(id)
    prism:ShowContext(id)
end

function bridge.hideContext(id)
    prism:HideContext(id)
end

function bridge.getOpenContextMenu()
    return prism:GetOpenContextMenu()
end

----------------------------------------------------
-- ALERT DIALOG
----------------------------------------------------
function bridge.alertDialog(data)
    return prism:AlertDialog(data)
end

function bridge.closeAlertDialog()
    prism:CloseAlertDialog()
end

----------------------------------------------------
-- MENUS
----------------------------------------------------
function bridge.registerMenu(name, data)
    prism:RegisterMenu(name, data)
end

function bridge.showMenu(id)
    prism:ShowMenu(id)
end

function bridge.hideMenu(id)
    prism:HideMenu(id)
end

function bridge.getOpenMenu()
    return prism:GetOpenMenu()
end

function bridge.setMenuOptions(...)
    prism:SetMenuOptions(...)
end

----------------------------------------------------
-- LIB INTEGRATION WRAPPER
----------------------------------------------------

local successCount = 0
local totalFunctions = 0

for _ in pairs(bridge) do
    totalFunctions = totalFunctions + 1
end

for name, func in pairs(bridge) do
    local ok, err = pcall(function()
        lib[name] = func
        successCount = successCount + 1
    end)
    if not ok then
        print(("[prism_uipack] Failed to override lib.%s: %s"):format(name, err))
    end
end

print(("[prism_uipack] Successfully initialized %d/%d function overrides")
    :format(successCount, totalFunctions))

----------------------------------------------------
-- EXPORTS METATABLE (for ox_lib compatibility)
----------------------------------------------------

setmetatable(exports, {
    __call = function(_, res, func)
        return exports[res](func)
    end,

    __index = function(_, key)
        if key == "ox_lib" then
            return setmetatable({}, {
                __index = function(_, subKey)
                    local func = bridge[subKey]
                    if func then
                        return function(_, ...)
                            return func(...)
                        end
                    end
                    return exports.ox_lib[subKey]
                end
            })
        end

        return exports[key]
    end
})

--================================================--
--  FIM DO SCRIPT
--================================================--