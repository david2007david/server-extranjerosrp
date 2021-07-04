local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

  ESX = nil
  local PlayerData = {}

  Citizen.CreateThread(function()
	  while ESX == nil do
		  TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)
		  Citizen.Wait(0)
		  PlayerData = ESX.GetPlayerData()
	   end
   end)

  function hintToDisplay(text)
	  SetTextComponentFormat("STRING")
	  AddTextComponentString(text)
   end

  local PokeShops = {
	  { x = 273.54,  y = -832.93,  z = 29.41},
	}

  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for index, value in pairs(PokeShops) do
			  local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, value.x, value.y, value.z)
			  if dist < 7.5 then
				  DrawText3Ds(value.x, value.y, value.z + 1.0, 'Tienda VIP de Coins -E-')
				  if dist <= 1.0 then
					  if IsControlJustPressed(0, Keys['E']) then
						  AbrirMenuTienda()
					  end
				  end
			  end
		  end
	  end
  end)
  
  function hintToDisplay(text)
	  SetTextComponentFormat("STRING")
	  AddTextComponentString(text)
   end

  local PokeShops = {
	  { x = 273.54,  y = -832.93,  z = 28.41},
	}

  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  for index, value in pairs(PokeShops) do
			  local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, value.x, value.y, value.z)
			  if dist < 7.5 then
				  if dist <= 1.0 then
					  if IsControlJustPressed(0, Keys['E']) then
						  AbrirMenuTienda()
					  end
				  end
			  end
		  end
	  end
  end)  

  function AbrirMenuTienda()
	  ESX.UI.Menu.CloseAll()

	  ESX.UI.Menu.Open(
		  'default', GetCurrentResourceName(), 'PokeShops',
		  {
			  title    = 'Bienvenido/a al supermercado',
			  align    = 'right',
			  elements = {
				  {label = 'Vision Termica (1 coins)', value = 'water_1', item = 'visionnocturna', price = 1},
				  {label = 'esposas (1 coins)', value = 'water_1', item = 'handcuffs', price = 1},
				  {label = 'cuerdas (1 coins)', value = 'water_1', item = 'rope', price = 1},
			}
		  },
		  function(data, menu)
			  local item = data.current.item
			  local price = data.current.price
			  TriggerServerEvent('PokeShops:comprar', item, price)
		  end,
	  function(data, menu)
		  menu.close()
	  end)
  end

  --Blips
  local blips = {
	  {title="Tienda Coins", id=304, x = 273.54,  y = -832.93,  z = 29.41}
	}

  Citizen.CreateThread(function()
	  for _, info in pairs(blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.5)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	  end
  end)

  function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	SetTextScale(0.35, 0.35)
	SetTextFont(1)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 370
	DrawRect(_x,_y+0.0125, 0.015+ factor, 0.030, 66, 66, 66, 150)
  end
  
