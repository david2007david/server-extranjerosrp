-- GL LEAKS
-- https://discord.gg/9tDBhGw

local holstered  = true
local blocked  = false
local PlayerData = {}
local RIFLES = { 
    back_bone = 24818,
    x = -0.07,
    y = -0.15,
    z = 0.0,
    x_rotation = 0.0,
    y_rotation = 45.0,
    z_rotation = 0.0,
    compatable_weapon_hashes = {
      ["w_ar_carbinerifle"] = GetHashKey("WEAPON_CARBINERIFLE"),
      ["w_ar_carbineriflemk2"] = GetHashKey("WEAPON_CARBINERIFLE_Mk2"),
      ["w_ar_assaultrifle"] = -1074790547,
      ["w_ar_specialcarbine"] = -1063057011,
      ["w_ar_bullpuprifle"] = 2132975508,
      ["w_ar_advancedrifle"] = -1357824103,
      ["w_sb_assaultsmg"] = -270015777,
      ["w_sb_smg"] = 736523883,
      ["w_sb_smgmk2"] = GetHashKey("WEAPON_SMGMk2"),
      ["w_sb_gusenberg"] = 1627465347,
      ["w_sr_sniperrifle"] = 100416529,
      ["w_sg_assaultshotgun"] = -494615257,
      ["w_sg_bullpupshotgun"] = -1654528753,
      ["w_sg_pumpshotgun"] = 487013001,
      ["w_ar_musket"] = -1466123874,
      ["w_sg_heavyshotgun"] = GetHashKey("WEAPON_HEAVYSHOTGUN"),
    }
}

-- Evitar tocar

local IZQUIERDA = {
  back_bone = 58271,
  x = -0.01,
  y = 0.1,
  z = -0.07,
  x_rotation = -55.0,
  y_rotation = 0.10,
  z_rotation = 0.0,
  compatable_weapon_hashes = {
    
     ["w_pi_stungun"] = GetHashKey("WEAPON_STUNGUN"),
 
    }
}

-- Evitar tocar

local CORTOPUNZANTES = {
  back_bone = 51826,
  x = -0.21,
  y = 0.10,
  z = 0.07,
  x_rotation = -120.0,
  y_rotation = 100.0,
  z_rotation = 0.0,
  compatable_weapon_hashes = {
    
     ["prop_w_me_knife_01"] = GetHashKey("WEAPON_KNIFE"),
     ["w_me_nightstick"] = GetHashKey("WEAPON_NIGHTSTICK"),
     ["w_me_hatchet"] = GetHashKey("WEAPON_HATCHET"),
     ["prop_ld_w_me_machette"] = GetHashKey("WEAPON_MACHETE"),
 
    }
}

-- Evitar tocar

local PISTOLAS = {
    back_bone = 51826,
    x = -0.01,
    y = 0.10,
    z = 0.07,
    x_rotation = -115.0,
    y_rotation = 0.0,
    z_rotation = 0.0,
    compatable_weapon_hashes = {
      
       ["w_pi_combatpistol"] = GetHashKey("WEAPON_COMBATPISTOL"),
      ["w_pi_sns_pistol"] = GetHashKey("WEAPON_SNSPISTOL"),
      ["w_pi_pistol"] = GetHashKey("WEAPON_PISTOL"),
      ["w_pi_vintage_pistol"] = GetHashKey("WEAPON_VINTAGEPISTOL"),
      ["w_pi_flaregun"] = GetHashKey("weapon_flaregun"),
   
    }
}

local attached_weapons = {}

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/arma', 'Ocultar arma bajo la ropa') -- Sugerencia
end)

