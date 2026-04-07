fx_version 'cerulean'
game 'gta5'

description 'Temac HUD for Qbox'
repository 'https://github.com/AndreDev-95/BaseCalifornia'
version 'Beta 1.2.0'

ox_lib 'locale'

shared_scripts {
    '@ox_lib/init.lua',
    '@qbx_core/modules/lib.lua',
}

client_scripts {
    '@qbx_core/modules/playerdata.lua',
    'client/main.lua',
}

server_script 'server/main.lua'

ui_page 'html/index.html'

files {
    'html/*',
    'html/index.html',
    'html/styles.css',
    'html/responsive.css',
    'html/app.js',
    'html/brand-logo.svg',
    'locales/*.json',
    'config/client.lua',
    'config/shared.lua',
    'config/server.lua'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'
