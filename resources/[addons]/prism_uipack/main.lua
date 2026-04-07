--================================================--
--  PRISM_UI Bytecode Clean Version
--================================================--

--============================
--  NUI CONFIG CALLBACK
--============================
RegisterNuiCallback("getConfig", function(_, cb)
    local config = {
        primaryColor        = GetConvar("prism:primaryColor", "#FF4A4A"),
        notificationDuration = GetConvarInt("prism:notificationDuration", 3000),
        progressCancelKey   = GetConvar("prism:progressCancelKey", "X"),
        notifyPosition      = GetConvar("prism:notificationPosition", "middle-right"),
        textUIPosition      = GetConvar("prism:textUIPosition", "center-left"),
        progressVariant     = GetConvar("prism:progressBar", "primary"),
    }

    cb(config)
end)

--============================
--  EXPORTS REGISTRAIS
--============================

-- Obs: Abaixo e oque voce vai usar para exporta os script e usa-los!

-- Notificações e UI
exports("Notify", Notify)
exports("ShowTextUI", ShowTextUI)
exports("HideTextUI", HideTextUI)
exports("IsTextUIOpen", IsTextUIOpen)
exports("ProgressBar", ProgressBar)
exports("ProgressActive", ProgressActive)
exports("CancelProgress", CancelProgress)

-- Radial Menu
exports("AddRadialItem", AddRadialItem)
exports("RemoveRadialItem", RemoveRadialItem)
exports("ClearRadialItems", ClearRadialItems)
exports("RegisterRadial", RegisterRadial)
exports("HideRadial", HideRadial)
exports("DisableRadial", DisableRadial)
exports("GetCurrentRadialId", GetCurrentRadialId)

-- Skill Check
exports("SkillCheck", SkillCheck)
exports("SkillCheckActive", SkillCheckActive)
exports("CancelSkillCheck", CancelSkillCheck)

-- Input Dialog
exports("InputDialog", InputDialog)
exports("CloseInputDialog", CloseInputDialog)

-- Context Menu
exports("RegisterContext", RegisterContext)
exports("ShowContext", ShowContext)
exports("HideContext", HideContext)
exports("GetOpenContextMenu", GetOpenContextMenu)

-- Alert Dialog
exports("AlertDialog", AlertDialog)
exports("CloseAlertDialog", CloseAlertDialog)

-- Menus
exports("RegisterMenu", RegisterMenu)
exports("ShowMenu", ShowMenu)
exports("HideMenu", HideMenu)
exports("GetOpenMenu", GetOpenMenu)
exports("SetMenuOptions", SetMenuOptions)

--================================================--
--  FIM DO SCRIPT
--================================================--