RegisterCommand("arma", function(source, args, rawCommand) -- Comando
  TriggerEvent("cds_arma")
  SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
  TaskPlayAnim(GetPlayerPed(-1), "reaction@intimidation@1h", "intro", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
  Citizen.Wait(1700)
  ClearPedTasks(GetPlayerPed(-1))
  
end, false)

estado = true
RegisterNetEvent("cds_arma")
AddEventHandler("cds_arma", function(flag)
  if flag ~= nil then 
    estado = flag
  end
    if ( estado ) then
      ExecuteCommand ("do se vería como esconde algo en su ropa")  -- Contesta con ...
      Citizen.Wait(1700)
        estado = false
    else
      Citizen.Wait(1700)
        estado = true
  end

end)

Citizen.CreateThread(function()
  while true do
      local me = GetPlayerPed(-1)
      for wep_name, wep_hash in pairs(RIFLES.compatable_weapon_hashes) do
          if HasPedGotWeapon(me, wep_hash, false) then
			if estado and not attached_weapons[wep_name]then 
				 AttachWeapon(wep_name, wep_hash, RIFLES.back_bone, RIFLES.x, RIFLES.y, RIFLES.z, RIFLES.x_rotation, RIFLES.y_rotation, RIFLES.z_rotation)
              
             end
			 
          end
      end

      for name, attached_object in pairs(attached_weapons) do
          if estado == false or GetSelectedPedWeapon(me) ==  attached_object.hash or not HasPedGotWeapon(me, attached_object.hash, false) then -- equipped or not in weapon wheel
            DeleteObject(attached_object.handle)
            attached_weapons[name] = nil
          end
		 
		  
      end
  Wait(0)
  end
end)

Citizen.CreateThread(function()
  while true do
      local me = GetPlayerPed(-1)

      for wep_name, wep_hash in pairs(PISTOLAS.compatable_weapon_hashes) do
          if HasPedGotWeapon(me, wep_hash, false) then
      if estado and not attached_weapons[wep_name]then 
         AttachWeapon(wep_name, wep_hash, PISTOLAS.back_bone, PISTOLAS.x, PISTOLAS.y, PISTOLAS.z, PISTOLAS.x_rotation, PISTOLAS.y_rotation, PISTOLAS.z_rotation)
              
             end
       
          end
      end
   
      for name, attached_object in pairs(attached_weapons) do
          if estado == false or GetSelectedPedWeapon(me) ==  attached_object.hash or not HasPedGotWeapon(me, attached_object.hash, false) then -- equipped or not in weapon wheel
            DeleteObject(attached_object.handle)
            attached_weapons[name] = nil
          end
     
      
      end
  Wait(0)
  end
end)

Citizen.CreateThread(function()
  while true do
      local me = GetPlayerPed(-1)

      for wep_name, wep_hash in pairs(IZQUIERDA.compatable_weapon_hashes) do
          if HasPedGotWeapon(me, wep_hash, false) then
      if estado and not attached_weapons[wep_name]then 
         AttachWeapon(wep_name, wep_hash, IZQUIERDA.back_bone, IZQUIERDA.x, IZQUIERDA.y, IZQUIERDA.z, IZQUIERDA.x_rotation, IZQUIERDA.y_rotation, IZQUIERDA.z_rotation)
              
             end
       
          end
      end
   
      for name, attached_object in pairs(attached_weapons) do
          if estado == false or GetSelectedPedWeapon(me) ==  attached_object.hash or not HasPedGotWeapon(me, attached_object.hash, false) then -- equipped or not in weapon wheel
            DeleteObject(attached_object.handle)
            attached_weapons[name] = nil
          end
     
      
      end
  Wait(0)
  end
end)

Citizen.CreateThread(function()
  while true do
      local me = GetPlayerPed(-1)

      for wep_name, wep_hash in pairs(CORTOPUNZANTES.compatable_weapon_hashes) do
          if HasPedGotWeapon(me, wep_hash, false) then
      if estado and not attached_weapons[wep_name]then 
         AttachWeapon(wep_name, wep_hash, CORTOPUNZANTES.back_bone, CORTOPUNZANTES.x, CORTOPUNZANTES.y, CORTOPUNZANTES.z, CORTOPUNZANTES.x_rotation, CORTOPUNZANTES.y_rotation, CORTOPUNZANTES.z_rotation)
              
             end
       
          end
      end
   
      for name, attached_object in pairs(attached_weapons) do
        if estado == false or GetSelectedPedWeapon(me) ==  attached_object.hash or not HasPedGotWeapon(me, attached_object.hash, false) then -- equipped or not in weapon wheel
          DeleteObject(attached_object.handle)
          attached_weapons[name] = nil
        end
   
    
    end
Wait(0)
end
end)

function AttachWeapon(attachModel,modelHash,boneNumber,x,y,z,xR,yR,zR)
	local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumber)
	RequestModel(attachModel)
	while not HasModelLoaded(attachModel) do
		Wait(100)
	end

  attached_weapons[attachModel] = {
    hash = modelHash,
    handle = CreateObject(GetHashKey(attachModel), 1.0, 1.0, 1.0, true, true, false)
  }

 
	AttachEntityToEntity(attached_weapons[attachModel].handle, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
end

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end


  PlayerData = ESX.GetPlayerData()
end)

 Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    loadAnimDict("rcmjosh4")
    loadAnimDict("reaction@intimidation@cop@unarmed")
    loadAnimDict("reaction@intimidation@1h")
    local ped = PlayerPedId()

    if estado  == false then
      if not IsPedInAnyVehicle(ped, false) then
        if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
          if CheckWeapon(ped) then
            if holstered then
              blocked   = true
                SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
                TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 5.0, 1.0, -1, 50, 0, 0, 0, 0 )
                  Citizen.Wait(1250)
                SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
                  Citizen.Wait(Config.cooldown)
                ClearPedTasks(ped)
              holstered = false
            else
              blocked = false
            end
          else
            if not holstered then
                TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 3.0, -1, 50, 0, 0, 0.125, 0 )
                  Citizen.Wait(1700)
                ClearPedTasks(ped)
              holstered = true
            end
          end
        else
          SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        end
      else
        holstered = true
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    if blocked then
      DisableControlAction(1, 25, true )
      DisableControlAction(1, 140, true)
      DisableControlAction(1, 141, true)
      DisableControlAction(1, 142, true)
      DisableControlAction(1, 23, true)
      DisableControlAction(1, 37, true)
      DisablePlayerFiring(ped, true)
    end
  end
end)


function CheckWeapon(ped)
  if IsEntityDead(ped) then
    blocked = false
      return false
    else
      for i = 1, #Config.Weapons do
        if GetHashKey(Config.Weapons[i]) == GetSelectedPedWeapon(ped) then
          return true
        end
      end
    return false
  end
end


function loadAnimDict(dict)
  while ( not HasAnimDictLoaded(dict)) do
    RequestAnimDict(dict)
    Citizen.Wait(0)
  end
end