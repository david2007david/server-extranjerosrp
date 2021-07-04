AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', _U('unknown_command', command_args[1]) } })
end)

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		if Config.EnableESXIdentity then name = GetCharacterName(source) end
		--TriggerClientEvent('chat:addMessage', -1, { args = { _U('ooc_prefix', name), message }, color = { 128, 128, 128 } })
	end
end)

RegisterCommand('ayuda', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(playerId)
	if Config.EnableESXIdentity then name = GetCharacterName(playerId) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('ooc_prefix', playerId), args }, color = { 255, 205, 0 } })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('twt', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('twt_prefix', name), args }, color = { 0, 153, 204 } })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('anon', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('an_prefix', name), args }, color = { 0, 153, 204 } })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('mc', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(playerId)
	if Config.EnableESXIdentity then name = GetCharacterName(playerId) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('mc_prefix', playerId), args }, color = { 5, 255, 31 } })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('tx', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(playerId)
	if Config.EnableESXIdentity then name = GetCharacterName(playerId) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('tx_prefix', playerId), args }, color = { 246, 255, 51 } })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('me', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(playerId)
	if Config.EnableESXIdentity then name = GetCharacterName(playerId) end

	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('me_prefix', playerId), args, { 253, 0, 0 })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('ems', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(playerId)
	if Config.EnableESXIdentity then name = GetCharacterName(playerId) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('ems_prefix', playerId), args }, color = { 255, 0, 0 } })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('msg', function(source, args, user)

	if GetPlayerName(tonumber(args[1])) then
		local player = tonumber(args[1])
		table.remove(args, 1)
		
		TriggerClientEvent('chat:addMessage', player, {args = {"^1[PRIVADO] de "..GetPlayerName(source)..  "[" .. source .. "]: ^0" ..table.concat(args, " ")}, color = {30, 210, 0}})
		TriggerClientEvent('chat:addMessage', source, {args = {"^1[PRIVADO] para "..GetPlayerName(player)..  "[" .. player .. "]: ^0" ..table.concat(args, " ")}, color = {30, 206, 0}})

	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "ID de jugador incorrecta!")
	end

end,false)


RegisterCommand('do', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(playerId)
	if Config.EnableESXIdentity then name = GetCharacterName(playerId) end

	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('do_prefix', playerId), args, { 0, 184, 253 })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('oop', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(playerId)
	if Config.EnableESXIdentity then name = GetCharacterName(playerId) end

	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('oop_prefix', playerId), args, { 171, 171, 171 })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('lspd', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(playerId)
	if Config.EnableESXIdentity then name = GetCharacterName(playerId) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('cnp_prefix', playerId), args }, color = { 0, 193, 255 } })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('pid', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(playerId)
	if Config.EnableESXIdentity then name = GetCharacterName(playerId) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('md_prefix', playerId), args }, color = { 93, 0, 255 } })
	--print(('%s: %s'):format(name, args))
end, false)

--RegisterCommand('gc', function(playerId, args, rawCommand)
	--if playerId == 0 then
		--print('esx_rpchat: you can\'t use this command from rcon!')
		--return
	--end

	--args = table.concat(args, ' ')
	--local name = GetPlayerName(playerId)
	--if Config.EnableESXIdentity then name = GetCharacterName(playerId) end

	--TriggerClientEvent('chat:addMessage', -1, { args = { _U('gc_prefix', playerId), args }, color = { 4, 138, 0 } })
	--print(('%s: %s'):format(name, args))
--end, false)


function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end

--RegisterCommand('en', function(source, args, rawCommand)
	--if source == 0 then
		--print('esx_rpchat: you can\'t use this command from rcon!')
		--return
	--end

	--args = table.concat(args, ' ')
	--local name = GetPlayerName(source)
	--if Config.EnableESXIdentity then name = GetCharacterName(source) end

	--TriggerClientEvent('chat:addMessage', -1, { args = { _U('en_prefix', name), args }, color = { 0, 0, 255 } })
	--print(('%s: %s'):format(name, args)) --este desactivado
--end, false)
