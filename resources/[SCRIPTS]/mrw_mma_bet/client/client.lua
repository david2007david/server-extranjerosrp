----------- Authors: Morow
----------- Github:  https://github.com/Morow73

local hasPressed, fightInProgress = false, false

function MMA:deleteObject()
    for i = 1,#self.object,1 do
        local obj = self.object[i]
        if DoesEntityExist(obj) then
            DeleteEntity(obj)
        end
    end
end

function MMA:deleteEntity()
    for i = 1,#self.entity,1 do
        local entity = self.entity[i]
        if DoesEntityExist(entity) then
            DeleteEntity(entity)
        end
    end
end

function MMA:createTimer(m, s)
    local betCoords = self.set.interact

    if self.displayTimer then
        local minutes, secondes
        local drawCreate = false

        local createDraw = function()
            CreateThread(function()
                while self.displayTimer do
                    Wait(1)
                    self.UI:showFloatingHelp(("%s : %s : %s"):format(translation["The fight will begin"], minutes, secondes), betCoords)
                end
            end)
        end

        CreateThread(function()
            for minute = m, 0, -1 do
                for second = s, 0, -1 do

                    minutes = minute
                    secondes = second

                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local distance = #(coords - betCoords)

                    if distance >= 5.0 and self.displayTimer then
                        self.displayTimer = not self.displayTimer
                    end

                    if distance < 5.0 then
                        
                        if not self.displayTimer then
                            self.displayTimer = not self.displayTimer
                            createDraw()
                        end
                    end 

                    if minutes == 0 and secondes == 00 then
                        self.displayTimer = false
                        drawCreate = false
                        break
                    end

                    Wait(1000)
                end
            end
        end)

        createDraw()
    end
end

