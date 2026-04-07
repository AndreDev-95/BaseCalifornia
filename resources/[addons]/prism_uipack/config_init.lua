-- arquivo cliente usado para expor valores de config ao NUI
-- e permitir que outros recursos consultem convars do prism

RegisterNUICallback('getConfigValue', function(property, cb)
    if not property then
        cb('')
        return
    end

    local propertyValue = GetConvar(("prism:%s"):format(property), '')
    cb(propertyValue)
end)
