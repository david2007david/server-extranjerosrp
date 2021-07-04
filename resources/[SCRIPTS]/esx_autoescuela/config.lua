Config                            = {}

Config.DrawDistance               = 10.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 255, g = 0, b = 0 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.AutoescuelaStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(239.25, -1380.94, 33.7),
			Sprite  = 408,
			Display = 4,
			Scale   = 0.5,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(218.11, -1391.55, 30.4)
		},

		Vehicles = {
			{
				Spawner = vector3(216.05, -1389.56, 30.4),
				InsideShop = vector3(215.86, -1381.35, 30.14),
				SpawnPoints = {
					{ coords = vector3(215.86, -1381.35, 30.14), heading = 88.77, radius = 6.0 }
				}
			}
		},

		BossActions = {
			vector3(221.19, -1394.06, 30.4)
		}

	}

}

Config.AuthorizedVehicles = {
	Shared = {
        { model = '04astraae', label = 'Opel Astra', price = 1 },
		{ model = 'Phantom', label = 'Camion', price = 1 },
        { model = 'Ruffian', label = 'Moto', price = 1 }
	},

	recruit = {

	},

	officer = {

	},

	sergeant = {

	},

	intendent = {

	},

	lieutenant = {

	},

	chef = {

	},

	boss = {

	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 10,  ['tshirt_2'] = 0,
			['torso_1'] = 10,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 10,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 161,  ['tshirt_2'] = 0,
			['torso_1'] = 103,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 27,
			['pants_1'] = 102,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 10,  ['tshirt_2'] = 0,
			['torso_1'] = 10,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 10,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 161,  ['tshirt_2'] = 0,
	  ['torso_1'] = 103,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 27,
	  ['pants_1'] = 102,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 10,  ['tshirt_2'] = 0,
			['torso_1'] = 10,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 10,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 161,  ['tshirt_2'] = 0,
	  ['torso_1'] = 103,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 27,
	  ['pants_1'] = 102,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 10,  ['tshirt_2'] = 0,
			['torso_1'] = 10,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 10,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 161,  ['tshirt_2'] = 0,
	  ['torso_1'] = 103,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 27,
	  ['pants_1'] = 102,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 10,  ['tshirt_2'] = 0,
			['torso_1'] = 10,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 10,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 161,  ['tshirt_2'] = 0,
	  ['torso_1'] = 103,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 27,
	  ['pants_1'] = 102,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 10,  ['tshirt_2'] = 0,
			['torso_1'] = 10,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 10,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 161,  ['tshirt_2'] = 0,
	  ['torso_1'] = 103,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 27,
	  ['pants_1'] = 102,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 10,  ['tshirt_2'] = 0,
			['torso_1'] = 10,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 10,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
	  ['tshirt_1'] = 161,  ['tshirt_2'] = 0,
	  ['torso_1'] = 103,   ['torso_2'] = 0,
	  ['decals_1'] = 0,   ['decals_2'] = 0,
	  ['arms'] = 27,
	  ['pants_1'] = 102,   ['pants_2'] = 0,
	  ['shoes_1'] = 25,   ['shoes_2'] = 0,
	  ['helmet_1'] = -1,  ['helmet_2'] = 0,
	  ['chain_1'] = 0,    ['chain_2'] = 0,
	  ['ears_1'] = 0,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 11,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}