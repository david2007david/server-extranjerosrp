ESX = nil
TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)

RegisterServerEvent('esx_garbagePorrujob:pay')
AddEventHandler('esx_garbagePorrujob:pay', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addMoney(tonumber(amount))
end)
