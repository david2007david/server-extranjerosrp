Config                            = {}

Config.DrawDistance               = 50.0
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

Config.TaxiStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(890.3, -177.58, 81.59),
			Sprite  = 198,
			Display = 4,
			Scale   = 0.8,
			Colour  = 5
		},

		Cloakrooms = {
			vector3(894.3, -171.94, 74.68)
		},

		Vehicles = {
			{
				Spawner = vector3(916.04, -161.32, 74.75),
				InsideShop = vector3(917.68, -167.19, 74.2),
				SpawnPoints = {
					{ coords = vector3(917.68, -167.19, 74.2), heading = 101.72, radius = 6.0 }
				}
			}
		},

		BossActions = {
			vector3(906.44, -151.27, 83.5)
		}

	}

}

Config.AuthorizedVehicles = {
	Shared = {
        { model = 'taxi', label = 'Peugeot 406', price = 1 }
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