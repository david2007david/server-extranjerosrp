----------- Authors: Morow
----------- Github:  https://github.com/Morow73

if USE_ESX then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

local function mathRound(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function MMA:addBet(identifier, users, index, bet)

    table.insert(self.bettor[index], {
        identifier = identifier,
        users = users,
        bet = bet
    })

    self.fighter[index].bet = self.fighter[index].bet + bet
    self.fighter[index].cote = self.fighter[index].cote + 1 / #self.bettor[index]
    
end

function MMA:getFighterCote(index)
    return self.fighter[index].cote
end

function MMA:getFighterBet(index)
    return self.fighter[index].bet
end

function MMA:getAllFighterCote()
    return self.fighter
end

function MMA:getPlayerHasBet(identifier)
   for k,v in pairs(self.bettor) do
       for i=1,#self.bettor[k],1 do
           local user = self.bettor[k][i]

            if user.identifier == identifier then
                return true
            end
       end
   end

   return false
end

MMA.getPlayerIdentifier = function(source)
    local identifier

    for k,v in ipairs(GetPlayerIdentifiers(source)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end

    return identifier
end

RegisterNetEvent("mma:isFightReady")
AddEventHandler("mma:isFightReady", function()
    local x_source = source

    if MMA.isFightBlocked then
        TriggerClientEvent("mma:Notification", x_source, translation["Fight has already taken"])
        return
    end

    if not MMA.isFightReady then
        TriggerClientEvent("mma:isFightReady", x_source)
    else
        local fighterCote = MMA:getAllFighterCote()
        TriggerClientEvent("mma:getFightersCote", x_source, fighterCote, MMA.random)
    end
end)

RegisterNetEvent("mma:actualizeFightState")
AddEventHandler("mma:actualizeFightState", function(randomData)
    local x_source = source

    if not MMA.isFightReady and not MMA.isFightBlocked then
        local time = MMA.timer["beforeStart"]
        local random = mathRound(time/60, 0) - 1

        if MMA.random == nil then
            MMA.random = randomData
        end

        TriggerClientEvent("mma:startTimerCL", -1, random)
        TriggerClientEvent("mma:createFighter", -1, MMA.random)

        MMA.isFightReady = not MMA.isFightReady

        CreateThread(function()
            while MMA.isFightReady do
                Wait(1000)
                
                time = time - 1
  
                if time == 0 then
                    if #MMA.bettor[1] >= 1 or #MMA.bettor[2] >= 1 then
                        TriggerClientEvent("mma:startFight", -1)
                    else
                        TriggerClientEvent("mma:Notification", x_source, translation["Combat cancelled"])
                        TriggerClientEvent("mma:cutTimerCL", -1)
                        MMA:new()
                    end
                    break
                end
            end
        end)
    end
end)

RegisterNetEvent("mma:bet")
AddEventHandler("mma:bet", function(index, bet)

    if MMA.fighter[index] == nil or MMA.isFightBlocked then
        return
    else
        if bet == nil or bet <= 0 then
            return
        end
    end

    local x_source = source
    local identifier = MMA.getPlayerIdentifier(x_source)
    local hasBet = MMA:getPlayerHasBet(identifier)

    if hasBet then
        TriggerClientEvent("mma:Notification", x_source, translation["You has already bet"])
        return
    end

    if USE_ESX then
        local xPlayer = ESX.GetPlayerFromId(x_source)
        local hasMoney = xPlayer.getMoney()

        if hasMoney >= bet then
            xPlayer.removeMoney(bet)
            MMA:addBet(identifier, x_source, index, bet)
            TriggerClientEvent("mma:Notification", x_source, translation["Bet on fighter"])
        else
            TriggerClientEvent("mma:Notification", x_source, translation["No money"])
        end
    else
        -- IF USE OTHER FRAMEWORK
        -- Add your line to compare the player’s money with the bet amount
        -- uncommented function and trigger
 
        MMA:addBet(identifier, x_source, index, bet)
        TriggerClientEvent("mma:Notification", x_source, translation["Bet on fighter"])
    end
end)

RegisterNetEvent("mma:finishFight")
AddEventHandler("mma:finishFight", function(index, fighterName)
    if MMA.fighter[index] == nil or MMA.isFightBlocked then
        return
    end

    MMA.isFightBlocked = true
    local cote = MMA:getFighterCote(index)
    
    SetTimeout(MMA.timer["betweenTwoFight"], function()
        MMA:new()
    end)

    for key, value in pairs(MMA.bettor[index]) do
        print("bet", value.users)

        local result = value.bet * cote
        local totalBet = MMA.fighter[index].bet - result

        if totalBet >= 0 then
            if USE_ESX then
                local xPlayer = ESX.GetPlayerFromId(value.users)

                if xPlayer then
                    xPlayer.addMoney(result)
                    TriggerClientEvent("mma:Notification", xPlayer.source, ("%s : %s $"):format(translation["Win"], result))
                    TriggerClientEvent("mma:Notification", xPlayer.source, ("%s %s"):format(fighterName, translation["Fighter name win"]))
                end
            else
                -- IF USE OTHER FRAMEWORK
                -- add your line for check if player exist
                -- add your line for add player money 

                TriggerClientEvent("mma:Notification", value.users, ("%s %s"):format(fighterName, translation["Fighter name win"]))
                TriggerClientEvent("mma:Notification", value.users, ("%s : %s $"):format(translation["Win"], result))
            end
        end
    end

    TriggerClientEvent("mma:cutTimerCL", -1)
end)
