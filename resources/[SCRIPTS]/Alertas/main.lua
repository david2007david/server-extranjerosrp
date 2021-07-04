local PlayerData = {}

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

Citizen.CreateThread(function()
  while true do
 Citizen.Wait(1000)
   Look()
  end
end)


function Look()
   ESX.TriggerServerCallback('Alertas', function(found)
    ver = found
     if ver == 0 then
     TriggerEvent('logo:display', false)
     TriggerEvent('alt:dos', false)
     TriggerEvent('alt:tre', false)
     TriggerEvent('alt:cua', false)
     TriggerEvent('alt:sin', false)
    end
   if ver == 1 then
    TriggerEvent('logo:display', true)
    TriggerEvent('alt:dos', false)
    TriggerEvent('alt:tre', false)
    TriggerEvent('alt:cua', false)
    TriggerEvent('alt:sin', false)
    end
   if ver == 2 then
    TriggerEvent('logo:display', false)
    TriggerEvent('alt:dos', true)
    TriggerEvent('alt:tre', false)
    TriggerEvent('alt:cua', false)
    TriggerEvent('alt:sin', false)
     end
   if ver == 3 then
    TriggerEvent('logo:display', false)
    TriggerEvent('alt:dos', false)
    TriggerEvent('alt:tre', true)
    TriggerEvent('alt:cua', false)
    TriggerEvent('alt:sin', false)
     end
   if ver == 4 then
    TriggerEvent('logo:display', false)
    TriggerEvent('alt:dos', false)
    TriggerEvent('alt:tre', false)
    TriggerEvent('alt:cua', true)
    TriggerEvent('alt:sin', false)
     end
   if ver == 5 then
    TriggerEvent('logo:display', false)
    TriggerEvent('alt:dos', false)
    TriggerEvent('alt:tre', false)
    TriggerEvent('alt:cua', false)
    TriggerEvent('alt:sin', true) 
end
    end)
    end
function tesu()
end
function tesd()
end
AddEventHandler('onClientMapStart', function()
  Citizen.CreateThread(function()
    local display = true
    local startTime = GetGameTimer()
    local delay = 4000 
    while display do
      Citizen.Wait(1)
      if (GetTimeDifference(GetGameTimer(), startTime) > delay) then
      end
    end
  end)
end)
RegisterNetEvent('logo:display')
AddEventHandler('logo:display', function(value)
  SendNUIMessage({
    type = "logod",
    display = value
  })
end)
RegisterNetEvent('alt:dos')
AddEventHandler('alt:dos', function(value)
  SendNUIMessage({
    type = "ald",
    display = value
  })
end)
RegisterNetEvent('alt:tre')
AddEventHandler('alt:tre', function(value)
  SendNUIMessage({
    type = "alt",
    display = value
  })
end)
RegisterNetEvent('alt:cua')
AddEventHandler('alt:cua', function(value)
  SendNUIMessage({
    type = "alc",
    display = value
  })
end)
RegisterNetEvent('alt:sin')
AddEventHandler('alt:sin', function(value)
  SendNUIMessage({
    type = "als",
    display = value
  })
end)

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end
