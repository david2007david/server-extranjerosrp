ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

