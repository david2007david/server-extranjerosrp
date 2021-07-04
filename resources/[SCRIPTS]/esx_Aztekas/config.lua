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

Config.AztekasStations = {

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
			vector3(220.44, -1688.84, 29.48)
		},

		Vehicles = {
			{
				Spawner = vector3(225.32, -1682.32, 29.32),
				InsideShop = vector3(195.1, -1699.24, 29.34),
				SpawnPoints = {
					{ coords = vector3(225.58, -1707.72, 29.29), heading = 139.06, radius = 6.0 }
				}
			}
		},

Helicopters = {
			{
				Spawner = vector3(-2665.30, 1344.28, 156.93),
				InsideShop = vector3(-2670.54, 1341.657, 157.03),
				SpawnPoints = {
					{ coords = vector3(-2670.54, 1341.657, 157.03), heading = 300.59, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(214.65, -1692.81, 29.48)
		}

	}

}

Config.AuthorizedVehicles = {
	Shared = {
	},

	recruit = {
		{ model = 'kuruma', label = 'kuruma', price = 200 },
		{ model = 'bmx', label = 'bmx', price = 200 },
		{ model = 'hakuchou2', label = 'hakuchou2', price = 200 },		

	},

	officer = {
		{ model = 'kuruma', label = 'kuruma', price = 200 },
		{ model = 'bmx', label = 'bmx', price = 200 },
		{ model = 'hakuchou2', label = 'hakuchou2', price = 200 },			
	},

	sergeant = {
		{ model = 'kuruma', label = 'kuruma', price = 200 },
		{ model = 'bmx', label = 'bmx', price = 200 },
		{ model = 'hakuchou2', label = 'hakuchou2', price = 200 },		
	},

	lieutenant = {
		{ model = 'kuruma', label = 'kuruma', price = 200 },
		{ model = 'bmx', label = 'bmx', price = 200 },
		{ model = 'hakuchou2', label = 'hakuchou2', price = 200 },		
	},
	
	boss = {
		{ model = 'kuruma', label = 'kuruma', price = 200 },
		{ model = 'bmx', label = 'bmx', price = 200 },
		{ model = 'hakuchou2', label = 'hakuchou2', price = 200 },		
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

