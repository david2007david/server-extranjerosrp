----------- Authors: Morow
----------- Github:  https://github.com/Morow73

function MMA.UI:helpNotification(request)
    assert(rawequal(type(request), "table"), "MMA.UI:helpNotification : request is not a table !")

    BeginTextCommandDisplayHelp("THREESTRINGS")
    for i = 1,#request.notification,1 do
        AddTextComponentSubstringPlayerName(request.notification[i])
    end
    EndTextCommandDisplayHelp(0, false, true, request.duration or 5000)
end

function MMA.UI:Notification(text)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentString(text)
    EndTextCommandThefeedPostTicker(false, true)
end

function MMA.UI:showFloatingHelp(text, pos)
    local x,y,z = table.unpack(pos)

    SetTextScale(0.5, 0.5)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextFont(4)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z+1.0, 0)
    EndTextCommandDisplayText(0.0, 0.0)
end

function MMA.UI:sendNui(data, bool, name)
    assert(rawequal(type(data), "table"), "MMA.UI:sendNui : data is not a table !")

    if name ~= "sound" then
        SetNuiFocus(bool, bool)
    end
    
    SendNuiMessage(json.encode({
        status = bool,
        data = data,
        name = name
    }))

    MMA.UI.display = bool
end

function MMA.UI:openKeyboard()
    local result

    AddTextEntry('FMMC_KEY_TIP1', "Enter an amount")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", "", "", "", "", 50)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(0)
    end
    
    if UpdateOnscreenKeyboard() ~= 2 then 
        Wait(50)
        result = GetOnscreenKeyboardResult() 
        return tonumber(result)
          
    else
        Wait(50)
        return nil
    end
end

RegisterNetEvent("mma:Notification")
AddEventHandler("mma:Notification", function(text)
    assert(rawequal(type(text), "string"), "mma:Notification : text is not a string")
    MMA.UI:Notification(text)
end)