-- Framework 

ESX = nil

Citizen.CreateThread(function() 
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Citizen.Wait(0) 
    end 
    createPeds()
    start()
end)

-- Fin Framework

-- Variables

local started = false
local elec = nil
local repeated = {}
local blip
local pblip
local points = {}
local object
local attach
local notif
local done = 0

-- Fin variables

-- Functions

function createPeds()


    Citizen.Wait(1000)

    for k,v in pairs(Config.Act) do
        points = Config.Act.Points
    end

    for k,v in pairs(points) do
        local hash = GetHashKey(v.ped)
        RequestModel(hash)
    
        while not HasModelLoaded(hash) do
            Citizen.Wait(1)
        end

        ped = CreatePed("PED_TYPE_CIVMALE", v.ped, v.coords, v.h, false, false)
        SetEntityAsMissionEntity(ped, true, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)

        blip = AddBlipForCoord(v.coords)
        SetBlipSprite(blip, 280)
        SetBlipColour(blip, 47)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.bliptext)
        EndTextCommandSetBlipName(blip)

    end
end

function start()
    started = false
    while true do
        local wait = 1000
        local pcoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(points) do
            local dist = GetDistanceBetweenCoords(pcoords, v.coords, true)
            if dist < 2 and started == false then
                if v.recogn == "Portuario" then
                    wait = 0
                    ESX.ShowFloatingHelpNotification('Presiona [~g~E~w~] para hablar con el ' .. v.recogn, v.coords + vector3(0,0,1.95))
                    if IsControlJustPressed(1, 38) then
                        started = true
                        mechStart(v.coords, v.carspawn, v.veh, v.carh)
                    end
                elseif v.recogn == "Electricista" then
                    wait = 0
                    ESX.ShowFloatingHelpNotification('Presiona [~g~E~w~] para hablar con el ' .. v.recogn, v.coords + vector3(0,0,1.95))
                    if IsControlJustPressed(1, 38) then
                        started = true
                        elecStart(v.coords, v.carspawn, v.veh, v.carh)
                    end
                elseif v.recogn == "Granjero" then
                    wait = 0
                    ESX.ShowFloatingHelpNotification('Presiona [~g~E~w~] para hablar con el ' .. v.recogn, v.coords + vector3(0,0,1.95))
                    if IsControlJustPressed(1, 38) then
                        started = true
                        farmStart(v.coords, v.carspawn, v.veh, v.carh)
                    end
                elseif v.recogn == "Ganadero" then
                    wait = 0
                    ESX.ShowFloatingHelpNotification('Presiona [~g~E~w~] para hablar con el ' .. v.recogn, v.coords + vector3(0,0,1.95))
                    if IsControlJustPressed(1, 38) then
                        started = true
                        ganStart(v.coord, v.carspawn, v.veh, v.carh)
                    end
                end
            end

        end
        Citizen.Wait(wait)
    end

end

RegisterCommand('fixpj', function()
    local hp = GetEntityHealth(PlayerPedId())
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        local isMale = skin.sex == 0
        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
                TriggerEvent('esx:restoreLoadout')
                TriggerEvent('dpc:ApplyClothing')
                SetEntityHealth(PlayerPedId(), hp)
                ESX.ShowNotification("PJ Refrescado")
            end)
        end)
    end)
end, false)



