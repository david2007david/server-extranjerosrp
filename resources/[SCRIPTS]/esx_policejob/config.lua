Config                            = {}

Config.DrawDistance               = 10.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 0, g = 0, b = 0 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = true -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.8,
			Colour  = 3
		},

		Cloakrooms = {
			vector3(461.67, -999.43, 29.7)
		},

		Armories = {
			vector3(481.31, -995.44, 29.7)
		},

		Vehicles = {
			{
				Spawner = vector3(459.54, -986.66, 24.75),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(452.25, -986.77, 25.75), heading = 175.45, radius = 6.0 },
					{ coords = vector3(431.39, -986.77, 25.75), heading = 175.45, radius = 6.0 },
					{ coords = vector3(443.12, -1020.32, 25.75), heading = 90.0, radius = 6.0 },
					{ coords = vector3(452.25, -986.77, 25.75), heading = 90.0, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0 },
					{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(448.4, -973.2, 30.6)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 200 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 200 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 250 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 500 },
		--{ weapon = 'WEAPON_PISTOL50', price = 250 },
		--{ weapon = 'WEAPON_APPISTOL', price = 5000 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 350 },
		{ weapon = 'WEAPON_SMG', price = 300 },
		{ weapon = 'WEAPON_BAT', price = 500 },		
		{ weapon = 'WEAPON_BZGAS', price = 250 }		
	},

	officer = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 200 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 200 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 250 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 500 },
		--{ weapon = 'WEAPON_PISTOL50', price = 250 },
		--{ weapon = 'WEAPON_APPISTOL', price = 5000 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 350 },
		{ weapon = 'WEAPON_SMG', price = 300 },
		{ weapon = 'WEAPON_BAT', price = 500 },		
		{ weapon = 'WEAPON_BZGAS', price = 250 }		
	},

	sergeant = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 200 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 200 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 250 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 500 },
		--{ weapon = 'WEAPON_PISTOL50', price = 250 },
		--{ weapon = 'WEAPON_APPISTOL', price = 5000 },		
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 350 },
		{ weapon = 'WEAPON_SMG', price = 300 },
		{ weapon = 'WEAPON_BAT', price = 500 },		
		{ weapon = 'WEAPON_BZGAS', price = 250 }		
	},

	intendent = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 200 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 200 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 250 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 500 },
		--{ weapon = 'WEAPON_PISTOL50', price = 250 },
		--{ weapon = 'WEAPON_APPISTOL', price = 5000 },		
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 350 },
		{ weapon = 'WEAPON_SMG', price = 300 },
		{ weapon = 'WEAPON_BAT', price = 500 },		
		{ weapon = 'WEAPON_BZGAS', price = 250 }		
	},

	lieutenant = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 200 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 200 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 250 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 500 },
		--{ weapon = 'WEAPON_PISTOL50', price = 250 },
		--{ weapon = 'WEAPON_APPISTOL', price = 5000 },		
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 350 },
		{ weapon = 'WEAPON_SMG', price = 300 },
		{ weapon = 'WEAPON_BAT', price = 500 },		
		{ weapon = 'WEAPON_BZGAS', price = 250 }		
	},

	chef = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 200 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 200 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 250 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 500 },
		--{ weapon = 'WEAPON_PISTOL50', price = 250 },
		--{ weapon = 'WEAPON_APPISTOL', price = 5000 },		
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 350 },
		{ weapon = 'WEAPON_SMG', price = 300 },
		{ weapon = 'WEAPON_BAT', price = 500 },		
		{ weapon = 'WEAPON_BZGAS', price = 250 }		
	},

	CNI = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 200 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 200 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 250 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 500 },
		--{ weapon = 'WEAPON_PISTOL50', price = 250 },
		--{ weapon = 'WEAPON_APPISTOL', price = 5000 },		
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 350 },
		{ weapon = 'WEAPON_SMG', price = 300 },
		{ weapon = 'WEAPON_BAT', price = 500 },		
		{ weapon = 'WEAPON_BZGAS', price = 250 }		
	},

	boss = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 200 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 200 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 250 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 500 },
		--{ weapon = 'WEAPON_PISTOL50', price = 250 },
		--{ weapon = 'WEAPON_APPISTOL', price = 5000 },		
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 350 },
		{ weapon = 'WEAPON_SMG', price = 300 },
		{ weapon = 'WEAPON_BAT', price = 500 },		
		{ weapon = 'WEAPON_BZGAS', price = 250 }		
	}
}

