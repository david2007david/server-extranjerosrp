-- Settings
local depositAtATM = true -- Allows the player to deposit at an ATM rather than only in banks (Default: false)
local giveCashAnywhere = false -- Allows the player to give CASH to another player, no matter how far away they are. (Default: false)
local withdrawAnywhere = false -- Allows the player to withdraw cash from bank account anywhere (Default: false)
local depositAnywhere = false -- Allows the player to deposit cash into bank account anywhere (Default: false)
local displayBankBlips = true -- Toggles Bank Blips on the map (Default: true)
local displayAtmBlips = false -- Toggles ATM blips on the map (Default: false) // THIS IS UGLY. SOME ICONS OVERLAP BECAUSE SOME PLACES HAVE MULTIPLE ATM MACHINES. NOT RECOMMENDED
local enableBankingGui = true -- Enables the banking GUI (Default: true) // MAY HAVE SOME ISSUES

-- ATMS
local atms = {
  [1] = -1126237515,
  [2] = 506770882,
  [3] = -870868698,
  [4] = 150237004,
  [5] = -239124254,
  [6] = -1364697528,  
}


v_5_b_atm1=150237004 
v_5_b_atm2=-239124254 

prop_atm_03=-1364697528 


RegisterNetEvent('bank:checkATM')
AddEventHandler('bank:checkATM', function()
  if IsNearATM() then
    atmOpen = true
    openGui()
    bankOpen = true
  else
    TriggerEvent("DoLongHudText","No ATM.",2)
  end
end)

function IsNearATM()
  for i = 1, #atms do
    local objFound = GetClosestObjectOfType( GetEntityCoords(GetPlayerPed(-1)), 0.75, atms[i], 0, 0, 0)

    if DoesEntityExist(objFound) then
      TaskTurnPedToFaceEntity(GetPlayerPed(-1), objFound, 3.0)
      return true
    end
  end

  return false
