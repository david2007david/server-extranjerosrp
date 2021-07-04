local started = false
local gan = nil
local repeated = {}
local animalblip
local ganblip
local object
local notif
local done = 0
local ganveh

function ganStart(inicoords, carcoords, vehicle, carh)

    local ped = GetPlayerPed(-1)

    ESX.ShowNotification('Vamos a empezar el trabajo, te comento lo que debes de hacer. Subete al vehículo que tienes delante y te voy a ir dando instrucciones')
    Citizen.Wait(2000)
    local hash = GetHashKey(vehicle)
    RequestModel(hash)

    while not HasModelLoaded(hash) do
        Citizen.Wait(1)
    end
    local ganveh = CreateVehicle(hash, carcoords, carh, true, true)
    started = true
    while true do
        local wait = 1000
        if IsPedInVehicle(ped, ganveh) and started then
            wait = 100
            createGanMarkers(ganveh)
            break
        end
        Citizen.Wait(wait)  
    end

end

RegisterCommand('markers2', function()
    local hash = GetHashKey("zentorno")

    RequestModel(hash)

    while not HasModelLoaded(hash) do
        Citizen.Wait(1)
    end
    ganveh = CreateVehicle(hash, GetEntityCoords(GetPlayerPed(-1)), 200.00, true, false)
    createGanMarkers(ganveh)

end, false)


function createGanMarkers(ganveh)
    if done ~= Config.Gan.max then 
        gan = math.random(1, Config.Gan.max)
        if repeated[gan] then 
            createGanMarkers(ganveh)
        else
            SpawnAnimal('a_c_cow', vector3(Config.Gan.locations[gan].x, Config.Gan.locations[gan].y, Config.Gan.locations[gan].z), Config.Gan.locations[gan].h)

            notif = false
            repeated[gan] = true

            point = true
        
            while point do
                local near = false
                local wait = 1500
                local pcoords = GetEntityCoords(PlayerPedId(-1))

                dista = GetDistanceBetweenCoords(pcoords, Config.Gan.locations[gan].x, Config.Gan.locations[gan].y, Config.Gan.locations[gan].z, true)
                if dista < 25 then
                    if not notif then
                        ESX.ShowNotification('Sal del vehículo para coger el cubo')
                        notif = true
                    end

                    local vehcoords = GetEntityCoords(ganveh)

                    distocar = GetDistanceBetweenCoords(pcoords, vehcoords, true)
                    if distocar < 3 and distocar > 0.05 then
                        wait = 0

                        if DoesEntityExist(ganveh) and not IsPedInAnyVehicle(PlayerPedId(-1)) then
                            ESX.ShowFloatingHelpNotification("Presiona ~r~E~w~ para sacar el cubo del vehículo", vehcoords + vector3(0.0, 0.0, 1.5))
                            if IsControlJustPressed(1, 38) then

                                RequestAnimDict("amb@prop_human_bum_bin@idle_b")
                                while not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b") do
                                    Wait(1)
                                end
                                TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@idle_b", "idle_d", 8.0, 8.0, -1, 0, false, false, false)
                                Citizen.Wait(2000)
                                ClearPedTasks(GetPlayerPed(-1))
                                fobject = CreateObject(GetHashKey("prop_bucket_01a"), pcoords, true, true, true)
                                SetEntityAsMissionEntity(object)
                                AttachEntityToEntity(fobject, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0, -0.1, -0.15, 0.0, 0.0, 0.0, true, true, true, false, false, true)
                                RequestAnimDict("anim@heists@box_carry@")
                                while not HasAnimDictLoaded("anim@heists@box_carry@") do
                                    Wait(1)
                                end
                                local pos = GetEntityCoords(GetPlayerPed(-1), false)
                                TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                                Citizen.Wait(500)
                                ESX.ShowNotification('Ahora ve a ordeñar a la vaca')
                                ord(ganveh, fobject)

                                break
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
        finishGanJob(ganveh)
    end

end

function SpawnAnimal(ped, coords, h)
    local hash = GetHashKey(ped)
    RequestModel(hash)

    while not HasModelLoaded(hash) do
        Citizen.Wait(1)
    end

    animalped = CreatePed("PED_TYPE_ANIMAL", ped, coords, h, false, false)
    SetEntityAsMissionEntity(animalped, true, true)
    SetBlockingOfNonTemporaryEvents(animalped, true)
    CreateAnimalBlip(coords)
    ESX.ShowNotification('Ve al lugar donde está la vaca')
end

function ord(ganveh, fobject)
    while true do 
        local wait = 1500

        local pcoords = GetEntityCoords(PlayerPedId())
        local animalcoords = GetEntityCoords(animalped)
        distgan = GetDistanceBetweenCoords(pcoords, animalcoords, true)
        if distgan < 15 then
            wait = 500
            if distgan < 1.5 then
                wait = 5
                ESX.ShowFloatingHelpNotification('Presiona ~r~E~w~ para ordeñar la vaca', animalcoords)
                if IsControlJustPressed(1, 38) then
                    ClearPedTasks(GetPlayerPed(-1))
                    DeleteObject(fobject)

                    local object = CreateObjectNoOffset(GetHashKey('prop_bucket_01a'), animalcoords + vector3(0, 0, -1.0), false, false, false)
                    FreezeEntityPosition(object, true)

                    local ped = GetPlayerPed(-1)
                    RemoveBlip(animalblip)

                    RequestAnimDict("amb@medic@standing@tendtodead@idle_a")
                    while not HasAnimDictLoaded("amb@medic@standing@tendtodead@idle_a") do
                        Wait(1)
                    end
                    TaskPlayAnim(ped, "amb@medic@standing@tendtodead@idle_a", "idle_a", 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)

                    FreezeEntityPosition(animalped, true)
                    FreezeEntityPosition(ped, true)
                    Citizen.Wait(8000)
                    FreezeEntityPosition(animalped, false)
                    FreezeEntityPosition(ped, false)
                    ClearPedTasks(ped)

                    CatchBucket(ganveh, object)
                    ESX.ShowNotification('Ahora ve a guardar el cubo')
                    break
                end
            end
        end
        Citizen.Wait(wait)
    end
