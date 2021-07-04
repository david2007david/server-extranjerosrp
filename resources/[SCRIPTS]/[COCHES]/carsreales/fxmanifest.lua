fx_version 'adamant'
games {'gta5'}

files {
    'data/**/*.meta',
    'data/**/*.meta',
	'data/**/*.meta',
	'data/**/*.meta',
	'data/**/*.meta'
}

data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'
data_file 'DLC_TEXT_FILE' 'data/**/dlctext.meta'

client_script {
    'vehicle_names.lua' 
}

server_script '@mario_utils/servermemorydebug.lua'