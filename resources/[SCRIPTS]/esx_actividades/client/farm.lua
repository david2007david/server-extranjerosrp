local started = false
local elec = nil
local elecid
local blip
local object
local farmid
local farm = 0
local farmveh
local attach
local farmveh
local notif
local pblip
local farmdone = 0
local locations = {}
local models = {}
local farmblip = {}
local carry = false

function farmStart(inicoords, carcoords, vehicle, carh)

    local ped = GetPlayerPed(-1)

    ESX.ShowNotification('Vamos a empezar el trabajo, te comento lo que debes de hacer. Subete al tractor que tienes delante y te voy a ir dando instrucciones')
    Citizen.Wait(2000)
    local hash = GetHashKey(vehicle)
    RequestModel(hash)

    while not HasModelLoaded(hash) do
        Citizen.Wait(1)
    end
    local farmveh = CreateVehicle(hash, carcoords, carh, true, false)

    while true do
        local wait = 1000
        if IsPedInVehicle(ped, farmveh) then
            wait = 100
            createMarkersfarm(farmveh)
            ESX.ShowNotification('Ve a por los pales')
            break
        end
        Citizen.Wait(wait)
    end

end


function createMarkersfarm(farmveh)
    print("farmdone: " .. farmdone)
    print("Config: " .. Config.Farm.MaxRepairs)
    if farmdone ~= Config.Farm.MaxRepairs then
        for k,v in pairs(Config.Farm.locations) do
            locations = Config.Farm.locations
            farm = farm + 1
            local id = nil
            local rpos = math.random(-2,2)
            CreatefarmBlip(Config.Farm.locations[farm].x + rpos, Config.Farm.locations[farm].y + rpos)
            models[farm] = CreateObject(GetHashKey("prop_haybale_03"), Config.Farm.locations[farm].x + rpos, Config.Farm.locations[farm].y + rpos, Config.Farm.locations[farm].z, false, false, false)
            PlaceObjectOnGroundProperly(models[farm])
            FreezeEntityPosition(models[farm], true)
        end
        point = true
        local spawned = false
        while point do
            local near = false
            local wait = 900
            local pcoords = GetEntityCoords(PlayerPedId())
            local blip
            if not carry then
                for k,v in pairs(locations) do
                    dist = GetDistanceBetweenCoords(pcoords, v.x, v.y, v.z, true)
                    for k,v in pairs(farmblip) do
                        blipcoords = GetBlipCoords(farmblip[k])
                        dist3 = GetDistanceBetweenCoords(pcoords, blipcoords, false)
                        if dist3 < 5 then
                            if IsControlJustPressed(1, 38) then
                                RemoveBlip(farmblip[k])
                                table.remove(farmblip, k)
                            end
                        end
                    end
                    for k,v in pairs(models) do
                        if dist < 5 then
                            local coords = GetEntityCoords(models[k])
                            dist2 = GetDistanceBetweenCoords(pcoords, coords, true)
                            wait = 0
                            if dist2 < 5 then
                                ESX.ShowFloatingHelpNotification("Presiona ~r~E~w~ para coger la bola de cosa", GetEntityCoords(models[k]))
                                if IsControlJustPressed(1, 38) then
                                    AttachEntityToEntity(models[k], farmveh, 4, -0.70, -2.95, -0.80, 0.0, 0, 90.0, false, false, false, false, 2, true)
                                    carry = true
                                    CreatefarmBlipMerc(models[k], farmveh)
                                    table.remove(models, k)
                                end
                            end
                        end
                    end
                end
            end
            Citizen.Wait(wait)
        end
    else
        print("^2Terminado")
    end

end

RegisterCommand('markers2', function()
    local hash = GetHashKey("zentorno")

    RequestModel(hash)

    while not HasModelLoaded(hash) do
        Citizen.Wait(1)
    end
    farmveh = CreateVehicle(hash, GetEntityCoords(GetPlayerPed(-1)), 200.00, true, false)
    createMarkersfarm(elecveh)

end, false)



