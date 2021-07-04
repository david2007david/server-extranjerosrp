Config                 = {}
Config.DrawDistance    = 10.0
Config.MaxErrors       = 5
Config.SpeedMultiplier = 3.6
Config.Locale          = 'en'

Config.Prices = {
  air         = 500,
  aircraft    = 50000
}

Config.VehicleModels = {
  aircraft    = 'havok'
}

Config.SpeedLimits = {
  residence = 200,
  town      = 200,
  freeway   = 200
}

Config.Zones = {

  AIRSchool = {
    Pos   = {x = -951.81, y = -2994.42, z = 12.95},
    Size  = {x = 1.5, y = 1.5, z = 1.0},
    Color = {r = 204, g = 204, b = 0},
    Type  = 27
  },

  VehicleSpawnPoint = {
    Pos   = {x = -978.66, y = -2995.47, z = 13.95},
    Size  = {x = 1.5, y = 1.5, z = 1.0},
    Color = {r = 204, g = 204, b = 0},
    Type  = -1
  },

}

Config.CheckPoints = {

  {
    Pos = {x = -1025.16, y = -2971.52, z = 15.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('next_point_speed') .. Config.SpeedLimits['freeway'] .. 'km/h', 5000)
    end
  },

  {
    Pos = {x = -1025.17, y = -2971.51, z = 62.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = -890.54, y = -2669.12, z = 62.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      Citizen.CreateThread(function()
        DrawMissionText(_U('stop_for_ped'), 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(4000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText(_U('good_lets_cont'), 5000)

      end)
    end
  },

  {
    Pos = {x = -697.34, y = -2235.17, z = 171.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('freeway')

      Citizen.CreateThread(function()
        DrawMissionText(_U('stop_look_left') .. Config.SpeedLimits['freeway'] .. 'km/h', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(6000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText(_U('good_turn_right'), 5000)
      end)
    end
  },

  {
    Pos = {x = 7.44, y = -1528.99, z = 171.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('watch_traffic_lightson'), 5000)
    end
  },

  {
    Pos = {x = 178.7, y = -871.83, z = 344.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = -211.0, y = -451.34, z = 344.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('stop_for_passing'), 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
      FreezeEntityPosition(vehicle, true)
      Citizen.Wait(6000)
      FreezeEntityPosition(vehicle, false)
    end
  },

  {
    Pos = {x = -183.09, y = -1118.18, z = 344.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = 819.94, y = -1796.76, z = 344.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = -137.03, y = -1889.96, z = 344.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('freeway')

      DrawMissionText(_U('hway_time') .. Config.SpeedLimits['freeway'] .. 'km/h', 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
    end
  },

  {
    Pos = {x = -918.17, y = -1250.96, z = 344.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = -1510.9, y = -1051.97, z = 344.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = -2070.49, y = -1970.97, z = 344.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = -1027.64, y = -2339.69, z = 344.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('freeway')

      DrawMissionText(_U('in_town_speed') .. Config.SpeedLimits['freeway'] .. 'km/h', 5000)
    end
  },

  {
    Pos = {x = -293.45, y = -2475.1, z = 344.94},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('gratz_stay_alert'), 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
    end
  },

  {
    Pos = {x = -1074.76, y = -2947.19, z = 12.95},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      ESX.Game.DeleteVehicle(vehicle)
    end
  },

}
