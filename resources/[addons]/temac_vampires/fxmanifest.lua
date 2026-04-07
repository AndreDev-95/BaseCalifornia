fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

name 'temac_vampires'
description 'Temac Vampires system for Qbox'
author 'OpenAI'
version 'Beta 1.0.0'

ox_lib 'locale'

shared_scripts {
    '@ox_lib/init.lua',
    '@qbx_core/modules/lib.lua',
    'config/shared.lua',
}

client_scripts {
    '@qbx_core/modules/playerdata.lua',
    'client/main.lua',
}

server_scripts {
    'server/main.lua',
}

files {
    'locales/*.json',
    'install/*',
    'README.md',
    'Instruções.md'
}

dependencies {
    'ox_lib',
    'qbx_core'
}
