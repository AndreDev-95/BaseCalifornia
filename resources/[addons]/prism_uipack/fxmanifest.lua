fx_version 'cerulean'

game 'gta5'
lua54 'yes'
version '1.2.1-qbox'

description 'PRISM UI Pack preparado para servidores Qbox/QBX com compatibilidade ox_lib.'

dependency 'ox_lib'
dependency '/assetpacks'

shared_scripts {
    '@ox_lib/init.lua'
}

client_scripts {
    'config_init.lua',
    'modules/*.lua',
    'main.lua',
    'init.lua'
}

ui_page 'web/build/index.html'

files {
    'web/build/**'
}

escrow_ignore {
    'config_init.lua',
    'init.lua'
}
