local started = false
local elec = nil
local repeated = {}
local blip
local pblip
local object
local attach
local notif
local done = 0

function elecStart(inicoords, carcoords, vehicle, carh)

    local ped = GetPlayerPed(-1)

    ESX.ShowNotification('Vamos a empezar el trabajo, te comento lo que debes de hacer. Subete al vehículo que tienes delante y te voy ir dando instrucciones')
    Citizen.Wait(2000)
    print(vehicle .. ' ' .. carcoords .. ' ' .. carh)
    local hash = GetHashKey(vehicle)
    RequestModel(hash)

    while not HasModelLoaded(hash) do
        Citizen.Wait(1)
    end
    local elecveh = CreateVehicle(hash, carcoords, carh, true, true)
    started = true
    while true do
        local wait = 1000
        if IsPedInVehicle(ped, elecveh) and started then
            ESX.ShowNotification('Ves a reparar las farolas')
            wait = 100
            createMarkers(elecveh)
            break
        else 
            print("fuera")
        end
        Citizen.Wait(wait)  
    end

end

RegisterCommand('markers', function()
    local hash = GetHashKey("zentorno")

    RequestModel(hash)

    while not HasModelLoaded(hash) do
        Citizen.Wait(1)
    end
    elecveh = CreateVehicle(hash, GetEntityCoords(GetPlayerPed(-1)), 200.00, true, false)
    createMarkers(elecveh)

end, false)


function createMarkers(elecveh)
    if done ~= Config.Elec.MaxRepairs then 
        elec = math.random(1, Config.Elec.max)
        if repeated[elec] then 
            createMarkers(elecveh)
        else
            notif = false
            repeated[elec] = true

            --print(Config.Elec.locations[elec].x)
            CreateElecBlip(Config.Elec.locations[elec])
            point = true
        
            while point do
                local near = false
                local wait = 1500
                local pcoords = GetEntityCoords(PlayerPedId(-1))

                dist = GetDistanceBetweenCoords(pcoords, Config.Elec.locations[elec].x, Config.Elec.locations[elec].y, Config.Elec.locations[elec].z, true)
                --print(dist)
                if dist < 8 then
                    if not notif then
                        ESX.ShowNotification('Sal del vehículo para coger la escalera')
                        notif = true
                    end

                    local vehcoords = GetEntityCoords(elecveh)
                    --print(vehcoords)
                    --print(pcoords)

                    distocar = GetDistanceBetweenCoords(pcoords, vehcoords, true)
                    --print(distocar)
                    if distocar < 3 and distocar > 0.05 then
                        --print("test")
                        wait = 0
                        local vehcoords = GetEntityCoords(elecveh)
                        if DoesEntityExist(elecveh) and not IsPedInAnyVehicle(PlayerPedId(-1)) then
                            ESX.ShowFloatingHelpNotification("Presiona ~r~E~w~ para sacar la escalera del vehículo", vehcoords + vector3(0.0, 0.0, 1.5))
                            if IsControlJustPressed(1, 38) then

                                RequestAnimDict("amb@prop_human_bum_bin@idle_b")
                                while not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b") do
                                    Wait(1)
                                end
                                TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@idle_b", "idle_d", 8.0, 8.0, -1, 0, false, false, false)
                                Citizen.Wait(2000)
                                ClearPedTasks(GetPlayerPed(-1))
                                fobject = CreateObject(GetHashKey("hw1_06_ldr_"), pcoords, true, true, true)
                                SetEntityAsMissionEntity(object)
                                AttachEntityToEntity(fobject, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), -2.5, -0.50, 0.0, 0.0, 90.0, 0.0, true, true, true, false, false, true)
                                RequestAnimDict("anim@heists@box_carry@")
                                while not HasAnimDictLoaded("anim@heists@box_carry@") do
                                    Wait(1)
                                end
                                local pos = GetEntityCoords(GetPlayerPed(-1), false)
                                TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                                Citizen.Wait(2000)
                                attach(elecveh, fobject)

                                break
                                --print(near)
                            end
                        else 
                            near = false
                            break
                        end
                    end
                end

                Citizen.Wait(wait)
            end
        end
    else
        finishElecJob(elecveh)
    end

end


function attach(elecveh, fobejct)

    while true do  
        local wait = 1500
        local pcoords = GetEntityCoords(PlayerPedId())
        print(dist)
        dist = GetDistanceBetweenCoords(pcoords, Config.Elec.locations[elec].x, Config.Elec.locations[elec].y, Config.Elec.locations[elec].z, true)
        if dist < 2 then
            wait = 0
            ESX.ShowFloatingHelpNotification('Presiona ~r~E~w~ para colocar la escalera', vector3(Config.Elec.locations[elec].x, Config.Elec.locations[elec].y, Config.Elec.locations[elec].z))
            if IsControlJustPressed(1, 38) then
                elecid = elec
                ClearPedTasks(GetPlayerPed(-1))
                DeleteObject(fobejct)
                createObject(elecveh)
                break
            end

        end
        Citizen.Wait(wait)
    end
end

