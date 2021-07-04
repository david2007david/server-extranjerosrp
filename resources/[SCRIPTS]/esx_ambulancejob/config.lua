Config                            = {}

Config.DrawDistance               = 25.0

Config.Marker                     = { type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 500  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders
Config.NPCJobEarnings             = {min = 50, max = 60}
Config.MinimumDistance            = 100 -- Minimum NPC job destination distance from the pickup in GTA units, a higher number prevents nearby destionations.

Config.Locale                     = 'fr'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 5 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 10 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 500

Config.RespawnPoint = { coords = vector3(358.79, -589.58, 28.8), heading = 247.16 }

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(297.895, -584.094, 43.261),
			sprite = 61,
			scale  = 0.5
		},

		AmbulanceActions = {
			vector3(302.10, -598.39, 42.33)
		},

		Pharmacies = {
			vector3(303.692, -600.681, 42.33)
		},

		Vehicles = {
			{
				Spawner = vector3(319.1,-582.49,28.8),
				InsideShop = vector3(319.19,-574.7,28.56),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(319.19,-574.7,28.56), heading = 68.186, radius = 4.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(358.84, -579.28, 74.16),
				InsideShop = vector3(351.02,-588.29,74.30),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(351.02,-588.29,74.30), heading = 142.7, radius = 10.0 }
				}
			}
		}
	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Ambulancia', price = 40 },
		{ model = 'dodgeEMS', label = 'dodge', price = 40 },
		{ model = 'fdnyambo', label = 'Ambulancia1', price = 40 },		
		{ model = 'bv_mbxclass', label = 'bv_mbxclass', price = 40 }				
	},

	doctor = {
		{ model = 'ambulance', label = 'Ambulancia', price = 40 },
		{ model = 'dodgeEMS', label = 'dodge', price = 40 },
		{ model = 'fdnyambo', label = 'Ambulancia1', price = 40 },		
		{ model = 'bv_mbxclass', label = 'bv_mbxclass', price = 40 }	
	},

	chief_doctor = {
		{ model = 'ambulance', label = 'Ambulancia', price = 40 },
		{ model = 'dodgeEMS', label = 'dodge', price = 40 },
		{ model = 'fdnyambo', label = 'Ambulancia1', price = 40 },		
		{ model = 'bv_mbxclass', label = 'bv_mbxclass', price = 40 }	
	},

	boss = {
		{ model = 'ambulance', label = 'Ambulancia', price = 40 },
		{ model = 'dodgeEMS', label = 'dodge', price = 40 },
		{ model = 'fdnyambo', label = 'Ambulancia1', price = 40 },		
		{ model = 'bv_mbxclass', label = 'bv_mbxclass', price = 40 }	
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {
		{ model = 'supervolito', label = 'Helicoptero Rescate', price = 100 }
	},

	chief_doctor = {
		{ model = 'supervolito', label = 'Helicoptero Rescate', price = 100 }
	},

	boss = {
		{ model = 'supervolito', label = 'Helicoptero Rescate', price = 100 }
	}

}

Config.Uniforms = {
	[1] = { -- EMS
	  male = {
		['tshirt_1'] = 15, ['tshirt_2'] = 0,
		['torso_1'] = 13,  ['torso_2'] = 3,
		['decals_1'] = 57,  ['decals_2'] = 0,
		['arms'] = 92,
		['pants_1'] = 50,   ['pants_2'] = 2,
		['shoes_1'] = 10,   ['shoes_2'] = 0,
		['helmet_1'] = -1, ['helmet_2'] = 0,
		['chain_1'] = 126,  ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,   ['bproof_2'] = 0
	  },
	  female = {
		['tshirt_1'] = 159, ['tshirt_2'] = 0,
		['torso_1'] = 258,  ['torso_2'] = 0,
		['decals_1'] = 66,  ['decals_2'] = 1,
		['arms'] = 98,
		['pants_1'] = 23,   ['pants_2'] = 0,
		['shoes_1'] = 52,   ['shoes_2'] = 0,
		['helmet_1'] = 121, ['helmet_2'] = 0,
		['chain_1'] = 96,   ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 0,   ['bproof_2'] = 0
	  }
	}
}

Config.JobLocations = {
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19),
	vector3(293.02, -584.70, 43.19)
}
