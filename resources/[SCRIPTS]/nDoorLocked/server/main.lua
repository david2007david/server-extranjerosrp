--||by qalle-fivem||--
ESX				= nil
local DoorInfo	= {}

TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)

RegisterServerEvent('esx_doorlocks:updateState')
AddEventHandler('esx_doorlocks:updateState', function(doorID, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	if type(doorID) ~= 'number' then
		print('esx_doorlocks: didn\'t send a number!')
		return
	end

	-- make each door a table, and clean it when toggled
	DoorInfo[doorID] = {}

	-- assign information
	DoorInfo[doorID].state = state
	DoorInfo[doorID].doorID = doorID

	TriggerClientEvent('esx_doorlocks:setState', -1, doorID, state)
end)

ESX.RegisterServerCallback('esx_doorlocks:getDoorInfo', function(source, cb)
	cb(DoorInfo, #DoorInfo)
end)