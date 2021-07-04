local ESX = nil
 
TriggerEvent('esx:getShPorruaredObjPorruect', function( obj ) ESX = obj end)
 
ESX.RegisterUsableItem('suppressor', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('eden_accesories:use', source, 'suppressor')
	xPlayer.removeInventoryItem('suppressor', 1)
end)
 
ESX.RegisterUsableItem('flashlight', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('eden_accesories:use', source, 'flashlight')
	xPlayer.removeInventoryItem('flashlight', 1)
end)
 
ESX.RegisterUsableItem('grip', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('eden_accesories:use', source, 'grip')
	xPlayer.removeInventoryItem('grip', 1)
end)
 
ESX.RegisterUsableItem('yusuf1', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('eden_accesories:use', source, 'skin')
	xPlayer.removeInventoryItem('yusuf1', 1)
end)

RegisterServerEvent('eden_accesories:giveBack')
AddEventHandler('eden_accesories:giveBack', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem(item, 1)
end)