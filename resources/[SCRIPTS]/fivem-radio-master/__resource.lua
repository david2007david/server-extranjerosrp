resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_02_POP" { url = "http://4003.live.streamtheworld.com/LOS40CMP3", volume = 0.5, name = "[Los 40]" }
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "http://icecast.timlradio.co.uk/vr160.ogg", volume = 0.5, name = "[Absolute Radio]" }

files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}