end
-- Banks
local banks = {
  {name="Bank", id=108, x=150.26,      y=-1040.20,   z=29.37},
  {name="Bank", id=108, x=-1212.98,    y=-330.84,    z=37.78},
  {name="Bank", id=108, x=-2962.58,    y=482.62,     z=15.70},
  {name="Bank", id=108, x=-112.20,     y=6469.29,    z=31.62},
  {name="Bank", id=108, x=314.18,      y=-278.62,    z=54.17},
  {name="Bank", id=108, x=-351.53,     y=-49.52,     z=49.04},
  {name="Bank", id=108, x=241.72,      y=220.70,     z=106.28},
  {name="Bank", id=108, x=1175.06,     y=2706.64,    z=38.09},
  {name="Bank", id=0, x =437.12,     y= -987.57,   z= 30.69},

--ATM
  {name="Bank", x=-386.733,    y=6045.953,   z=31.501},
  {name="Bank", x=-284.037,    y=6224.385,   z=31.187},
  {name="Bank", x=-284.037,    y=6224.385,   z=31.187},
  {name="Bank", x=-135.165,    y=6365.738,   z=31.101},
  {name="Bank", x=-110.753,    y=6467.703,   z=31.784},
  {name="Bank", x=-94.9690,    y=6455.301,   z=31.784},
  {name="Bank", x=155.4300,    y=6641.991,   z=31.784},
  {name="Bank", x=174.6720,    y=6637.218,   z=31.784},
  {name="Bank", x=1703.138,    y=6426.783,   z=32.730},
  {name="Bank", x=1735.114,    y=6411.035,   z=35.164},
  {name="Bank", x=1702.842,    y=4933.593,   z=42.051},
  {name="Bank", x=1967.333,    y=3744.293,   z=32.272},
  {name="Bank", x=1821.917,    y=3683.483,   z=34.244},
  {name="Bank", x=1174.532,    y=2705.278,   z=38.027},
  {name="Bank", x=540.0420,    y=2671.007,   z=42.177},
  {name="Bank", x=2564.399,    y=2585.100,   z=38.016},
  {name="Bank", x=2558.683,    y=349.6010,   z=108.050},
  {name="Bank", x=2558.051,    y=389.4817,   z=108.660},
  {name="Bank", x=1077.692,    y=-775.796,   z=58.218},
  {name="Bank", x=1139.018,    y=-469.886,   z=66.789},
  {name="Bank", x=1168.975,    y=-457.241,   z=66.641},
  {name="Bank", x=1153.884,    y=-326.540,   z=69.245},
  {name="Bank", x=381.2827,    y=323.2518,   z=103.270},
  {name="Bank", x=236.4638,    y=217.4718,   z=106.840},
  {name="Bank", x=265.0043,    y=212.1717,   z=106.780},
  {name="Bank", x=285.2029,    y=143.5690,   z=104.970},
  {name="Bank", x=157.7698,    y=233.5450,   z=106.450},
  {name="Bank", x=-164.568,    y=233.5066,   z=94.919},
  {name="Bank", x=-1827.04,    y=785.5159,   z=138.020},
  {name="Bank", x=-1409.39,    y=-99.2603,   z=52.473},
  {name="Bank", x=-1205.35,    y=-325.579,   z=37.870},
  {name="Bank", x=-1215.64,    y=-332.231,   z=37.881},
  {name="Bank", x=-2072.41,    y=-316.959,   z=13.345},
  {name="Bank", x=-2975.72,    y=379.7737,   z=14.992},
  {name="Bank", x=-2962.60,    y=482.1914,   z=15.762},
  {name="Bank", x=-2955.70,    y=488.7218,   z=15.486},
  {name="Bank", x=-3044.22,    y=595.2429,   z=7.595},
  {name="Bank", x=-3144.13,    y=1127.415,   z=20.868},
  {name="Bank", x=-3241.10,    y=996.6881,   z=12.500},
  {name="Bank", x=-3241.11,    y=1009.152,   z=12.877},
  {name="Bank", x=-1305.40,    y=-706.240,   z=25.352},
  {name="Bank", x=-538.225,    y=-854.423,   z=29.234},
  {name="Bank", x=-711.156,    y=-818.958,   z=23.768},
  {name="Bank", x=-717.614,    y=-915.880,   z=19.268},
  {name="Bank", x=-526.566,    y=-1222.90,   z=18.434},
  {name="Bank", x=-256.831,    y=-719.646,   z=33.444},
  {name="Bank", x=-203.548,    y=-861.588,   z=30.205},
  {name="Bank", x=112.4102,    y=-776.162,   z=31.427},
  {name="Bank", x=112.9290,    y=-818.710,   z=31.386},
  {name="Bank", x=119.9000,    y=-883.826,   z=31.191},
  {name="Bank", x=149.4551,    y=-1038.95,   z=29.366},
  {name="Bank", x=-846.304,    y=-340.402,   z=38.687},
  {name="Bank", x=-1204.35,    y=-324.391,   z=37.877},
  {name="Bank", x=-1216.27,    y=-331.461,   z=37.773},
  {name="Bank", x=-56.1935,    y=-1752.53,   z=29.452},
  {name="Bank", x=-261.692,    y=-2012.64,   z=30.121},
  {name="Bank", x=-273.001,    y=-2025.60,   z=30.197},
  {name="Bank", x=314.187,     y=-278.621,   z=54.170},
  {name="Bank", x=-351.534,    y=-49.529,    z=49.042},
  {name="Bank", x=24.589,      y=-946.056,   z=29.357},
  {name="Bank", x=-254.112,    y=-692.483,   z=33.616},
  {name="Bank", x=-1570.197,   y=-546.651,   z=34.955},
  {name="Bank", x=-1415.909,   y=-211.825,   z=46.500},
  {name="Bank", x=-1430.112,   y=-211.014,   z=46.500},
  {name="Bank", x=33.232,      y=-1347.849,  z=29.497},
  {name="Bank", x=129.216,     y=-1292.347,  z=29.269},
  {name="Bank", x=287.645,     y=-1282.646,  z=29.659},
  {name="Bank", x=289.012,     y=-1256.545,  z=29.440},
  {name="Bank", x=295.839,     y=-895.640,   z=29.217},
  {name="Bank", x=1686.753,    y=4815.809,   z=42.008},
  {name="Bank", x=-302.408,    y=-829.945,   z=32.417},
  {name="Bank", x=5.134,       y=-919.949,   z=29.557},
  {name="Bank", x=374.31,      y=-831.65,    z=29.30},      --Bureau de Tabac
  {name="Bank", x=315.21,      y=-593.70,    z=43.28},      --Hôpital
  {name="Bank", x=231.11,      y=367.53,     z=106.11},     --Auto-école
  {name="Bank", x=2742.50,     y=3464.69,    z=55.66}       --Métro
}	

