local color = { r = 220, g = 220, b = 220, alpha = 255 } -- Color of the text 
local font = 0 -- Font of the text
local dropShadow = true
local default_timer = 2
local teleport_ready = true

local background = {
    enable = true,
    color = { r = 25, g = 25, b = 25, alpha = 255 },
} 

local entrance_points = {
    {name = "heli", x = 732.09, y = -800.43, z = 18.07},
	{name = "heli1", x = -2679.82, y = 1342.72, z = 152.01},
	{name = "helipuerto", x = 332.30, y = -595.71, z = 43.28},	
	{name = "hospital", x = 340.08, y = -584.7, z = 28.8},		
	{name = "helipuerto", x = 341.5, y = -581.08, z = 28.8},	
    {name = "1ªplanta", x = 345.68, y = -582.65, z = 28.8},		
    {name = "mar", x = 3540.67, y = 3675.71, z = 28.12},			
	
}

local exit_points = {
    {name = "heli", x = 726.93, y = -708.24, z = 49.14},
	{name = "heli1", x = -2667.68, y = 1340.37, z = 156.93},
	{name = "helipuerto", x = 340.68, y = -584.16, z = 74.16},	
	{name = "hospital", x = 344.37, y = -586.25, z = 28.8},	
	{name = "helipuerto", x = 337.32, y = -586.98, z = 74.16},	
    {name = "1ªplanta", x = 330.34, y = -601.14, z = 43.28},	
    {name = "mar", x = 3540.67, y = 3675.71, z = 20.99},			
}



Citizen.CreateThread(function()

    if Config.Blip then

	    for a = 1, #entrance_points do

            Blips = AddBlipForCoord(entrance_points[a].x, entrance_points[a].y, entrance_points[a].z)

            SetBlipSprite (Blips, 40)
            SetBlipDisplay(Blips, 4)
            SetBlipScale  (Blips, 0.8)
            SetBlipAsShortRange(Blips, true)
        
            SetBlipScale  (blip, 1.0)
            SetBlipColour (Blips, 39)
        
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(entrance_points[a].name)
            EndTextCommandSetBlipName(Blips)

        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for a = 1, #entrance_points do
            local plyCoords = GetEntityCoords(GetPlayerPed(PlayerId()), false)
            local distance = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, entrance_points[a].x, entrance_points[a].y, entrance_points[a].z)
            local entrance_name = entrance_points[a].name

            if distance <= 1.5 then
                if teleport_ready then
                    DrawText3D(entrance_points[a].x, entrance_points[a].y, entrance_points[a].z, "Press ~r~[E]~w~ to Enter "..entrance_name.."")
                end
                if IsControlJustPressed(1, 38) and teleport_ready then
                    teleport_ready = false
                    TeleportToExit(entrance_name)
                    timer()
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for b = 1, #exit_points do
            local plyCoords = GetEntityCoords(GetPlayerPed(PlayerId()), false)
            local distance = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, exit_points[b].x, exit_points[b].y, exit_points[b].z)
            local exit_name = exit_points[b].name

            if distance <= 1.5 then
                if teleport_ready then
                    DrawText3D(exit_points[b].x, exit_points[b].y, exit_points[b].z, "Press ~r~[E]~w~ to Exit "..exit_name.."")
                end
                if IsControlJustPressed(1, 38) and teleport_ready then
                    teleport_ready = false
                    TeleportToEntrance(exit_name)
                    timer()
                end
            end
        end
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = ((1/dist)*2)*(1/GetGameplayCamFov())*45

    if onScreen then

        -- Formalize the text
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextScale(0.0*scale, 0.45*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextCentre(true)
        if dropShadow then
            SetTextDropshadow(10, 100, 100, 100, 255)
        end

        -- Calculate width and height
        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.55*scale, font)
        local width = EndTextCommandGetWidth(font)

        -- Diplay the text
        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)

        if background.enable then
            DrawRect(_x, _y+scale/58, width, height, background.color.r, background.color.g, background.color.b , background.color.alpha)
        end
    end
end
function timer()
    local time = default_timer
    for i = 1, time do
        Citizen.Wait(0)
    end
    teleport_ready = true
end
function TeleportToExit(name)
    for a = 1, #exit_points do
        if exit_points[a].name == name then
            DoScreenFadeOut(500)
            Citizen.Wait(1000)
            SetEntityCoords(GetPlayerPed(PlayerId()), exit_points[a].x, exit_points[a].y, exit_points[a].z, 0.0, 0.0, 0.0, false)
            Citizen.Wait(1000)
            DoScreenFadeIn(500)
            Citizen.Wait(1000)
            return
        end
    end
end
function TeleportToEntrance(name)
    for b = 1, #entrance_points do
        if entrance_points[b].name == name then
            DoScreenFadeOut(500)
            Citizen.Wait(1000)
            SetEntityCoords(GetPlayerPed(PlayerId()), entrance_points[b].x, entrance_points[b].y, entrance_points[b].z, 0.0, 0.0, 0.0, false)
            Citizen.Wait(1000)
            DoScreenFadeIn(500)
            Citizen.Wait(1000)
            return
        end
    end
end