function createfarmObject()
    local ped = GetPlayerPed(-1)
    farmobject = CreateObjectNoOffset(GetHashKey('prop_boxpile_06b'), Config.Farm.locations[farm].x, Config.Farm.locations[farm].y, Config.Farm.locations[farm].z, false, false, false)
    SetEntityHeading(farmobject, Config.Farm.locations[farm].h)
    SetEntityAsMissionEntity(farmobject)
    FreezeEntityPosition(farmobject, true)
end

function CreatefarmBlip(x, y)
    print("test")
    blips = AddBlipForCoord(x, y)
	SetBlipHighDetail(blips, true)
	SetBlipSprite(blips, 1)
	SetBlipScale(blips, 0.8)
	SetBlipColour(blips, 5)
	SetBlipRouteColour(blips, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Mercancia")
	EndTextCommandSetBlipName(blips)
    table.insert(farmblip, blips)
end

function CreateFinishBlip(pos)
    pblip = AddBlipForCoord(pos.x, pos.y)
    SetBlipHighDetail(pblip, true)
    SetBlipSprite(pblip, 1)
    SetBlipScale(pblip, 0.8)
    SetBlipColour(pblip, 5)
    SetBlipRoute(pblip, true)
    SetBlipRouteColour(pblip, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Punto de entrega")
    EndTextCommandSetBlipName(pblip)
end

function CreatefarmBlipMerc(object, farmveh)
    mercblip = AddBlipForCoord(Config.Farm.deliver)
	SetBlipHighDetail(mercblip, true)
	SetBlipSprite(mercblip, 1)
	SetBlipScale(mercblip, 0.8)
	SetBlipColour(mercblip, 1)
	SetBlipRoute(mercblip, true)
	SetBlipRouteColour(mercblip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de mercancia")
	EndTextCommandSetBlipName(mercblip)
    ESX.ShowNotification('Ahora ve a entregar la mercancia')
    active = true
    while active do
        local wait = 1000
        local pcoords = GetEntityCoords(PlayerPedId())
        dist4 = GetDistanceBetweenCoords(pcoords, Config.Farm.deliver)
        if dist4 < 3 then
            wait = 0
            ESX.ShowFloatingHelpNotification("Presiona ~g~E~w~ para entregar la paja", Config.Farm.deliver)
            if IsControlJustPressed(1, 38) then
                DeleteObject(object)
                farmdone = farmdone + 1
                RemoveBlip(mercblip)
                print("FARM: " .. farmdone .. "MAX REPAIRS: " .. Config.Farm.MaxRepairs)
                if farmdone == Config.Farm.MaxRepairs then
                    farmdone = 0
                    ESX.ShowNotification('Has terminado el trabajo, dirijete a entregar el tractor')
                    finishfarmJob(farmveh)
                else
                    ESX.ShowNotification('Ve a por más paja')
                    carry = false
                end
                break
            end
        end
        Citizen.Wait(wait)
    end
end



function finishfarmJob(farmveh)
    CreateFinishBlip(Config.Farm.FinishPoint)
    while true do
        local wait = 1500
        local pcoords = GetEntityCoords(PlayerPedId())
        dist = GetDistanceBetweenCoords(pcoords, Config.Farm.FinishPoint, true)
        if dist < 2 then
            wait = 0
            ESX.ShowFloatingHelpNotification("Presiona ~g~E~w~ para dejar el vehículo y recibir la paga", Config.Farm.FinishPoint)
            if IsControlJustPressed(1, 38) then
                DeleteVehicle(farmveh)
                TriggerServerEvent('esx_actividades:pay')
                RemoveBlip(pblip)
                farm = 0
                locations = {}
                farmblip = {}
                models = {}
                carry = false
                start()
                break
            end
        end
        Citizen.Wait(wait)
    end
end