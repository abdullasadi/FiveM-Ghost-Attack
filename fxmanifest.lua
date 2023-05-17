fx_version 'cerulean'
lua54 'yes'
games { 'gta5' }
author 'Kael Scripts'
description 'A Script For Night xD'
version '1.0.0'

client_scripts {
    'client/**.lua',
}

server_scripts {
    'server/**.lua',
}

shared_scripts {
    'config.lua',
}

files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js',
    'ui/img/*',
}

ui_page {'ui/index.html'}