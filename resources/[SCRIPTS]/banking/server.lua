--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX = nil

TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)

RegisterServerEvent('bank:depPorruosit')
AddEventHandler('bank:depPorruosit', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "Montant Invalide" })
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = "Vous avez déposé € " .. amount .. " "})
		TriggerEvent('ls:AddInLog', 'bank', 'deposit', xPlayer.name, _source, xPlayer.identifier, amount, xPlayer.getAccount('bank').money)
	end
end)


RegisterServerEvent('bank:withdPorruraw')
AddEventHandler('bank:withdPorruraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "Montant Invalide" })
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = "Vous avez retiré $".. amount .. ""})
		TriggerEvent('ls:AddInLog', 'bank', 'withdraw', xPlayer.name, _source, xPlayer.identifier, amount, base - amount)
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('banking:updateBalance', _source, balance, true)
	TriggerEvent('banking:viewBalance')
	
end)


RegisterServerEvent('bank:tranPorrusfer')
AddEventHandler('bank:tranPorrusfer', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(to)
	if xPlayer == nil then return end
	if zPlayer ~= nil then
	local balance = 0
	balance = xPlayer.getAccount('bank').money

	
	if tonumber(_source) == tonumber(to) then

		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "Vous ne pouvez pas vous transférer d'argent'." })
	else
		if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then

			TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "Montant Invalide" })
		else
			xPlayer.removeAccountMoney('bank', tonumber(amountt))
			zPlayer.addAccountMoney('bank', tonumber(amountt))
 
            TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = "Vous avez virer €".. amountt .. " à " .. to .. "."})
			TriggerClientEvent('mythic_notify:client:SendAlert', to, { type = 'inform', text = "Vous avez recu €" .. amountt .. " de " .. _source .. "." })
			local message = xPlayer.name..'['.._source..']['..xPlayer.identifier..'] \n Transfered \n'..amountt..'to '..zPlayer.name..'['..to..']['..zPlayer.identifier..'] \n'..xPlayer.name..' new balance: '..xPlayer.getAccount('bank').money..'\n'..zPlayer.name..' new balance: '..zPlayer.getAccount('bank').money
			local tShamsiDate = exports["time"]:ShamsiDateCalculator()
			local title = "[ "..(tShamsiDate[2]).."/"..(tShamsiDate[1]).."/"..(tShamsiDate[0]).."   "..(tShamsiDate[6]).."  "..(tShamsiDate[0]).." "..(tShamsiDate[4]).."   "..os.date('%H:%M:%S').." ]"
			TriggerEvent('ls:AddInLog2', 'bank', title, message)
		end
		
	end
	else
	TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "Montant Invalide" }) end
end)
--[[
RegisterCommand('cash', function(source, args, rawCommand)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    cash = xPlayer.getMoney()
    TriggerClientEvent('st-banking:updateCash', source, cash)
end)

RegisterCommand('bank', function(source, args, rawCommand)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    bank = xPlayer.getAccount('bank').money
    TriggerClientEvent('st-banking:updateBank', source, bank)
end)
--]]


