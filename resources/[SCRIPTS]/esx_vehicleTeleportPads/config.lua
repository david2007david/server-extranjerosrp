--Script Name: esx_vehicleTeleportPads.
--Description: Teleport vehicles with people, or just people without a vehicle from one location to another location.
--Author: Unknown.
--Modified by: BossManNz.
--Credits: ElPumpo, TheStonedTurtle.

Config              = {}

Config.DrawDistance = 100.0

Config.Marker = {
	Type = 27,
	x = 1.5, y = 1.5, z = 1.0,
	r = 255, g = 155, b = 355
}

Config.Pads = {

	MartinHouseIn = {
		Text = 'Pulse ~INPUT_CONTEXT~ entrar ~y~bunker~s~.',
		Marker = { x = -755.0, y = 5943.76, z = 18.45 },
		TeleportPoint = { x = 889.01, y = -3243.76, z = -98.69 }
	},

	MartinHouseOut = {
		Text = 'Press ~INPUT_CONTEXT~ to salir ~y~bunker~s~.',
		Marker = { x = 893.8, y = -3245.88, z = -99.26 },
		TeleportPoint = { x = -746.59, y = 5946.49, z = 18.98 }
	},

	MoneyHouseIn = {
		Text = 'Pulse ~INPUT_CONTEXT~ salir ~y~Lavado de dinero~s~.',
		Marker = { x = 1138.16, y = -3198.65, z = -39.67 },
		TeleportPoint = { x = 5599.79, y = -5666.06, z = 11.44 }
	},

	MoneyHouseOut = {
		Text = 'Press ~INPUT_CONTEXT~ to entrar ~y~Lavado de dinero~s~.',
		Marker = { x = 5599.79, y = -5666.06, z = 10.5 },
		TeleportPoint = { x = 1138.16, y = -3198.65, z = -39.67 }
	},	

	MafiaHouseIn = {
		Text = 'Pulse ~INPUT_CONTEXT~ entrar ~y~mazmorras~s~.',
		Marker = { x = 5012.59, y = -5748.58, z = 28.00 },
		TeleportPoint = { x = 5012.59, y = -5746.64, z = 15.48 }
	},

	MafiaHouseOut = {
		Text = 'Press ~INPUT_CONTEXT~ to salir ~y~mazmorras~s~.',
		Marker = { x = 5012.59, y = -5746.64, z = 14.50 },
		TeleportPoint = { x = 5012.59, y = -5748.58, z = 28.00 }
	},	
	
	EmsHouseIn = {
		Text = 'Pulse ~INPUT_CONTEXT~ entrar ~y~helicoptero~s~.',
		Marker = { x = 332.23, y = -595.73, z = 43.28 },
		TeleportPoint = { x = 338.67, y = -583.64, z = 74.16 }
	},

	EmsHouseOut = {
		Text = 'Press ~INPUT_CONTEXT~ to salir ~y~helicoptero~s~.',
		Marker = { x = 338.67, y = -583.64, z = 74.16 },
		TeleportPoint = { x = 332.23, y = -595.73, z = 43.28 }
	},		

	FuenteBlancaHouseIn = {
		Text = 'Pulse ~INPUT_CONTEXT~ entrar ~y~casa~s~.',
		Marker = { x = 1394.45, y = 1141.8, z = 114.61 },
		TeleportPoint = { x = 1397.61, y = 1141.7, z = 114.33 }
	},

	MartinHouseOut = {
		Text = 'Press ~INPUT_CONTEXT~ to salir ~y~casa~s~.',
		Marker = { x = 1397.61, y = 1141.7, z = 114.33 },
		TeleportPoint = { x = 1394.45, y = 1141.8, z = 114.61 }
	},	
	
	SedeHouseIn = {
		Text = 'Pulse ~INPUT_CONTEXT~ entrar ~y~sede~s~.',
		Marker = { x = -1521.21, y = -2978.52, z = -80.42 },
		TeleportPoint = { x = -1171.89, y = -1177.52, z = 5.62 }
	},

	SedeHouseOut = {
		Text = 'Press ~INPUT_CONTEXT~ to salir ~y~sede~s~.',
		Marker = { x = -1171.89, y = -1177.52, z = 5.62 },
		TeleportPoint = { x = -1514.71, y = -2978.21, z = -81.01 }
	},	
	
	InstalacionesHouseIn = {
		Text = 'Pulse ~INPUT_CONTEXT~ entrar ~y~Submarino~s~.',
		Marker = { x = 3540.69, y = 3675.39, z = 28.12 },
		TeleportPoint = { x = 3540.69, y = 3675.39, z = 21.0 }
	},

	InstalacionesHouseOut = {
		Text = 'Press ~INPUT_CONTEXT~ to salir ~y~Submarino~s~.',
		Marker = { x = 3540.69, y = 3675.39, z = 21.0 },
		TeleportPoint = { x = 3540.69, y = 3675.39, z = 28.12 }
	},	
	
	SubmarinoHouseIn = {
		Text = 'Pulse ~INPUT_CONTEXT~ entrar ~y~Submarino~s~.',
		Marker = { x = 514.35, y = 4888.4, z = -62.59 },
		TeleportPoint = { x = 1013.82, y = -2897.83, z = 11.99 }
	},

	SubmarinoHouseOut = {
		Text = 'Press ~INPUT_CONTEXT~ to salir ~y~Submarino~s~.',
		Marker = { x = 1013.82, y = -2897.83, z = 11.99 },
		TeleportPoint = { x = 514.35, y = 4888.4, z = -62.59 }
	},	
	
	OficinasHouseIn = {
		Text = 'Pulse ~INPUT_CONTEXT~ entrar ~y~Oficinas~s~.',
		Marker = { x = -193.69, y = -579.53, z = 136.0 },
		TeleportPoint = { x = -160.1, y = -581.62, z = 32.42 }
	},

	OficinasHouseOut = {
		Text = 'Press ~INPUT_CONTEXT~ to salir ~y~Oficinas~s~.',
		Marker = { x = -160.1, y = -581.62, z = 32.42 },
		TeleportPoint = { x = -193.69, y = -579.53, z = 136.0 }
	},	
	
	TallerHouseIn = {
		Text = 'Pulse ~INPUT_CONTEXT~ entrar ~y~Taller~s~.',
		Marker = { x = -144.26, y = -576.99, z = 32.42 },
		TeleportPoint = { x = -141.34, y = -590.56, z = 166.58 }
	},

	TallerHouseOut = {
		Text = 'Press ~INPUT_CONTEXT~ to salir ~y~Taller~s~.',
		Marker = { x = -141.34, y = -590.56, z = 166.58 },
		TeleportPoint = { x = -144.26, y = -576.99, z = 32.42 }
	},	

	HeliHouseIn = {
		Text = 'Pulse ~INPUT_CONTEXT~ entrar ~y~tiendaplanes~s~.',
		Marker = { x = -1144.2, y = -3397.14, z = 13.95 },
		TeleportPoint = { x = -1265.96, y = -3034.19, z = -48.49 }
	},

	HeliHouseOut = {
		Text = 'Press ~INPUT_CONTEXT~ to salir ~y~tiendaplanes~s~.',
		Marker = { x = -1263.98, y = -3039.09, z = -48.49 },
		TeleportPoint = { x = -1133.31, y = -3376.89, z = 14.54 }
	}

}