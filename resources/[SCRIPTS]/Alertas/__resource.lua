resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

client_script "main.lua"

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}
ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/app.js',
	'html/style.css',
	'img/roja.png',
	'img/naranja.png',
	'img/azul.png'
}












































