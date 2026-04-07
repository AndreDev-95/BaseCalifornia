fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'
name 'ox_inventory'
author 'Overextended - Redesigned by { im_hydra#0 }'
version '2.44.8'
repository 'https://github.com/communityox/ox_inventory'
description 'Slot-based inventory with item metadata support'
dependencies {
    '/server:6116',
    '/onesync',
    'oxmysql',
    'ox_lib',
}
shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}
ox_libs {
    'locale',
    'table',
    'math',
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'init.lua'
}
client_script {'init.lua' , 'client.lua', 'cl_utils.lua'}
ui_page 'web/build/index.html'
files {
    'server.lua',
    'locales/*.json',
    'web/build/index.html',
    'web/build/assets/*.*',
    'web/images/*.png',
    'modules/**/shared.lua',
    'modules/**/client.lua',
    'modules/bridge/**/client.lua',
    'data/*.lua',
}
escrow_ignore {
    'client.lua',
    'config.lua',
    'init.lua',
    'server.lua',
    'setup/*.lua',
    'modules/**/*.lua',
    'modules/**/**/*.lua',
    'data/*.lua',
}
dependency '/assetpacks'
