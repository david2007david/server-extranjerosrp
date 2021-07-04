local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

	 {title="Bahamas", colour=61, id=93, x = -1388.16, y = -586.99, z = 30.22},
   {title="Tiendas", colour=2, id=52, x = 373.875,   y = 325.896,  z = 102.566},
   {title="Tiendas", colour=2, id=52, x = 2557.458,  y = 382.282,  z = 107.622},
   {title="Tiendas", colour=2, id=52, x = -3038.939, y = 585.954,  z = 6.908},
   {title="Tiendas", colour=2, id=52, x = -3241.927, y = 1001.462, z = 11.830},
   {title="Tiendas", colour=2, id=52, x = 547.431,   y = 2671.710, z = 41.156},
   {title="Tiendas", colour=2, id=52, x = 1961.464,  y = 3740.672, z = 31.343},
   {title="Tiendas", colour=2, id=52, x = 2678.916,  y = 3280.671, z = 54.241},
   {title="Tiendas", colour=2, id=52, x = 1729.216,  y = 6414.131, z = 34.037},
   {title="Tiendas", colour=2, id=52, x = 1135.808,  y = -982.281,  z = 45.415},
   {title="Tiendas", colour=2, id=52, x = -1222.915, y = -906.983,  z = 11.326},
   {title="Tiendas", colour=2, id=52, x = -1487.553, y = -379.107,  z = 39.163},
   {title="Tiendas", colour=2, id=52, x = -2968.243, y = 390.910,   z = 14.043},
   {title="Tiendas", colour=2, id=52, x = 1166.024,  y = 2708.930,  z = 37.157},
   {title="Tiendas", colour=2, id=52, x = 1392.562,  y = 3604.684,  z = 33.980},
   {title="Tiendas", colour=61, id=121, x = 127.830,   y = -1284.796, z = 28.280},
  -- {title="Tiendas", colour=2, id=52, x = -1393.409, y = -606.624,  z = 29.319}, --Tquilala
   {title="Tiendas", colour=2, id=52, x = 161.23, y = 6640.51,  z = 31.61},
   {title="Tiendas", colour=61, id=93, x = -559.906,  y = 287.093,   z = 81.176}, --Bahamas
   {title="Tiendas", colour=2, id=52, x = -48.519,   y = -1757.514, z = 28.421},
   {title="Tiendas", colour=2, id=52, x = 1163.373,  y = -323.801,  z = 68.205},
   {title="Tiendas", colour=2, id=52, x = -707.501,  y = -914.260,  z = 18.215},
   {title="Tiendas", colour=2, id=52, x = -1820.523, y = 792.518,   z = 137.118},
   {title="Tiendas", colour=2, id=52, x = 1698.388,  y = 4924.404,  z = 41.063},
   {title="Tiendas", colour=2, id=52, x = -1042.487,  y = -2745.236,  z = 20.50},
   {title="Tiendas", colour=2, id=52, x = 190.43,  y = -889.62,  z = 29.71},
  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)