function MMA:randomPed()
    for key, value in pairs(self.set.fighter) do
        local data = self.set.fighter[key]
        local model = data.model[1]
        local randomName = data.name[math.random(1, #data.name)][1]

        self.choise[key].model = model

        self.choise[key].name = randomName
    end

    return self.choise
end

function MMA:createFighter(data)

    for key, value in pairs(data) do
        local pedData = data[key]
        local model = pedData.model
        local hash = GetHashKey(model)

        RequestModel(model)

        while not HasModelLoaded(model) do
            Wait(1)
        end

        local fighter = CreatePed(5, hash, self.set.fighter[key].position, self.set.fighter[key].heading, false, true)

        TaskSetBlockingOfNonTemporaryEvents(fighter, true)
        SetEntityAsMissionEntity(fighter, true, false)
        SetPedCombatRange(fighter, 2)
        SetEntityMaxHealth(fighter, self.set.fighter[key].health)
        SetEntityHealth(fighter, self.set.fighter[key].health)

        table.insert(self.entity, fighter)
    end
end

function MMA:createBookmaker()

    for k,v in pairs(self.set.bookmaker) do
        local data = self.set.bookmaker[k]
        local model = data.model
        local hash = GetHashKey(model)

        RequestModel(model)

        while not HasModelLoaded(model) do
            Wait(1)
        end

        local bookmaker = CreatePed(5, hash, self.set.bookmaker[k].position, self.set.bookmaker[k].heading, false, true)

        SetBlockingOfNonTemporaryEvents(bookmaker, true)
        FreezeEntityPosition(bookmaker, true)
        SetEntityInvincible(bookmaker, true)
        SetPedCanBeTargetted(bookmaker, false)
        SetPedCanRagdoll(bookmaker, false)

        SetTimeout(5000, function()
            FreezeEntityPosition(bookmaker, true)
        end)

        table.insert(self.object, bookmaker)
    end
end

function MMA:startAnim(entity)
    ClearPedTasksImmediately(entity)

    Wait(1000)

    RequestAnimDict("rcmfanatic1celebrate")

    while not HasAnimDictLoaded("rcmfanatic1celebrate") do
        Wait(1)
    end

    TaskPlayAnim(entity, "rcmfanatic1celebrate", "celebrate", 8.0, -8.0, 15000, 1, 0, false, false, false)

    print("passed", RequestAnimDict("rcmfanatic1celebrate"))
end

function MMA:applyDamagePack(pack, entity)
    ApplyPedDamagePack(entity, pack, 100, 100)
end

function InitializeThread()
    MMA:createBookmaker()

    local betCoords = MMA.set.interact

    while true do
        local duration = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local distance = #(coords - betCoords)

        if distance <= 1.5 and not hasPressed then
            duration = 10

            MMA.UI:helpNotification({
                notification = {translation["Press for bet"]}
            })

            if IsControlPressed(0, 38) then
                TriggerServerEvent("mma:isFightReady")
                hasPressed = true
            end
        end

        if distance > 3.0 and hasPressed then
            MMA.UI:sendNui({}, false, "menu")
            hasPressed = false
        end

        Wait(duration)
    end
end

RegisterNetEvent("mma:isFightReady")
AddEventHandler("mma:isFightReady", function()
    MMA.UI:Notification(translation["No fight exist"])

    local IsReady = true

    SetTimeout(2500, function()
        if IsReady then
            IsReady = not IsReady
            hasPressed = not hasPressed
        end
    end)

    while IsReady do
        Wait(10)

        MMA.UI:helpNotification({
            notification = {
                translation["Press start fight"],
            }
        })

        if IsControlPressed(0, 73) then
            local randomData = MMA:randomPed()

            TriggerServerEvent("mma:actualizeFightState", randomData)
            hasPressed = not hasPressed
            IsReady = not IsReady
        end
    end
end)

RegisterNetEvent("mma:getFightersCote")
AddEventHandler("mma:getFightersCote", function(cote, name)
    assert(rawequal(type(cote), "table"), "mma:getFightersCote : cote is not a table !")
    local content = {}

    for key, value in pairs(cote) do
        MMA.choise[key].name = name[key].name

        table.insert(content, {
            bet = value.bet,
            cote = value.cote,
            name = name[key].name
        })
    end

    MMA.UI:sendNui(content, true, "menu")
end)

RegisterNetEvent("mma:startTimerCL")
AddEventHandler("mma:startTimerCL", function(time)
    MMA.displayTimer = true
    MMA:createTimer(time, 60)
end)

RegisterNetEvent("mma:cutTimerCL")
AddEventHandler("mma:cutTimerCL", function()
    MMA.displayTimer = false
    MMA:deleteEntity()
    MMA:new()
end)

RegisterNetEvent("mma:createFighter")
AddEventHandler("mma:createFighter", function(randomData)
    MMA:createFighter(randomData)
end)

RegisterNetEvent("mma:startFight")
AddEventHandler("mma:startFight", function()
    local startFight = true
    local betterCoords = GetEntityCoords(PlayerPedId())
    local distance = #(betterCoords - MMA.set.fighter[1].position)

    if distance <= 50.0 then
        MMA.UI:sendNui({}, true, "sound")
    end

    TaskCombatPed(MMA.entity[1], MMA.entity[2], 0, 16)
    TaskCombatPed(MMA.entity[2], MMA.entity[1], 0, 16)

    local sendEvent = function(index)
        SetTimeout(25000, function()
            TriggerServerEvent("mma:finishFight", index, MMA.choise[index].name)
        end)
    end

    CreateThread(function()
        while startFight do
            Wait(500)

            for i = 1,#MMA.entity,1 do
                local entity = MMA.entity[i]
                local health = GetEntityHealth(entity)
                local winner, looser = nil, nil

                if health <= 200 and health >= 100 then
                    MMA:applyDamagePack("SCR_Torture", entity)
                end

                if health <= 100 and health >= 15 then
                    MMA:applyDamagePack("Fall", entity)
                end

                if health <= 0 and not looser then
                    looser = entity
                end

                if looser then
                    if MMA.entity[i + 1] and GetEntityHealth(MMA.entity[i + 1]) > 0 then
                        winner = i + 1
                    end

                    if MMA.entity[i - 1] and GetEntityHealth(MMA.entity[i - 1]) > 0 then
                        winner = i - 1
                    end

                    if winner and MMA.entity[winner] ~= looser then
                        MMA:startAnim(MMA.entity[winner])
                        sendEvent(winner)
                        startFight = false
                    end
                end
            end
        end
    end)
end)

RegisterNUICallback("bet", function(data, cb)
    if data.id then

        MMA.UI:sendNui({}, false)

        local result = MMA.UI:openKeyboard()

        if result == nil or result <= 0 then
            MMA.UI:Notification(translation["Invalid amount"])
        else
            TriggerServerEvent("mma:bet", tonumber(data.id), result)
        end

        hasPressed = not hasPressed
        cb("OK")
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        MMA:deleteObject()
        MMA:deleteEntity()
    end
end)

CreateThread(InitializeThread)