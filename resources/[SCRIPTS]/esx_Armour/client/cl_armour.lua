ESX          = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_armour:armor')
AddEventHandler('esx_armour:armor', function()

  if GetPedArmour(GetPlayerPed(-1)) == 50 then
    ESX.ShowNotification("¡Ya tienes un chaleco avanzado!")
  else
    SetPedArmour(GetPlayerPed(-1), 0)
    ClearPedBloodDamage(GetPlayerPed(-1))
    ResetPedVisibleDamage(GetPlayerPed(-1))
    ClearPedLastWeaponDamage(GetPlayerPed(-1))
    ResetPedMovementClipset(GetPlayerPed(-1), 0)

    TriggerServerEvent('esx_armour:armorremove')
    TriggerEvent('skinchanger:getSkin', function(skin)

      if skin.sex == 0 then
        TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 15,  ['bproof_2'] = 2})
        SetPedArmour(GetPlayerPed(-1), 50)
      else
        TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 17,  ['bproof_2'] = 2})
        SetPedArmour(GetPlayerPed(-1), 50)
      end

    end)
    ESX.ShowNotification("¡Te has puesto un chaleco avanzado!")
  end

end)