-- Display Map Blips
Citizen.CreateThread(function()
  if (displayBankBlips == true) then
    for _, item in pairs(banks) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipAsShortRange(item.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
  end
end)

-- NUI Variables
local atBank = false
local atATM = false
local bankOpen = false
local atmOpen = false

-- Open Gui and Focus NUI
function openGui()
  bankanimation()
  Citizen.Wait(1400)
  SetNuiFocus(true, true)
  SendNUIMessage({openBank = true})
  TriggerServerEvent('bank:balance')
  TriggerEvent("banking:viewCash")

  
end

-- Close Gui and disable NUI
function closeGui()
  SetNuiFocus(false, false)
  SendNUIMessage({openBank = false})
  bankOpen = false
  atmOpen = false
  bankanimation()
end

RegisterCommand('atm', function()

  TriggerEvent("bank:checkATM")
end)

atmuse = false
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 
function bankanimation()
    local player = GetPlayerPed( -1 )
    if IsNearATM() then
      if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 

            loadAnimDict( "amb@prop_human_atm@male@enter" )
            loadAnimDict( "amb@prop_human_atm@male@exit" )
            loadAnimDict( "amb@prop_human_atm@male@idle_a" )

          if ( atmuse ) then 
              ClearPedTasks(GetPlayerPed(-1))
              TaskPlayAnim( player, "amb@prop_human_atm@male@exit", "exit", 1.0, 1.0, -1, 49, 0, 0, 0, 0 )
              atmuse = false
              local finished = exports["np-taskbar"]:taskBar(3000,"Carte bleu retirer")
				Wait(3000)
              ClearPedTasksImmediately(GetPlayerPed(-1))
          else
              atmuse = true
              TaskPlayAnim( player, "amb@prop_human_atm@male@idle_a", "idle_b", 1.0, 1.0, -1, 49, 0, 0, 0, 0 )
          end
      end
    else
        if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 

            loadAnimDict( "mp_common" )

            if ( atmuse ) then 
                ClearPedTasks(GetPlayerPed(-1))
                TaskPlayAnim( player, "mp_common", "givetake1_a", 1.0, 1.0, -1, 49, 0, 0, 0, 0 )
                atmuse = false
                local finished = exports["np-taskbar"]:taskBar(1000,"Carte bleu retirer")
				Wait(1000)
                ClearPedTasksImmediately(GetPlayerPed(-1))
            else
                atmuse = true
                TaskPlayAnim( player, "mp_common", "givetake1_a", 1.0, 1.0, -1, 49, 0, 0, 0, 0 )
                Citizen.Wait(1000)
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)

    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

-- If GUI setting turned on, listen for INPUT_PICKUP keypress
if enableBankingGui then
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(1)

      local ply = GetPlayerPed(-1)
      local plyCoords = GetEntityCoords(ply, 0)
      local closestbank = 1000.0
      local scanid = 0

      if not (IsInVehicle()) and not bankOpen then
        for i = 1, #banks do
          local distance = GetDistanceBetweenCoords(banks[i].x, banks[i].y, banks[i].z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
          if(distance < closestbank) then
            scanid = i
            closestbank = distance
          end
        end
      end

      if(closestbank < 1.5 and scanid ~= 0) then
          local cdst = closestbank
          while cdst < 1.5 do
            Citizen.Wait(1)

            local plyCoords = GetEntityCoords(ply, 0)
            cdst = GetDistanceBetweenCoords(banks[scanid].x, banks[scanid].y, banks[scanid].z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
            
            
               DrawText3D(banks[scanid].x, banks[scanid].y, banks[scanid].z,"Pulse ~r~[E] ~g~Para ver su cuenta")
             -- if not IsInVehicle() then exports["np-base"]:getModule("Util"):MissionText("Press '~b~Context Action Key~w~' (Default: ~b~E~w~) to view your account", 500) else exports["np-base"]:getModule("Util"):MissionText("You ~r~cannot~w~~w~ use the bank in a vehicle", 500) end
              atBank = true
              if IsControlJustPressed(1, 38)  then -- IF INPUT_PICKUP Is pressed
                  openGui()
                  bankOpen = true
              end
              if bankOpen then
                Citizen.Wait(1000)
              end
          end
      else

        if(atmOpen or bankOpen) then
          closeGui()
          atmOpen = false
          bankOpen = false
        end
        if atBank then
          atBank = false
        end

        Citizen.Wait(math.ceil(closestbank*20))
      end
    end
  end)
end

-- Disable controls while GUI open
Citizen.CreateThread(function()
  while true do
    if bankOpen or atmOpen then
      local ply = GetPlayerPed(-1)
      local active = true
      DisableControlAction(0, 1, active) -- LookLeftRight
      DisableControlAction(0, 2, active) -- LookUpDown
      DisableControlAction(0, 24, active) -- Attack
      DisablePlayerFiring(ply, true) -- Disable weapon firing
      DisableControlAction(0, 142, active) -- MeleeAttackAlternate
      DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
      if IsDisabledControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
        SendNUIMessage({type = "click"})
      end
    end
    Citizen.Wait(0)
  end
end)

-- NUI Callback Methods
RegisterNUICallback('close', function(data, cb)
  closeGui()
  cb('ok')
end)

RegisterNUICallback('balance', function(data, cb)
TriggerServerEvent('bank:balance')
  SendNUIMessage({openSection = "balance"})
  cb('ok')
end)

RegisterNUICallback('withdraw', function(data, cb)
  SendNUIMessage({openSection = "withdraw"})
  cb('ok')
end)

RegisterNUICallback('deposit', function(data, cb)
  SendNUIMessage({openSection = "deposit"})
  cb('ok')
end)

RegisterNUICallback('transfer', function(data, cb)
  SendNUIMessage({openSection = "transfer"})
  cb('ok')
end)

RegisterNUICallback('quickCash', function(data, cb)
  TriggerEvent('bank:withdPorruraw', 100)
  cb('ok')
end)

RegisterNUICallback('withdrawSubmit', function(data, cb)
  TriggerEvent('bank:withdPorruraw', tonumber(data.amount))
  cb('ok')
end)

RegisterNUICallback('depositSubmit', function(data, cb)
  TriggerEvent('bank:depPorruosit', tonumber(data.amount))
  cb('ok')
end)

RegisterNUICallback('transferSubmit', function(data, cb)
  local fromPlayer = GetPlayerServerId();
  TriggerEvent('bank:tranPorrusfer', tonumber(fromPlayer), tonumber(data.toPlayer), tonumber(data.amount))
  cb('ok')
end)

-- Check if player is near an atm


-- Check if player is in a vehicle
function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

-- Check if player is near a bank
function IsNearBank()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(banks) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 2) then
      return true
    end
  end
