ESX.RegisterUsableItem('amnesia', function(source)
        
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('amnesia', 1)

	TriggerClientEvent('esx_amnesia:onSpice', source)
end)