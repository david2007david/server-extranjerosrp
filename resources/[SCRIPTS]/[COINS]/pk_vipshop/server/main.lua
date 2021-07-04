ESX = nil

TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)

RegisterServerEvent('PokeShops:comprar')
AddEventHandler('PokeShops:comprar', function(item, price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if(xPlayer.getAccount('ca_coins').money >= price) then
		xPlayer.removeAccountMoney('ca_coins', price)
		xPlayer.addInventoryItem(item, 1)
	end
end)