end

-- Check if player is near another player
function IsNearPlayer(player)
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  local ply2 = GetPlayerPed(GetPlayerFromServerId(player))
  local ply2Coords = GetEntityCoords(ply2, 0)
  local distance = Vdist2(plyCoords, ply2Coords)
  if(distance <= 5) then
    return true
  end
end

-- Process deposit if conditions met
RegisterNetEvent('bank:depPorruosit')
AddEventHandler('bank:depPorruosit', function(amount)
  if(IsNearBank() == true ) then
    if (IsInVehicle()) then
      --print("You ~r~cannot~w~ use the ATM in a vehicle")
	  exports['mythic_notify']:SendAlert('inform', 'You cannot use the ATM in a vehicle')
	  --exports["np-base"]:getModule("Util"):MissionText("You ~r~cannot~w~ use the ATM in a vehicle", 500)
    else
      TriggerServerEvent("bank:depPorruosit", tonumber(amount))
	  TriggerServerEvent('bank:balance')
	  TriggerEvent('banking:viewBalance')
	  TriggerEvent('banking:viewCash')
    end
  else
	if depositAtATM then
	  TriggerServerEvent("bank:depPorruosit", tonumber(amount))
	  TriggerServerEvent('bank:balance')
	  TriggerEvent('banking:viewBalance')
	  TriggerEvent('banking:viewCash')
	else
    --exports["np-base"]:getModule("Util"):MissionText("You ~r~cannot~w~ deposit at an ATM", 2000)
	--print("You ~r~cannot~w~ deposit at an ATM")
	exports['mythic_notify']:SendAlert('inform', 'You cannot deposit at an ATM')
	end
  end
end)

-- Process withdraw if conditions met
RegisterNetEvent('bank:withdPorruraw')
AddEventHandler('bank:withdPorruraw', function(amount)
  if(IsNearATM() == true or IsNearBank() == true) then
    if (IsInVehicle()) then
      --print("You ~r~cannot~w~ use the bank in a vehicle")
	  exports['mythic_notify']:SendAlert('inform', 'You cannot use the bank in a vehicle')
	  --exports["np-base"]:getModule("Util"):MissionText("You ~r~cannot~w~ use the bank in a vehicle", 500)
    else
      TriggerServerEvent("bank:withdPorruraw", tonumber(amount))
      TriggerServerEvent('bank:balance')
	  TriggerEvent('banking:viewBalance')
	  TriggerEvent('banking:viewCash')
    end
  end
end)

