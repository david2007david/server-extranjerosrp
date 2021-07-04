Config                            = {}

Config.DrawDistance               = 10.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

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

Config.BandaStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.8,
			Colour  = 29
		},

		Cloakrooms = {
			--vector3(452.6, -992.8, 30.6)
		},

		Armories = {
			vector3(114.07, -1961.04, 21.33)
		},

		Vehicles = {
			{
				Spawner = vector3(84.27, -1973.17, 20.88),
				InsideShop = vector3(88.82, -1966.72, 20.32),
				SpawnPoints = {
					{ coords = vector3(88.82, -1966.72, 20.32), heading = 319.48, radius = 6.0 }
				}
			}
		},

Helicopters = {
			{
				--Spawner = vector3(-2665.30, 1344.28, 156.93),
				InsideShop = vector3(-2670.54, 1341.657, 157.03),
				SpawnPoints = {
					{ coords = vector3(-2670.54, 1341.657, 157.03), heading = 89.99, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(113.52, -1973.96, 21.32)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
      { weapon = 'WEAPON_COMBATPISTOL',     price = 4000 },
      { weapon = 'WEAPON_ASSAULTSMG',       price = 15000 },
      { weapon = 'WEAPON_ASSAULTRIFLE',     price = 25000 },
      { weapon = 'WEAPON_PUMPSHOTGUN',      price = 9000 },
      { weapon = 'WEAPON_FLASHLIGHT',       price = 50 },
      { weapon = 'WEAPON_FIREEXTINGUISHER', price = 50 },
      { weapon = 'GADGET_PARACHUTE',        price = 2000 },
      { weapon = 'WEAPON_FIREWORK',         price = 5000 },
      { weapon = 'WEAPON_BZGAS',            price = 8000 },
      { weapon = 'WEAPON_SMOKEGRENADE',     price = 8000 },
      { weapon = 'WEAPON_CARBINERIFLE',     price = 25000 },
      { weapon = 'WEAPON_HEAVYSNIPER',      price = 80000 },
      { weapon = 'WEAPON_FLARE',            price = 8000 },
      { weapon = 'WEAPON_SWITCHBLADE',      price = 500 },
      { weapon = 'WEAPON_POOLCUE',          price = 100 },
      { weapon = 'WEAPON_PISTOL50',          price = 8000 },	  
      { weapon = 'WEAPON_GUSENBERG',        price = 17500 },		
	},

	officer = {
      { weapon = 'WEAPON_COMBATPISTOL',     price = 4000 },
      { weapon = 'WEAPON_ASSAULTSMG',       price = 15000 },
      { weapon = 'WEAPON_ASSAULTRIFLE',     price = 25000 },
      { weapon = 'WEAPON_PUMPSHOTGUN',      price = 9000 },
      { weapon = 'WEAPON_FLASHLIGHT',       price = 50 },
      { weapon = 'WEAPON_FIREEXTINGUISHER', price = 50 },
      { weapon = 'GADGET_PARACHUTE',        price = 2000 },
      { weapon = 'WEAPON_FIREWORK',         price = 5000 },
      { weapon = 'WEAPON_BZGAS',            price = 8000 },
      { weapon = 'WEAPON_SMOKEGRENADE',     price = 8000 },
      { weapon = 'WEAPON_CARBINERIFLE',     price = 25000 },
      { weapon = 'WEAPON_HEAVYSNIPER',      price = 80000 },
      { weapon = 'WEAPON_FLARE',            price = 8000 },
      { weapon = 'WEAPON_SWITCHBLADE',      price = 500 },
      { weapon = 'WEAPON_POOLCUE',          price = 100 },
      { weapon = 'WEAPON_PISTOL50',          price = 8000 },	  
      { weapon = 'WEAPON_GUSENBERG',        price = 17500 },							
	},

	sergeant = {
      { weapon = 'WEAPON_COMBATPISTOL',     price = 4000 },
      { weapon = 'WEAPON_ASSAULTSMG',       price = 15000 },
      { weapon = 'WEAPON_ASSAULTRIFLE',     price = 25000 },
      { weapon = 'WEAPON_PUMPSHOTGUN',      price = 9000 },
      { weapon = 'WEAPON_FLASHLIGHT',       price = 50 },
      { weapon = 'WEAPON_FIREEXTINGUISHER', price = 50 },
      { weapon = 'GADGET_PARACHUTE',        price = 2000 },
      { weapon = 'WEAPON_FIREWORK',         price = 5000 },
      { weapon = 'WEAPON_BZGAS',            price = 8000 },
      { weapon = 'WEAPON_SMOKEGRENADE',     price = 8000 },
      { weapon = 'WEAPON_CARBINERIFLE',     price = 25000 },
      { weapon = 'WEAPON_HEAVYSNIPER',      price = 80000 },
      { weapon = 'WEAPON_FLARE',            price = 8000 },
      { weapon = 'WEAPON_SWITCHBLADE',      price = 500 },
      { weapon = 'WEAPON_POOLCUE',          price = 100 },
      { weapon = 'WEAPON_PISTOL50',          price = 8000 },	  
      { weapon = 'WEAPON_GUSENBERG',        price = 17500 },			
	},

	intendent = {
      { weapon = 'WEAPON_COMBATPISTOL',     price = 4000 },
      { weapon = 'WEAPON_ASSAULTSMG',       price = 15000 },
      { weapon = 'WEAPON_ASSAULTRIFLE',     price = 25000 },
      { weapon = 'WEAPON_PUMPSHOTGUN',      price = 9000 },
      { weapon = 'WEAPON_FLASHLIGHT',       price = 50 },
      { weapon = 'WEAPON_FIREEXTINGUISHER', price = 50 },
      { weapon = 'GADGET_PARACHUTE',        price = 2000 },
      { weapon = 'WEAPON_FIREWORK',         price = 5000 },
      { weapon = 'WEAPON_BZGAS',            price = 8000 },
      { weapon = 'WEAPON_SMOKEGRENADE',     price = 8000 },
      { weapon = 'WEAPON_CARBINERIFLE',     price = 25000 },
      { weapon = 'WEAPON_HEAVYSNIPER',      price = 80000 },
      { weapon = 'WEAPON_FLARE',            price = 8000 },
      { weapon = 'WEAPON_SWITCHBLADE',      price = 500 },
      { weapon = 'WEAPON_POOLCUE',          price = 100 },
      { weapon = 'WEAPON_PISTOL50',          price = 8000 },	  
      { weapon = 'WEAPON_GUSENBERG',        price = 17500 },
	},

	lieutenant = {
      { weapon = 'WEAPON_COMBATPISTOL',     price = 4000 },
      { weapon = 'WEAPON_ASSAULTSMG',       price = 15000 },
      { weapon = 'WEAPON_ASSAULTRIFLE',     price = 25000 },
      { weapon = 'WEAPON_PUMPSHOTGUN',      price = 9000 },
      { weapon = 'WEAPON_FLASHLIGHT',       price = 50 },
      { weapon = 'WEAPON_FIREEXTINGUISHER', price = 50 },
      { weapon = 'GADGET_PARACHUTE',        price = 2000 },
      { weapon = 'WEAPON_FIREWORK',         price = 5000 },
      { weapon = 'WEAPON_BZGAS',            price = 8000 },
      { weapon = 'WEAPON_SMOKEGRENADE',     price = 8000 },
      { weapon = 'WEAPON_CARBINERIFLE',     price = 25000 },
      { weapon = 'WEAPON_HEAVYSNIPER',      price = 80000 },
      { weapon = 'WEAPON_FLARE',            price = 8000 },
      { weapon = 'WEAPON_SWITCHBLADE',      price = 500 },
      { weapon = 'WEAPON_POOLCUE',          price = 100 },
      { weapon = 'WEAPON_PISTOL50',          price = 8000 },	  
      { weapon = 'WEAPON_GUSENBERG',        price = 17500 },				
	},

	boss = {
      { weapon = 'WEAPON_COMBATPISTOL',     price = 4000 },
      { weapon = 'WEAPON_ASSAULTSMG',       price = 15000 },
      { weapon = 'WEAPON_ASSAULTRIFLE',     price = 25000 },
      { weapon = 'WEAPON_PUMPSHOTGUN',      price = 9000 },
      { weapon = 'WEAPON_FLASHLIGHT',       price = 50 },
      { weapon = 'WEAPON_FIREEXTINGUISHER', price = 50 },
      { weapon = 'GADGET_PARACHUTE',        price = 2000 },
      { weapon = 'WEAPON_FIREWORK',         price = 5000 },
      { weapon = 'WEAPON_BZGAS',            price = 8000 },
      { weapon = 'WEAPON_SMOKEGRENADE',     price = 8000 },
      { weapon = 'WEAPON_CARBINERIFLE',     price = 25000 },
      { weapon = 'WEAPON_HEAVYSNIPER',      price = 80000 },
      { weapon = 'WEAPON_FLARE',            price = 8000 },
      { weapon = 'WEAPON_SWITCHBLADE',      price = 500 },
      { weapon = 'WEAPON_POOLCUE',          price = 100 },
      { weapon = 'WEAPON_PISTOL50',          price = 8000 },	  
      { weapon = 'WEAPON_GUSENBERG',        price = 17500 },			
	}
}

Config.AuthorizedVehicles = {
	Shared = {
	},

	recruit = {
		{ model = 'Stretch', label = 'limusina', price = 200 },
		{ model = '2016rs7', label = 'RS7', price = 200 },
		{ model = 'schafter3', label = 'schafter3', price = 200 },
		{ model = 'btype', label = 'btype', price = 200 },		
		{ model = 'sandking', label = 'sandking', price = 200 },
		{ model = 'v250', label = 'vito', price = 200 },
		{ model = 'guardian', label = 'guardian', price = 200 },
		{ model = 'burrito3', label = 'burrito3', price = 200 },
		{ model = 'mesa', label = 'mesa', price = 200 },		

	},

	officer = {
		{ model = 'Stretch', label = 'limusina', price = 200 },
		{ model = '2016rs7', label = 'RS7', price = 200 },
		{ model = 'schafter3', label = 'schafter3', price = 200 },
		{ model = 'btype', label = 'btype', price = 200 },		
		{ model = 'sandking', label = 'sandking', price = 200 },
		{ model = 'v250', label = 'vito', price = 200 },
		{ model = 'guardian', label = 'guardian', price = 200 },
		{ model = 'burrito3', label = 'burrito3', price = 200 },
		{ model = 'mesa', label = 'mesa', price = 200 },		
	},

	sergeant = {
		{ model = 'Stretch', label = 'limusina', price = 200 },
		{ model = '2016rs7', label = 'RS7', price = 200 },
		{ model = 'schafter3', label = 'schafter3', price = 200 },
		{ model = 'btype', label = 'btype', price = 200 },		
		{ model = 'sandking', label = 'sandking', price = 200 },
		{ model = 'v250', label = 'vito', price = 200 },
		{ model = 'guardian', label = 'guardian', price = 200 },
		{ model = 'burrito3', label = 'burrito3', price = 200 },
		{ model = 'mesa', label = 'mesa', price = 200 },	
	},

	lieutenant = {
		{ model = 'Stretch', label = 'limusina', price = 200 },
		{ model = '2016rs7', label = 'RS7', price = 200 },
		{ model = 'schafter3', label = 'schafter3', price = 200 },
		{ model = 'btype', label = 'btype', price = 200 },		
		{ model = 'sandking', label = 'sandking', price = 200 },
		{ model = 'v250', label = 'vito', price = 200 },
		{ model = 'guardian', label = 'guardian', price = 200 },
		{ model = 'burrito3', label = 'burrito3', price = 200 },
		{ model = 'mesa', label = 'mesa', price = 200 },
	},
	
	boss = {
		{ model = 'Stretch', label = 'limusina', price = 200 },
		{ model = '2016rs7', label = 'RS7', price = 200 },
		{ model = 'schafter3', label = 'schafter3', price = 200 },
		{ model = 'btype', label = 'btype', price = 200 },		
		{ model = 'sandking', label = 'sandking', price = 200 },
		{ model = 'v250', label = 'vito', price = 200 },
		{ model = 'guardian', label = 'guardian', price = 200 },
		{ model = 'burrito3', label = 'burrito3', price = 200 },
		{ model = 'mesa', label = 'mesa', price = 200 },
	}
}

Config.AuthorizedHelicopters = {
	recruit = {
	{ model = 'volatus', label = 'Helicoptero', livery = 0, price = 200 }
	},

	officer = {
	{ model = 'volatus', label = 'Helicoptero', livery = 0, price = 200 }
	},

	sergeant = {
	{ model = 'volatus', label = 'Helicoptero', livery = 0, price = 200 }
	},

	lieutenant = {
	{ model = 'volatus', label = 'Helicoptero', livery = 0, price = 200 }
	},

	boss = {
	{ model = 'volatus', label = 'Helicoptero', livery = 0, price = 400 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