function createObject(elecveh)
    local ped = GetPlayerPed(-1)
    RemoveBlip(pblip)
    RequestAnimDict("amb@prop_human_bum_bin@idle_b")
    while not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b") do
        Wait(1)
    end
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@idle_b", "idle_d", 8.0, 8.0, -1, 0, false, false, false)
    Citizen.Wait(3000)
    ClearPedTasks(ped)
    local object = CreateObjectNoOffset(GetHashKey('hw1_06_ldr_'), Config.Elec.locations[elec].x, Config.Elec.locations[elec].y, Config.Elec.locations[elec].z, false, false, false)
    SetEntityHeading(object, Config.Elec.locations[elec].h)

    while true do 
        wait = 1000
        local pcoords = GetEntityCoords(PlayerPedId())
        dist = GetDistanceBetweenCoords(pcoords, Config.Elec.locations[elec].x, Config.Elec.locations[elec].y, Config.Elec.locations[elec].z+4, true)
        --print(dist)
        if dist < 1 then
            wait = 0
            
            ESX.ShowFloatingHelpNotification("Presiona ~g~E~w~ para arreglar la farola", vector3(Config.Elec.locations[elec].x, Config.Elec.locations[elec].y, Config.Elec.locations[elec].z+4))
            if IsControlJustPressed(1, 38) then
                fixFar(object, elecveh)
                break
            end
        end
        Citizen.Wait(wait)
    end

end



function fixFar(object, elecveh)
    local ped = GetPlayerPed(-1)
    FreezeEntityPosition(ped, true)
    ClearPedTasks(ped)
    RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
    while not HasAnimDictLoaded("anim@amb@clubhouse@tutorial@bkr_tut_ig3@") do
        Wait(10)
    end
    local pos = GetEntityCoords(ped, false)
    TaskPlayAnim(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, 8.0, -1, 50, 0, false, false, false)
    Citizen.Wait(4000)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)

    fixed = true
    while fixed do 
        local wait = 1000
        local pcoords = GetEntityCoords(PlayerPedId())
        dist = GetDistanceBetweenCoords(pcoords, Config.Elec.locations[elec].x, Config.Elec.locations[elec].y, Config.Elec.locations[elec].z, true)
        --print(dist)
        if dist < 2.2 then
            wait = 0
            ESX.ShowFloatingHelpNotification("Presiona ~g~E~w~ para quitar la escalera y seguir trabajando", vector3(Config.Elec.locations[elec].x, Config.Elec.locations[elec].y, Config.Elec.locations[elec].z))
            if IsControlJustPressed(1, 38) then
                RequestAnimDict("amb@prop_human_bum_bin@idle_b")
                while not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b") do
                    Wait(1)
                end
                TaskPlayAnim(ped, "amb@prop_human_bum_bin@idle_b", "idle_d", 8.0, 8.0, -1, 0, false, false, false)
                Citizen.Wait(3000)
                ClearPedTasks(ped)
                DeleteObject(object)
                done = done + 1
                createMarkers(elecveh)
                fixed = false
            end
        end
        Citizen.Wait(wait)
    end
end

function finishElecJob(elecveh)
    ESX.ShowNotification('Has terminado el trabajo, dirigete de vuelta a la sede')
    CreateElecBlip(Config.Elec.FinishPoint)
    while true do
        local wait = 1500
        local pcoords = GetEntityCoords(PlayerPedId())
        dist = GetDistanceBetweenCoords(pcoords, Config.Elec.FinishPoint, true)
        if dist < 2 then
            wait = 0
            ESX.ShowFloatingHelpNotification("Presiona ~g~E~w~ para dejar el vehículo y recibir la paga", Config.Elec.FinishPoint)
            if IsControlJustPressed(1, 38) then
                DeleteVehicle(elecveh)
                TriggerServerEvent('esx_actividades:pay')
                done = 0
                RemoveBlip(pblip)
                repeated = {}
                start()
                break
            end
        end
        Citizen.Wait(wait)
    end
end

RegisterCommand('deleteobject', function() 
    ClearPedTasks(GetPlayerPed(-1))
    fobject = CreateObject(GetHashKey("hw1_06_ldr_"), pcoords, true, true, true)
    SetEntityAsMissionEntity(object)
    AttachEntityToEntity(fobject, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), -2.5, -0.50, 0.0, 0.0, 90.0, 0.0, true, true, true, false, false, true)
    RequestAnimDict("anim@heists@box_carry@")
    while not HasAnimDictLoaded("anim@heists@box_carry@") do
        Wait(1)
    end
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)

    Citizen.Wait(5000)

    DeleteObject(fobject)
    ClearPedTasks(GetPlayerPed(-1))

end, false)

function CreateElecBlip(pos)
    pblip = AddBlipForCoord(pos.x, pos.y)
	SetBlipHighDetail(pblip, true)
	SetBlipSprite(pblip, 1)
	SetBlipScale(pblip, 0.8)
	SetBlipColour(pblip, 5)
	SetBlipRoute(pblip, true)
	SetBlipRouteColour(pblip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Punto de reparación")
	EndTextCommandSetBlipName(pblip)
end
