return {
    statusIntervalSeconds = 5, -- how often to check hunger/thirst status to remove health if 0.
    loadingModelsTimeout = 30000, -- Waiting time for ox_lib to load the models before throws an error, for low specs pc

    pauseMapText = 'Powered by Qbox', -- Text shown above the map when ESC is pressed. If left empty 'FiveM' will appear

    characters = {
        useExternalCharacters = false, -- Whether you have an external character management resource. (If true, disables the character management inside the core)
        enableDeleteButton = true, -- Whether players should be able to delete characters themselves.
        startingApartment = false, -- If set to false, skips apartment choice in the beginning (requires qbx_spawn if true)

        dateFormat = 'YYYY-MM-DD',
        dateMin = '1900-01-01', -- Has to be in the same format as the dateFormat config
        dateMax = '2006-12-31', -- Has to be in the same format as the dateFormat config

        limitNationalities = true, -- Setting this to false will allow people to enter whatever they want in the nationality field (To edit the list of nationalities, head to data/nationalities.lua)

        profanityWords = {
            ['bad word'] = true
        },

        locations = { -- Spawn locations for multichar, these are chosen randomly
            {
                pedCoords = vec4(-1037.6, -2737.8, 20.1, 329.0),
                camCoords = vec4(-1034.5, -2741.2, 21.1, 149.0),
            },
        },
    },

    discord = {
        enabled = true, -- This will enable or disable the built in discord rich presence.

        appId = '1024981890798731345', -- This is the Application ID (Replace this with you own)

        largeIcon = { -- To set this up, visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686
            icon = 'duck', -- Here you will have to put the image name for the 'large' icon.
            text = 'Qbox Ducky', -- Here you can add hover text for the 'large' icon.
        },

        smallIcon = {
            icon = 'logo_name', -- Here you will have to put the image name for the 'small' icon.
            text = 'This is a small icon with text', -- Here you can add hover text for the 'small' icon.
        },

        firstButton = {
            text = 'Qbox Discord',
            link = 'https://discord.gg/Z6Whda5hHA',
        },

        secondButton = {
            text = 'Main Website',
            link = 'https://www.qbox.re/',
        }
    },

    --- Only used by QB bridge
    hasKeys = function(plate, vehicle)
        return GetResourceState('qbx_vehiclekeys') ~= 'started' or exports.qbx_vehiclekeys:HasKeys(vehicle)
    end,
}