-- Process give dm if conditions met
RegisterNetEvent('dirtyMoney:givedm')
AddEventHandler('dirtyMoney:givedm', function(toPlayer, amount)
  if not IsNearPlayer(toPlayer) then TriggerEvent('chatMessage', "", {255, 0, 0}, "^1You are not near this player!") return end

  local target = GetPlayerFromServerId(tonumber(toPlayer))
  local targetPos = GetEntityCoords(GetPlayerPed(target))

  local userCoords = GetEntityCoords(GetPlayerPed(-1))

  if Vdist2(targetPos, userCoords) > 15.0 then
      TriggerEvent('chatMessage', "", {255, 0, 0}, "^1You are not near this player!")
      return
  end

  local player2 = GetPlayerFromServerId(tonumber(toPlayer))
  local playing = IsPlayerPlaying(player2)
  
  if (playing ~= false) then
    TriggerServerEvent("dirtyMoney:givedm", toPlayer, tonumber(amount))
  else
    TriggerEvent('chatMessage', "", {255, 0, 0}, "^1This player is not online!");
  end
end)



-- Process give cash if conditions met
RegisterNetEvent('bank:givecash')
AddEventHandler('bank:givecash', function(toPlayer, amount)
  if not IsNearPlayer(toPlayer) then TriggerEvent('chatMessage', "", {255, 0, 0}, "^1You are not near this player!") return end

  local target = GetPlayerFromServerId(tonumber(toPlayer))
  local targetPos = GetEntityCoords(GetPlayerPed(target))

  local userCoords = GetEntityCoords(GetPlayerPed(-1))

  if Vdist2(targetPos, userCoords) > 15.0 then
      TriggerEvent('chatMessage', "", {255, 0, 0}, "^1You are not near this player!")
      return
  end

  local player2 = GetPlayerFromServerId(tonumber(toPlayer))
  local playing = IsPlayerPlaying(player2)
  
  if (playing ~= false) then
    TriggerServerEvent("bank:givecash", toPlayer, tonumber(amount))
  else
    TriggerEvent('chatMessage', "", {255, 0, 0}, "^1This player is not online!");
  end
end)

-- Process bank transfer if player is online
RegisterNetEvent('bank:tranPorrusfer')
AddEventHandler('bank:tranPorrusfer', function(fromPlayer, toPlayer, amount)
  local player2 = GetPlayerFromServerId(toPlayer)
  local playing = IsPlayerPlaying(player2)
  if (playing ~= false) then
    TriggerServerEvent("bank:tranPorrusfer", toPlayer, tonumber(amount))
  else
    TriggerEvent('chatMessage', "", {255, 0, 0}, "^1This player is not online!");
  end
  TriggerServerEvent('bank:balance')
end)

-- Send NUI message to update bank balance
RegisterNetEvent('banking:updateBalance')
AddEventHandler('banking:updateBalance', function(balance2, show)
  local id = PlayerId()
  local playerName = GetPlayerName(id)
	SendNUIMessage({
		updateBalance = true,
		balance = tonumber(balance2),
    player = playerName,
    show = show
	})
end)

RegisterNetEvent('banking:updateCash')
AddEventHandler('banking:updateCash', function(balance, show)
  local id = PlayerId()
  local playerName = GetPlayerName(id)
	SendNUIMessage({
		updateCash = true,
		cash = balance,
    show = show
	})
end)

RegisterNetEvent("banking:viewBalance")
AddEventHandler("banking:viewBalance", function()
  SendNUIMessage({
    viewBalance = true
  })
end)

-- Send NUI Message to display add balance popup
RegisterNetEvent("banking:addBalance")
AddEventHandler("banking:addBalance", function(amount)
	SendNUIMessage({
		addBalance = true,
		amount = amount
	})
end)

RegisterNetEvent("banking:removeBalance")
AddEventHandler("banking:removeBalance", function(amount)
	SendNUIMessage({
		removeBalance = true,
		amount = amount
	})
end)

RegisterNetEvent("banking:addCash")
AddEventHandler("banking:addCash", function(amount)
	SendNUIMessage({
		addCash = true,
		amount = amount
	})
end)

-- Send NUI Message to display remove balance popup
RegisterNetEvent("banking:removeCash")
AddEventHandler("banking:removeCash", function(amount)
	SendNUIMessage({
		removeCash = true,
		amount = amount
	})
end)

RegisterNetEvent("np-base:addedMoney")
AddEventHandler("np-base:addedMoney", function(amt, total)
    TriggerEvent("banking:updateCash", total)
    TriggerEvent("banking:addCash", amt)
end)

RegisterNetEvent("np-base:removedMoney")
AddEventHandler("np-base:removedMoney", function(amt, total)
    TriggerEvent("banking:updateCash", total)
    TriggerEvent("banking:removeCash", amt)
end)


RegisterNetEvent("banking:viewCash")
AddEventHandler("banking:viewCash", function()
  SendNUIMessage({
		viewCash = true
	})
end)