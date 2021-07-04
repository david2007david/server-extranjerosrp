RegisterNetEvent('esx_amnesia:onSpice')
AddEventHandler('esx_amnesia:onSpice', function()

  TriggerEvent('esx:showNotification', "~r~YA ~g~NO ~y~RECUERDAS!")

  RequestAnimSet("move_m@drunk@moderatedrunk") 
  while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
    Citizen.Wait(0)
  end
  
  local playerPed = GetPlayerPed(-1)
  
  TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
	Citizen.Wait(5000)
	ClearPedTasksImmediately(GetPlayerPed(-1))

  TaskWanderStandard(playerPed, 10.0, 10)
  SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
  SetTimecycleModifier("spectator4")
  SetTimecycleModifierStrength(0.89)
  ShakeGameplayCam('DRUNK_SHAKE', 3.5)
  Citizen.Wait(15000)
  SetPedMotionBlur(playerPed, true)
  ShakeGameplayCam('DRUNK_SHAKE', 8.8)

  Wait(60000)

  ClearTimecycleModifier()
  ResetScenarioTypesEnabled()
  ResetPedMovementClipset(GetPlayerPed(-1), 0)
  SetPedIsDrunk(GetPlayerPed(-1), false)
  SetPedMotionBlur(GetPlayerPed(-1), false)
  ShakeGameplayCam('DRUNK_SHAKE', 0.0)
  ClearPedTasksImmediately(GetPlayerPed(-1))
end)