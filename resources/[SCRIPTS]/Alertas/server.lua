
ESX = nil

TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)

ESX.RegisterServerCallback('Alertas', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT nivel FROM alertas ', {
		['@nivel'] = nivel
	}, function(result)
		if result[1] ~= nil then
cb(result[1].nivel)
		end
	end)
end)