end

function CatchBucket(ganveh, object)
    while true do 
        local wait2 = 1500
        local pcoords = GetEntityCoords(PlayerPedId())
        local buckcoords = GetEntityCoords(object)

        distobucker = GetDistanceBetweenCoords(pcoords, buckcoords, true)
        if distobucker < 3 and distobucker > 0.05 then
            wait2 = 0
            if DoesEntityExist(ganveh) and not IsPedInAnyVehicle(PlayerPedId(-1)) then
                ESX.ShowFloatingHelpNotification("Presiona ~r~E~w~ para coger el cubo", buckcoords + vector3(0.0, 0.0, 0.5))
                if IsControlJustPressed(1, 38) then
                    DeleteObject(object)

                    fobject = CreateObject(GetHashKey("prop_bucket_01a"), pcoords, true, true, true)
                    SetEntityAsMissionEntity(object)
                    AttachEntityToEntity(fobject, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0, -0.1, -0.15, 0.0, 0.0, 0.0, true, true, true, false, false, true)
                    RequestAnimDict("anim@heists@box_carry@")
                    while not HasAnimDictLoaded("anim@heists@box_carry@") do
                        Wait(1)
                    end
                    local pos = GetEntityCoords(GetPlayerPed(-1), false)
                    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                    Citizen.Wait(500)
                    ESX.ShowNotification('Ahora ve a guardar el cubo en el coche')
                    Save(ganveh, fobject)

                    break
                end
            else 
                near = false
                break
            end
        end

        Citizen.Wait(wait2)
    end
end

function Save(ganveh, fobject)
    local ped = GetPlayerPed(-1)

    fixed = true
    while fixed do 
        local wait3 = 1000
        local pcoords = GetEntityCoords(PlayerPedId())
        local vehcoords = GetEntityCoords(ganveh)

        distocar2 = GetDistanceBetweenCoords(pcoords, vehcoords, true)

        if distocar2 < 3 and distocar > 0.05 then
            wait3 = 5
            ESX.ShowFloatingHelpNotification("Presiona ~r~E~w~ para guardar el cubo y seguir trabajando", vehcoords + vector3(0, 0, 1.5))
            if IsControlJustPressed(1, 38) then
                DeleteObject(fobject)
                RequestAnimDict("amb@prop_human_bum_bin@idle_b")
                while not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b") do
                    Wait(1)
                end
                TaskPlayAnim(ped, "amb@prop_human_bum_bin@idle_b", "idle_d", 8.0, 8.0, -1, 0, false, false, false)
                Citizen.Wait(3000)
                ClearPedTasks(ped)
                done = done + 1
                createGanMarkers(ganveh)
                fixed = false
            end
        end
        Citizen.Wait(wait3)
    end
end

function finishGanJob(ganveh)
    ESX.ShowNotification('Has terminado el trabajo, dirigete de vuelta al Granero')
    CreateGanBlip(Config.Gan.FinishPoint)
    while true do
        local wait4 = 1500
        local pcoords = GetEntityCoords(PlayerPedId())
        dist = GetDistanceBetweenCoords(pcoords, Config.Gan.FinishPoint, true)
        if dist < 8 then
            wait4 = 250
            if dist < 2 then
                wait4 = 5
                ESX.ShowFloatingHelpNotification("Presiona ~g~E~w~ para dejar el vehículo y recibir la paga", Config.Gan.FinishPoint)
                if IsControlJustPressed(1, 38) then
                    DeleteVehicle(ganveh)
                    TriggerServerEvent('esx_actividades:pay')
                    done = 0
                    RemoveBlip(ganblip)
                    repeated = {}
                    start()
                    break
                end
            end
        end
        Citizen.Wait(wait4)
    end
end

function CreateGanBlip(pos)
    ganblip = AddBlipForCoord(pos.x, pos.y)
	SetBlipHighDetail(ganblip, true)
	SetBlipSprite(ganblip, 1)
	SetBlipScale(ganblip, 0.8)
	SetBlipColour(ganblip, 5)
	SetBlipRoute(ganblip, true)
	SetBlipRouteColour(ganblip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Granero")
	EndTextCommandSetBlipName(ganblip)
end

function CreateAnimalBlip(pos)
    animalblip = AddBlipForCoord(pos.x, pos.y)
	SetBlipHighDetail(animalblip, true)
	SetBlipSprite(animalblip, 1)
	SetBlipScale(animalblip, 0.8)
	SetBlipColour(animalblip, 1)
	SetBlipRoute(animalblip, true)
	SetBlipRouteColour(animalblip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Vaca")
	EndTextCommandSetBlipName(animalblip)
end
