Config = {}

Config.Locale = 'en'

Config.Delays = {
	WeedProcessing = 1000 * 10,
	CokeProcessing = 1000 * 10,
	SpiceProcessing = 1000 * 10,
}

Config.DrugDealerItems = {  -- add any item here to be sold
	marijuana = 350,
	coke = 300,
	clothe = 100, -- clothes price
	meat = 4000,
	leather = 3000,
	spice = 350
}

Config.DealerBlip = false
Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 30000},
	coke_processing = {label = _U('license_coke'), price = 50000},
	spice_processing = {label = _U('license_spice'), price = 40000}
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	
	WeedField = {coords = vector3(2186.8, 5574.61, 53.88)--[[, name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 100.0]]},
	CokeField = {coords = vector3(4561.29, -4903.62, 15.0)--[[, name = _U('blip_cokefield'), color = 37, sprite = 501, radius = 100.0]]},
	SpiceField = {coords = vector3(4807.25, -5791.74, 36.0)--[[, name = _U('blip_spicefield'), color = 37, sprite = 501, radius = 100.0]]},
}

Config.ProcessZones = {

	WeedProcessing = {coords = vector3(1037.52, -3205.24, -38.17)--[[, name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 10.0]]},
	CokeProcessing = {coords = vector3(1091.78, -3196.61, -38.99)--[[, name = _U('blip_cokeprocessing'), color = 30, sprite = 501, radius = 10.0]]},
	SpiceProcessing = {coords = vector3(5404.8, -5172.0, 31.40)--[[, name = _U('blip_spiceprocessing'), color = 30, sprite = 501, radius = 10.0]]},
}

Config.DealerCoords = {

	DrugDealer = {coords = vector3(-1172.54, -1572.39, 4.66), name = _U('blip_drugdealer'), color = 6, sprite = 378, radius = 50.0},
}