Config.AuthorizedVehicles = {
	Shared = {
	},

	recruit = {
		{ model = 'code3bmw', label = '「SAED」Moto de Carretera', price = 1 },
		{ model = 'code3fpis', label = '「SAED」Ford Taurus', price = 1 },
		{ model = 'code3ram', label = '「SAED」Ford RAM', price = 1 },
		{ model = 'code318charg', label = '「SAED」Dodge Charge', price = 1 },		
		{ model = 'code318tahoe', label = '「SAED」4x4 Tahoe', price = 1 },
		{ model = 'code320exp', label = '「SAED」Ford Explore', price = 1 },
		{ model = 'code398cvpi', label = '「SAED」Crome Victoria', price = 1 },	
		{ model = 'pbike', label = '「SAED」Bicicleta Policial', price = 1 },
		{ model = 'pd_dirtbike', label = '「SAED」Moto de Terreno', price = 1 },
		{ model = 'srtday20', label = '「SAED」Coche Secreta Civil', price = 1 },

	},

	officer = {
		{ model = 'code3bmw', label = '「SAED」Moto de Carretera', price = 1 },
		{ model = 'code3fpis', label = '「SAED」Ford Taurus', price = 1 },
		{ model = 'code3ram', label = '「SAED」Ford RAM', price = 1 },
		{ model = 'code318charg', label = '「SAED」Dodge Charge', price = 1 },		
		{ model = 'code318tahoe', label = '「SAED」4x4 Tahoe', price = 1 },
		{ model = 'code320exp', label = '「SAED」Ford Explore', price = 1 },
		{ model = 'code398cvpi', label = '「SAED」Crome Victoria', price = 1 },	
		{ model = 'pbike', label = '「SAED」Bicicleta Policial', price = 1 },
		{ model = 'pd_dirtbike', label = '「SAED」Moto de Terreno', price = 1 },
		{ model = 'srtday20', label = '「SAED」Coche Secreta Civil', price = 1 },

	},

	sergeant = {
		{ model = 'code3bmw', label = '「SAED」Moto de Carretera', price = 1 },
		{ model = 'code3fpis', label = '「SAED」Ford Taurus', price = 1 },
		{ model = 'code3ram', label = '「SAED」Ford RAM', price = 1 },
		{ model = 'code318charg', label = '「SAED」Dodge Charge', price = 1 },		
		{ model = 'code318tahoe', label = '「SAED」4x4 Tahoe', price = 1 },
		{ model = 'code320exp', label = '「SAED」Ford Explore', price = 1 },
		{ model = 'code398cvpi', label = '「SAED」Crome Victoria', price = 1 },	
		{ model = 'pbike', label = '「SAED」Bicicleta Policial', price = 1 },
		{ model = 'pd_dirtbike', label = '「SAED」Moto de Terreno', price = 1 },
		{ model = 'srtday20', label = '「SAED」Coche Secreta Civil', price = 1 },

	},

	lieutenant = {
		{ model = 'code3bmw', label = '「SAED」Moto de Carretera', price = 1 },
		{ model = 'code3fpis', label = '「SAED」Ford Taurus', price = 1 },
		{ model = 'code3ram', label = '「SAED」Ford RAM', price = 1 },
		{ model = 'code318charg', label = '「SAED」Dodge Charge', price = 1 },		
		{ model = 'code318tahoe', label = '「SAED」4x4 Tahoe', price = 1 },
		{ model = 'code320exp', label = '「SAED」Ford Explore', price = 1 },
		{ model = 'code398cvpi', label = '「SAED」Crome Victoria', price = 1 },	
		{ model = 'pbike', label = '「SAED」Bicicleta Policial', price = 1 },
		{ model = 'pd_dirtbike', label = '「SAED」Moto de Terreno', price = 1 },
		{ model = 'srtday20', label = '「SAED」Coche Secreta Civil', price = 1 },

	},
	
	boss = {
		{ model = 'code3bmw', label = '「SAED」Moto de Carretera', price = 1 },
		{ model = 'code3fpis', label = '「SAED」Ford Taurus', price = 1 },
		{ model = 'code3ram', label = '「SAED」Ford RAM', price = 1 },
		{ model = 'code318charg', label = '「SAED」Dodge Charge', price = 1 },		
		{ model = 'code318tahoe', label = '「SAED」4x4 Tahoe', price = 1 },
		{ model = 'code320exp', label = '「SAED」Ford Explore', price = 1 },
		{ model = 'code398cvpi', label = '「SAED」Crome Victoria', price = 1 },	
		{ model = 'pbike', label = '「SAED」Bicicleta Policial', price = 1 },
		{ model = 'pd_dirtbike', label = '「SAED」Moto de Terreno', price = 1 },
		{ model = 'srtday20', label = '「SAED」Coche Secreta Civil', price = 1 },

	},
}

Config.AuthorizedHelicopters = {
	recruit = {
	{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 200 }
	},

	officer = {
	{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 200 }
	},

	sergeant = {
	{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 200 }
	},

	lieutenant = {
	{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 200 }
	},

	boss = {
	{ model = 'polmav', label = 'Helicoptero', livery = 0, price = 400 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 85,
			['pants_1'] = 25,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 85,
			['pants_1'] = 25,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 85,
			['pants_1'] = 25,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 85,
			['pants_1'] = 25,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
	male = {
		['tshirt_1'] = 122,  ['tshirt_2'] = 0,
		['torso_1'] = 55,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 25,   ['pants_2'] = 2,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 85,
			['pants_1'] = 25,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	boss_wear = { -- currently the same as chef_wear
	male = {
		['tshirt_1'] = 122,  ['tshirt_2'] = 0,
		['torso_1'] = 55,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 85,
		['pants_1'] = 25,   ['pants_2'] = 2,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 0
		}
	},
	casco_wear = {
		male = {
			['helmet_1'] = 16,  ['helmet_2'] = 6
		},
		female = {
			['helmet_1'] = 16,  ['helmet_2'] = 6
		}
	},

	gilet_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 10,  ['bproof_2'] = 0
		}
	}
}