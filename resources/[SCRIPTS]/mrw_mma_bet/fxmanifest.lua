fx_version 'cerulean'
lua54 'yes'
games{'gta5'}
author 'Morow'

client_scripts{
    "client/client.lua",
    "client/ui.lua"
}

server_script "server/server.lua"

shared_scripts{
    "shared/shared.lua",
    "shared/translation/*.lua"
}

files{
	'ui/ui.html',
    'ui/css/app.css',
    'ui/script/app.js',
    'ui/sound/Gong.mp3'
}

ui_page 'ui/ui.html'