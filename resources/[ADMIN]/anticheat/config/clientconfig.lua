Config = {}
Config.Locale = 'es'

Config.AntiResourceStopCheck = false
Config.AntiResourceStartCheck = false --Se activará si se inicia un nuevo recurso
Config.AntiSpectate = true -- Banea si un jugador usa el modo spectate
Config.AntiBMCGLOBAL = false --Detecta si un jugador ejecuta un executor
Config.AntiCMD = true -- Detecta si un jugador startea otro script o mennu .lua
Config.AntiCheatEngine = true -- Detecta si un jugador usa el Cheat Engine
Config.AntiInyection = true --Banea si un jugador se injecta un menu
Config.AntiInyectionv2 = true --Banea si un jugador se injecta un menu
Config.AntiCheat = true -- Activa el AC
Config.AntiCarDetroy = false --Detecta si un coche esta roto y lo elimina
Config.AntiCarRam = false
Config.AntiGodmode = false -- Detecta si un jugador tiene GodMode
Config.AntiBlips = false  -- Detecta si un jugador tiene los blips de los jugadores
Config.PlayerProtection = true -- Proteccion para el jugador de explosiones
Config.AntiPedAttack = true  -- Anti ped con armas
Config.AntiBlackweapons = true
Config.AntiCarBlack    = true --Detecta y elimina si alguien se sube a un coche prohibido
Config.MiniMap         = false --Activa el MiniMapa

-- Detecta si un jugador puso una tecla prohibida
Config.AntiKey       = false
Config.AntiKeyInsert = false
Config.AntiKeyALTF8  = false
Config.AntiKeyShiftG = false
Config.AntiKeyct5rlf8 = false

-- Coches prohibidos
Config.CarsBL = {
	  "vigilante",
	  "hydra",
	  "buzzard",
	  "deluxo",
	  "avenger",
	  "akula",
	  "apc",
	  "barrage",
	  "caracara",
	  --"cargobob",
	  "chernobog",
	  "hunter",
	  "insurgent",
	  "starling",
	  "lazer",
	  "bombushka",
	  "savage",
	  "rhino",
	  "khanjali"
}
-- Peds prohibidos
Config.PEDBLACK = {
    --"CSB_BallasOG",
	--"MP_S_ARMOURED_01",
	--"S_F_Y_Cop_01",
	--"S_F_Y_Cop_02",
	--"S_F_Y_Cop_03",
	--"S_M_Y_Cop_01",
	--"S_M_Y_Cop_02",
	--"S_M_Y_Cop_03",
	--"A_C_MtLion",
	--"S_F_Y_Sheriff_01",
	--"S_F_Y_Sheriff_02",
	--"S_F_Y_Sheriff_03",
	--"S_M_Y_Marine_01",
	--"S_M_Y_Marine_02",
	--"S_M_Y_Marine_03",
	--"S_M_SECURITY_01",
	--"S_M_SECURITY_02",
	--"s_m_y_swat_01",
	--"a_m_y_mexthug_01",
	--"u_m_y_zombie_01",
	--"S_M_SECURITY_03",
	--"s_m_y_swat_01",
	--"S_M_Y_ARMYMECH_01",
	--"S_M_Y_ARMYMECH_02",
	--"S_M_Y_ARMYMECH_03",
	--"S_M_Y_BLACKOPS_01",
	--"S_M_Y_BLACKOPS_02",
	--"S_M_Y_BLACKOPS_03"
}
-- Armas prohibidos
Config.WeaponBL={
	  "WEAPON_HAMMER",
	  "WEAPON_GOLFCLUB",
	  "WEAPON_SAWNOFFSHOTGUN",
	  "WEAPON_GRENADELAUNCHER",
	  "WEAPON_GRENADELAUNCHER_SMOKE",
	  "WEAPON_RPG",
	  "WEAPON_STINGER",
	  "WEAPON_GRENADE",
	  "WEAPON_FIREWORK",
	  "WEAPON_BOTTLE",
	  "WEAPON_GARBAGEBAG",
	  "WEAPON_RAILGUN",
	  "WEAPON_RAILPISTOL",
	  "WEAPON_RAILGUN",
	  "WEAPON_RAYPISTOL", 
	  "WEAPON_RAYCARBINE", 
	  "WEAPON_RAYMINIGUN",
	  "WEAPON_DIGISCANNER",
	  "WEAPON_SPECIALCARBINE_MK2",
	  "WEAPON_BULLPUPRIFLE_MK2",
	  "WEAPON_PUMPSHOTGUN_MK2",
	  "WEAPON_MARKSMANRIFLE_MK2",
	  "WEAPON_COMPACTLAUNCHER",
	  "WEAPON_SNSPISTOL_MK2",
	  "WEAPON_REVOLVER_MK2",
	  "WEAPON_FIREWORK",
	  "WEAPON_HOMINGLAUNCHER", 
	  "WEAPON_SMG_MK2"
}
-- Objetos prohibidos
Config.ObjectsBL={
	  "hei_prop_carrier_radar_1_l1",
	  "v_res_mexball",
	  "prop_rock_1_a",
	  "blimp",
	  "jet",
	  "prop_rock_1_b",
	  "stt_prop_stunt_jump45",
	  "stt_prop_stunt_jump15",
	  "sr_prop_spec_tube_xxs_01a",
	  "stt_prop_stunt_jump30",
	  "stt_prop_stunt_jump_l",
	  "ar_prop_ar_stunt_block_01a",
	  "stt_prop_stunt_track_bumps",
	  "stt_prop_stunt_jump_lb",
	  "stt_prop_stunt_jump_loop",
	  "stt_prop_stunt_jump_m",
	  "stt_prop_stunt_jump_mb",
	  "stt_prop_stunt_jump_s",
	  "stt_prop_stunt_jump_sb",
	  "stt_prop_ramp_adj_flip_m",
	  "prop_contnr_pile_01a",
	  "ce_xr_ctr2",
	  "hei_prop_carrier_jet",
	  "stt_prop_stunt_track_start",
	  "prop_parking_hut_2",
	  "db_apart_03_",
	  "db_apart_09_",
	  "stt_prop_stunt_tube_l",
	  "stt_prop_stunt_track_dwuturn",
	  "stt_prop_ramp_adj_flip_mb",
	  "stt_prop_ramp_adj_flip_s",
	  "stt_prop_ramp_adj_flip_sb",
	  "stt_prop_ramp_adj_hloop",
	  "stt_prop_ramp_adj_loop",
	  "stt_prop_ramp_jump_l",
	  "stt_prop_ramp_jump_m",
	  "stt_prop_ramp_jump_s",
	  "stt_prop_ramp_jump_xl",
	  "stt_prop_ramp_jump_xs",
	  "stt_prop_ramp_jump_xxl",
	  "stt_prop_ramp_multi_loop_rb",
	  "stt_prop_ramp_spiral_l",
	  "stt_prop_ramp_spiral_l_l",
	  "stt_prop_ramp_spiral_l_m",
	  "stt_prop_ramp_spiral_l_s",
	  "stt_prop_ramp_spiral_l_xxl",
	  "stt_prop_ramp_spiral_m",
	  "stt_prop_ramp_spiral_s",
	  "stt_prop_ramp_spiral_xxl",
	  "prop_fnclink_05crnr1",
	  "xs_prop_hamburgher_wl",
	  "xs_prop_plastic_bottle_wl",
	  "prop_windmill_01",
	  "prop_beach_fire",
	  "0x34315488",
	  -145066854,
	  "p_spinning_anus_s"
}