local minimapOn = true

RegisterCommand("minimapa", function()
minimapOn = not minimapOn
    end, false)

Citizen.CreateThread(function()
    while true do
        DisplayRadar(minimapOn)
        Citizen.Wait(1)
    end
end)