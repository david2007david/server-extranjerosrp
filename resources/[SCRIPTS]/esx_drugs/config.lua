Config = {}

Config.Locale = 'en'

Config.Delays = {
	WeedProcessing = 1000 * 10,
	CokeProcessing = 1000 * 10,
	SpiceProcessing = 1000 * 10,
}

Config.DrugDealerItems = {  -- add any item here to be sold
	marijuana = 470,
	coke = 370,
	clothe = 100, -- clothes price
	meat = 4000,
	leather = 3000,
	spice = 300
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
	
	WeedField = {coords = vector3(1310.26,4326.77,56.12)--[[, name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 100.0]]},
	CokeField = {coords = vector3(2410.21, 3327.89, 47.38)--[[, name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 100.0]]},
	SpiceField = {coords = vector3(-893.87, 6045.55, 46.59)--[[, name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 100.0]]},
}

Config.ProcessZones = {

	WeedProcessing = {coords = vector3(2329.02, 2571.29, 46.68)--[[, name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 100.0]]},
	CokeProcessing = {coords = vector3(2433.86, 4968.6, 42.35)--[[, name = _U('blip_cokeprocessing'), color = 30, sprite = 501, radius = 100.0]]},
	SpiceProcessing = {coords = vector3(1391.91, 3605.82, 38.94)--[[, name = _U('blip_spiceprocessing'), color = 30, sprite = 501, radius = 100.0]]},
}
