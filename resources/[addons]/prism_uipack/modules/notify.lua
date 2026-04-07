-- Utilitário para tentar obter um valor salvo, ou retornar o padrão
local function safeKvp(getter, key, default)
    local success, result = pcall(getter, key)
    if not success then
        DeleteResourceKvp(key)
        return default
    end
    return result or default
end

-- Configurações padrão
local settings = {
    default_locale = GetConvar("ox:locale", "pt"),
    notification_position = safeKvp(GetResourceKvpString, "notification_position", "top-right"),
    notification_audio = safeKvp(GetResourceKvpInt, "notification_audio", 1) == 1
}

-- Função principal de notificação
function Notify(data)
    if not data then return end

    -- Ajusta tipo antigo “inform” para “info”
    if data.type == "inform" then
        data.type = "info"
    end

    local sound = settings.notification_audio and data.sound
    data.sound = nil

    -- Envia notificação para o NUI
    SendNUIMessage({
        action = "notification",
        data = data
    })

    -- Se não há som, sai
    if not sound then return end

    local hasBank = sound.bank ~= nil
    if hasBank then
        Utils.requestAudioBank(sound.bank)
    end

    local soundId = GetSoundId()
    PlaySoundFrontend(soundId, sound.name, sound.set, true)
    ReleaseSoundId(soundId)

    if hasBank then
        ReleaseNamedScriptAudioBank(sound.bank)
    end
end
