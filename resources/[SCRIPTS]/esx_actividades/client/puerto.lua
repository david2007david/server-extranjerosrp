local started = false
local elec = nil
local elecid
local blip
local object
local mechid
local mech = nil
local mechveh
local attach
local elecveh
local notif
local mechdone = 0

function mechStart(inicoords, carcoords, vehicle, carh)

    local ped = GetPlayerPed(-1)

    ESX.ShowNotification('Vamos a empezar el trabajo, te comento lo que debes de hacer. Subete al vehículo que tienes delante y te voy a ir dando instrucciones')
    Citizen.Wait(2000)
    local hash = GetHashKey(vehicle)
    RequestModel(hash)

    while not HasModelLoaded(hash) do
        Citizen.Wait(1)
    end
    local elecveh = CreateVehicle(hash, carcoords, carh, true, false)

    while true do
        local wait = 1000
        if IsPedInVehicle(ped, elecveh) then
            wait = 100
            createMarkersMech(ped, inicoords, elecveh)
            ESX.ShowNotification('Ve a por la mercancia')
            break
        end
        Citizen.Wait(wait)
    end

end


function createMarkersMech(ped, inicoords, mechveh)
    print("mechdone: " .. mechdone)
    print("Config: " .. Config.Mech.MaxRepairs)
    if mechdone ~= Config.Mech.MaxRepairs then
        mech = math.random(1, Config.Mech.max)
        if mech == mechid then
            createMarkersMech(ped, inicoords)
        end

        CreateMechBlip(Config.Mech.locations[mech])
        point = true
        local spawned = false
        
        while point do
            local near = false
            local wait = 1500
            local pcoords = GetEntityCoords(PlayerPedId())

            dist = GetDistanceBetweenCoords(pcoords, Config.Mech.locations[mech].x, Config.Mech.locations[mech].y, Config.Mech.locations[mech].z, true)

            if dist < 40 then
                wait = 500
                if not spawned then
                    createMechObject()
                    spawned = true
                end

                if dist < 5 then
                    wait = 0
                    local merccoords = vector3(Config.Mech.locations[mech].x, Config.Mech.locations[mech].y, Config.Mech.locations[mech].z)

                    local vehcoords = GetEntityCoords(mechveh)
                    if DoesEntityExist(mechveh) then
                        ESX.ShowFloatingHelpNotification("Presiona ~r~E~w~ para recoger la carga", merccoords + vector3(0.0, 0.0, 1.5))
                        if IsControlJustPressed(1, 38) then
                            attachMech(mechveh)
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
    else
        finishJob(mechveh)
    end

end

function createMarkersMechMerc(mechveh)
    point = true
    
    while point do
        local near = false
        local wait = 1500
        local pcoords = GetEntityCoords(PlayerPedId())

        dist = GetDistanceBetweenCoords(pcoords, 1218.64, -3230.92, 4.69)

        if dist < 5 then
            wait = 500

            if dist < 3 then
                wait = 5
                if DoesEntityExist(mechveh) then
                    ESX.ShowFloatingHelpNotification("Presiona ~r~E~w~ para entregar la carga", vector3(1218.64, -3230.92, 4.69) + vector3(0.0, 0.0, 1.5))
                    if IsControlJustPressed(1, 38) then
                        DeleteObject(mechobject)
                        mechdone = mechdone + 1
                        TriggerServerEvent('esx_actividades:pay')
                        RemoveBlip(mercblip)
                        createMarkersMech(nil, nil, mechveh)
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

function finishJob(mechveh)
    ESX.ShowNotification('Has terminado el trabajo, dirigete de vuelta a la sede')
    CreateMechBlip(Config.Mech.FinishPoint)
    while true do
        local wait = 1500
        local pcoords = GetEntityCoords(PlayerPedId())
        dist = GetDistanceBetweenCoords(pcoords, Config.Mech.FinishPoint, true)
        if dist < 2 then
            wait = 0
            ESX.ShowFloatingHelpNotification("Presiona ~g~E~w~ para dejar el vehículo y recibir la paga", Config.Mech.FinishPoint)
            if IsControlJustPressed(1, 38) then
                DeleteVehicle(mechveh)
                TriggerServerEvent('esx_actividades:pay')
                done = 0
                RemoveBlip(mechblip)
                start()
                break
            end
        end
        Citizen.Wait(wait)
    end
end

function attachMech(mechveh)
    mechid = mech
    SetEntityAsMissionEntity(mechobject)
    AttachEntityToEntity(mechobject, mechveh, 3, 0.0, 1.3, -0.49, 0.0, 0, 90.0, false, false, false, false, 2, true)
    RemoveBlip(mechblip)
    CreateMechBlipMerc()
    Wait(200)
    createMarkersMechMerc(mechveh)
end

function createMechObject()
    local ped = GetPlayerPed(-1)
    mechobject = CreateObjectNoOffset(GetHashKey('prop_boxpile_06b'), Config.Mech.locations[mech].x, Config.Mech.locations[mech].y, Config.Mech.locations[mech].z, false, false, false)
    SetEntityHeading(mechobject, Config.Mech.locations[mech].h)
    SetEntityAsMissionEntity(mechobject)
    FreezeEntityPosition(mechobject, true)
end

function CreateMechBlip(pos)
    mechblip = AddBlipForCoord(pos.x, pos.y)
	SetBlipHighDetail(mechblip, true)
	SetBlipSprite(mechblip, 1)
	SetBlipScale(mechblip, 0.8)
	SetBlipColour(mechblip, 5)
	SetBlipRoute(mechblip, true)
	SetBlipRouteColour(mechblip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Mercancia")
	EndTextCommandSetBlipName(mechblip)
end

function CreateMechBlipMerc()
    mercblip = AddBlipForCoord(1218.64, -3230.92, 4.69)
	SetBlipHighDetail(mercblip, true)
	SetBlipSprite(mercblip, 1)
	SetBlipScale(mercblip, 0.8)
	SetBlipColour(mercblip, 2)
	SetBlipRoute(mercblip, true)
	SetBlipRouteColour(mercblip, 2)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de mercancia")
	EndTextCommandSetBlipName(mercblip)

    ESX.ShowNotification('Ahora ve a entregar la mercancia')
end