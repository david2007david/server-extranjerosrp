ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent("esx:getSharedObject",function(a)
                ESX = a
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()

    ESX.TriggerServerCallback("esx_doorlock:getDoorInfo", function(b)
        for c, d in pairs(b) do
            Config.DoorList[c].locked = d
        end
    end)
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(e)
    ESX.PlayerData.job = e
end)

Citizen.CreateThread(function()
    while true do
        for f, c in ipairs(Config.DoorList) do
            if c.doors then
                for g, h in ipairs(c.doors) do
                    if not h.object or not DoesEntityExist(h.object) then
                        if type(h.objName) == "number" then
                            h.object = GetClosestObjectOfType(h.objCoords, 1.0, h.objName, false, false, false)
                        else
                            h.object = GetClosestObjectOfType(h.objCoords, 1.0, GetHashKey(h.objName), false, false, false)
                        end
                    end
                end
            else
                if not c.object or not DoesEntityExist(c.object) then
                    c.object = GetClosestObjectOfType(c.objCoords, 1.0, GetHashKey(c.objName), false, false, false)
                end
            end
        end
        Citizen.Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local i, j = GetEntityCoords(PlayerPedId()), true
        for g, c in ipairs(Config.DoorList) do
            local k
            if c.doors then
                k = #(i - c.doors[1].objCoords)
            else
                k = #(i - c.objCoords)
            end
            local l = IsAuthorized(c)
            local m, n, o = 1.25, 1, "🔓"
            if c.distance then
                m = c.distance
            end
            if k < 50 then
                j = false
                if c.doors then
                    for f, h in ipairs(c.doors) do
                        FreezeEntityPosition(h.object, c.locked)
                        if c.locked and h.objYaw and GetEntityRotation(h.object).z ~= h.objYaw then
                            SetEntityRotation(h.object, 0.0, 0.0, h.objYaw, 2, true)
                        end
                    end
                else
                    FreezeEntityPosition(c.object, c.locked)
                    if c.locked and c.objYaw and GetEntityRotation(c.object).z ~= c.objYaw then
                        SetEntityRotation(c.object, 0.0, 0.0, c.objYaw, 2, true)
                    end
                end
            end
            if k < m then
                if c.size then
                    n = c.size
                end
                if c.locked then
                    o = "🔒"
                end
                if l then
                    o = o
                end
                ESX.Game.Utils.DrawText3D(c.textCoords, o, n)
                if IsControlJustReleased(0, 38) then
                    if l then
                        c.locked = not c.locked
                        TriggerServerEvent("esx_doorlock:updateState", g, c.locked)
                    end
                end
            end
        end
        if j then
            Citizen.Wait(500)
        end
    end
end)

function IsAuthorized(c)
    if ESX.PlayerData.job == nil then
        return false
    end

    for f, e in pairs(c.authorizedJobs) do
        if e == ESX.PlayerData.job.name then
            return true
        end
    end
    return false
end

RegisterNetEvent("esx_doorlock:setState")
AddEventHandler("esx_doorlock:setState", function(c, d)
    Config.DoorList[c].locked = d
end)

-- /doorlock <job> <distance> <garage>

-- job      | trabajo que quieres que pueda abrir la puerta
-- distance | la distancia a la que se pueda abrir la puerta
-- garage   | si la puerta es un garaje, pon esto en true, de lo contrario ignoralo, simplemente evita que el garaje vuele cuando está cerrado

local Doorlock = false
local garage = false

RegisterCommand("doorlock", function(source, args, rawCommand)
    if Doorlock then
        Doorlock = false
        ESX.ShowNotification("Cerradura ~r~OFF~w~!")
    else
        -- Error
        if args[1] == nil then
            ESX.ShowNotification("~r~Inserta el trabajo!")
            return
        elseif args[2] == nil then
            ESX.ShowNotification("~r~Inserta la distancia!")
            return
        end
        
        -- Todo correcto
        job = args[1]
        distance = args[2]
        garage = args[3]
        ESX.ShowNotification("Cerradura ~g~ON~w~!")
        Doorlock = true
        
        StartMainDoorlockLoop()
    end
end)

-- Insertado en una función para optimizar el tiempo de la CPU
function StartMainDoorlockLoop()
    Citizen.CreateThread(function()
        while true do
            if Doorlock then
                local IsFound, Object = GetEntityPlayerIsFreeAimingAt(PlayerId())

                if IsFound then
                    Doorlock = false -- Evita la multicreación
                    local _,__,yaw = table.unpack(GetEntityRotation(Object))
                    
                    TriggerServerEvent("esx_doorlock:SaveOnConfig", yaw, GetEntityCoords(Object), GetEntityModel(Object), job, Object, distance, garage)
                    break
                end
            end
            Citizen.Wait(500)
        end
    end)
end

-- Sugerencia de chat
Citizen.CreateThread(function()
	TriggerEvent("chat:addSuggestion", "/doorlock", "Crea una cerradura",{ 
		{name = "job", help = "el trabajo que quiera que abra la puerta"},
		{name = "distance", help = "la distancia a la que se abra la puerta"},
		{name = "garage", help = "si \"door\" si es un garaje active esto, de lo contrario ignorelo, previene de que el garaje vuele"}
	})
end)