local open = false
local ESX	 = nil

-- ESX
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- Open ID card
RegisterNetEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function( data, type )
	open = true
	SendNUIMessage({
		action = "open",
		array  = data,
		type   = type
	})
end)

-- Key events
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
			SendNUIMessage({
				action = "close"
			})
			open = false
		end
	end
end)

RegisterCommand("dni", function()
	if open then
		SendNUIMessage({
			action = "close"
		})
		open = false
	else
		openMenu()
		open = true
	end
end, false)

function openMenu()
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'id_card_menu',
	  {
		  title    = 'Identificación',
		  align 	= "right",
		  elements = {
			  {label = 'Ver DNI', value = 'checkID'},
			  {label = 'Mostrar DNI', value = 'showID'},
			  {label = 'Ver Licencia de conducir', value = 'checkDriver'},
			  {label = 'Mostrar licencia de conducir', value = 'showDriver'},
			  {label = 'Ver su licencia de armas', value = 'checkFirearms'},
			  {label = 'Mostrar su licencia de armas', value = 'showFirearms'},
		  }
	  },
	  function(data, menu)
		  local val = data.current.value
		  
		  if val == 'checkID' then
			menu.close()
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
		  elseif val == 'checkDriver' then
			menu.close()
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
		  elseif val == 'checkMedico' then
			menu.close()
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'medico')
		  elseif val == 'checkDonador' then
			menu.close()
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'donador')			
		  elseif val == 'checkFirearms' then
			menu.close()
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
		  else
			
			local player, distance = ESX.Game.GetClosestPlayer()
			  
			  if distance ~= -1 and distance <= 1.5 then
				  if val == 'showID' then
					menu.close()
					  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
				elseif val == 'showDriver' then
					menu.close()
					TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
				elseif val == 'showMedico' then
					menu.close()
					TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'medico')
				elseif val == 'showDonador' then
					menu.close()
					TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'donador')					
				elseif val == 'showFirearms' then
					menu.close()
					TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
				end
			else
				ESX.ShowNotification('No players nearby')
			end
		end
	end,
	function(data, menu)
		menu.close()
	end)
end