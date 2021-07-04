  ESX = nil
TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)

local deadPeds = {}

RegisterServerEvent('loffe_robbery:pedDead')
AddEventHandler('loffe_robbery:pedDead', function(store)
    if not deadPeds[store] then
        deadPeds[store] = 'deadlol'
        TriggerClientEvent('loffe_robbery:onPedDeath', -1, store)
        local second = 1000
        local minute = 60 * second
        local hour = 60 * minute
        local cooldown = Config.Shops[store].cooldown
        local wait = cooldown.hour * hour + cooldown.minute * minute + cooldown.second * second
        Wait(wait)
        if not Config.Shops[store].robbed then
            for k, v in pairs(deadPeds) do if k == store then table.remove(deadPeds, k) end end
            TriggerClientEvent('loffe_robbery:resetStore', -1, store)
        end
    end
end)

RegisterServerEvent('loffe_robbery:handsUp')
AddEventHandler('loffe_robbery:handsUp', function(store)
    TriggerClientEvent('loffe_robbery:handsUp', -1, store)
end)

RegisterServerEvent('loffe_robbery:pickUp')
AddEventHandler('loffe_robbery:pickUp', function(store)
    local xPlayer = ESX.GetPlayerFromId(source)
    local randomAmount = math.random(Config.Shops[store].money[1], Config.Shops[store].money[2])
    xPlayer.addAccountMoney('black_money', randomAmount)
    TriggerClientEvent('esx:showNotification', source, Translation[Config.Locale]['cashrecieved'] .. '' .. randomAmount .. ' ' .. Translation[Config.Locale]['currency'])
    --[[TriggerClientEvent("pNotify:SendNotification", source, {text ='Has recibido ' .. randomAmount .. '$.',
				        type = "info",
				        timeout = 2000,
				        layout = "centerLeft",
				        queue = "cl",
				        animation = {
				            open = "gta_effects_open",
				            close = "gta_effects_fade_out"
				        }})]]
    TriggerClientEvent('loffe_robbery:removePickup', -1, store) 
end)

ESX.RegisterServerCallback('loffe_robbery:canRob', function(source, cb, store)
    local cops = 0
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            cops = cops + 1
        end
    end
    if cops >= Config.Shops[store].cops then
        if not Config.Shops[store].robbed and not deadPeds[store] then
            cb(true)
        else
            cb(false)
        end
    else
        cb('no_cops')
    end
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            TriggerClientEvent('loffe_robbery:msgPolice', xPlayer.source, store, src)
            Citizen.Wait(5000)
        end
    end
end)


RegisterServerEvent('loffe_robbery:rob')
AddEventHandler('loffe_robbery:rob', function(store)
    local src = source
    Config.Shops[store].robbed = true
    local xPlayers = ESX.GetPlayers()
    TriggerClientEvent('loffe_robbery:rob', -1, store)
    Wait(30000)
    TriggerClientEvent('loffe_robbery:robberyOver', src)

    local second = 1000
    local minute = 60 * second
    local hour = 60 * minute
    local cooldown = Config.Shops[store].cooldown
    local wait = cooldown.hour * hour + cooldown.minute * minute + cooldown.second * second
    Wait(wait)
    Config.Shops[store].robbed = false
    for k, v in pairs(deadPeds) do if k == store then table.remove(deadPeds, k) end end
    TriggerClientEvent('loffe_robbery:resetStore', -1, store)
end)

Citizen.CreateThread(function()
    while true do
        for i = 1, #deadPeds do TriggerClientEvent('loffe_robbery:pedDead', -1, i) end -- update dead peds
        Citizen.Wait(500)
    end
end)


RegisterServerEvent('robo_badulake:sendLog')
AddEventHandler('robo_badulake:sendLog', function(name, coords2)

    local date = os.date('*t')
    if date.month < 10 then date.month = '0' .. tostring(date.month) end
    if date.day < 10 then date.day = '0' .. tostring(date.day) end
    if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
    if date.min < 10 then date.min = '0' .. tostring(date.min) end
    if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end

    sendToDisc("El jugador con nombre " .. GetPlayerName(source) .. " ha robado el badulake  de las coordenadas: " .. coords2 , 
    'Fecha ' .. date.day .. '/' .. date.month .. '/' .. date.year .. ' | ' .. date.hour .. ':' .. date.min ..  ' minutos con ' .. date.sec .. " segundos",  webHook, 16711680)

end)

function sendToDisc(title, message, footer, webhookURL, color)
	local embed = {}
	embed = {
		{
			["color"] = 16711680, -- GREEN = 65280 --- RED = 16711680
			["title"] = "**".. title .."**",
      ["description"] = "** " .. message ..  " **",
			["footer"] = {
				["text"] = footer,
      },
		}
	}
	-- Start
	-- TODO Input Webhook
	PerformHttpRequest("https://discordapp.com/api/webhooks/738565946817380516/b1XK6zpOpFombyp_z9Tntv_GG-1YwDGvePoTGpaFfD2bsyvugALFUZI4TwymLKftp4Xm", 
	function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  -- END
end