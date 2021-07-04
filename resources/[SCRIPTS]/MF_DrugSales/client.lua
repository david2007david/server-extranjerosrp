local MFS = MF_DrugSales

function MFS:Awake(...)
    while not ESX do Citizen.Wait(0); end
    while not ESX.IsPlayerLoaded() do Citizen.Wait(0); end
    self.PlayerData = ESX.GetPlayerData()
    ESX.TriggerServerCallback('MF_DrugSales:GetStartData', function(retVal,retData) self.dS = true; self.cS = retVal; self:Start(retData); end)
end

function MFS:Start(...)
  if self.ShowBlip then self:DoBlips(); end
  if self.dS and self.cS then self:Update(); end
end


function MFS:DoBlips()
  local blip = AddBlipForCoord(self.HintLocation.x, self.HintLocation.y, self.HintLocation.z)
  SetBlipSprite               (blip, 205)
  SetBlipDisplay              (blip, 3)
  SetBlipScale                (blip, 1.0)
  SetBlipColour               (blip, 4)
  SetBlipAsShortRange         (blip, false)
  SetBlipHighDetail           (blip, true)
  BeginTextCommandSetBlipName ("STRING")
  AddTextComponentString      ("Shady Backalley")
  EndTextCommandSetBlipName   (blip)
end


function MFS:Update(...)
  local noteTemplate = Utils.DrawTextTemplate()
  noteTemplate.x = 0.5
  noteTemplate.y = 0.5
  local timer = 0
  while self.dS and self.cS do
    Citizen.Wait(0)
    local plyPed = GetPlayerPed(-1)
    local plyPos = GetEntityCoords(plyPed)
    if not self.MissionStarted then
      local dist = Utils.GetVecDist(plyPos, self.HintLocation)
      if dist < self.DrawTextDist then
        local p = self.HintLocation
        Utils.DrawText3D(p.x,p.y,p.z, "pulsa [~r~E~s~] llamar a la puerta.")
        if IsControlJustPressed(0, Keys["E"]) and GetGameTimer() - timer > 150 then
        ExecuteCommand("entorno Alguien intenta vender Drogas")		
          timer = GetGameTimer()
          TaskGoStraightToCoord(plyPed, p.x, p.y, p.z, 10.0, 10, p.w, 0.5)
          Wait(3000)
          ClearPedTasksImmediately(plyPed)

          while not HasAnimDictLoaded("timetable@jimmy@doorknock@") do RequestAnimDict("timetable@jimmy@doorknock@"); Citizen.Wait(0); end
          TaskPlayAnim( plyPed, "timetable@jimmy@doorknock@", "knockdoor_idle", 8.0, 8.0, -1, 4, 0, 0, 0, 0 )     
          Citizen.Wait(0)
          while IsEntityPlayingAnim(plyPed, "timetable@jimmy@doorknock@", "knockdoor_idle", 3) do Citizen.Wait(0); end          

          Citizen.Wait(1000)

          TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"Me", "te puse el gps sube al coche el comprador te espera."}})
          ClearPedTasksImmediately(plyPed)

          local randNum = math.random(1,#self.SalesLocations)
          local spawnLoc = self.SalesLocations[randNum]
          local nearStreet = GetStreetNameFromHashKey(GetStreetNameAtCoord(spawnLoc.x,spawnLoc.y,spawnLoc.z))
          noteTemplate.text = "Encuentra al comprador cerca "..nearStreet..".no tardes."

          self.MissionStarted = spawnLoc

          SetNewWaypoint(spawnLoc.x,spawnLoc.y)

          local timer = GetGameTimer()
          while (GetGameTimer() - timer) < (self.NotificationTime * 1000) do
            Citizen.Wait(0)
            DrawSprite("commonmenu","", 0.5,0.53, 0.2,0.1,0.0, 125,125,125,200)
            Utils.DrawText(noteTemplate)
          end
          self:MissionStart()
        end
      end
    end
  end
end

function MFS:MissionStart()
  local plyPed = GetPlayerPed(-1)
  local pPos = GetEntityCoords(plyPed)
  local tPos = self.MissionStarted
  local distToDropoff = CalculateTravelDistanceBetweenPoints(tPos.x,tPos.y,tPos.z, pPos.x,pPos.y,pPos.z)
  while not distToDropoff or (distToDropoff >= 10000 or distToDropoff <= 1000) do distToDropoff = CalculateTravelDistanceBetweenPoints(tPos.x,tPos.y,tPos.z, pPos.x,pPos.y,pPos.z) Citizen.Wait(10); end
  local textTemplate = Utils.DrawTextTemplate()
  local prices = {}
  for k,v in pairs(self.DrugItems) do 
    prices[v] = math.floor(self.DrugPrices[v]*(math.random(100.0-self.MaxPriceVariance,100.0+self.MaxPriceVariance)/100.0))
  end
  textTemplate.x = 0.8
  textTemplate.y = 0.8
  local startTime = GetGameTimer()
  local startDist = distToDropoff
  local timer = ((startDist / 1000) * 60) * 1000
  while ((GetGameTimer() - startTime) < math.floor(timer) and not self.MissionCompleted) or (self.MissionCompleted and distToDropoff < (self.DrawTextDist*2.0)) do
    Citizen.Wait(0)   
    plyPed = GetPlayerPed(-1)
    pPos = GetEntityCoords(plyPed)
    distToDropoff = Utils.GetVecDist(tPos,pPos)
    --distToDropoff = CalculateTravelDistanceBetweenPoints(tPos.x,tPos.y,tPos.z, pPos.x,pPos.y,pPos.z) 
    if not self.MissionCompleted then
      textTemplate.text = 'Tiempo restante : '..math.floor((((startDist / 1000) * 60) * 1000 - (GetGameTimer() - startTime))/1000)..' segundos.'
      Utils.DrawText(textTemplate)
    end
    if distToDropoff < 50.0 then
      if not self.PedSpawned then
        local hash = GetHashKey(self.DealerPed)
        while not HasModelLoaded(hash) do RequestModel(hash); Citizen.Wait(0); end
        self.PedSpawned = CreatePed(4, hash, tPos.x,tPos.y,tPos.z,tPos.w, true,true)
        SetEntityAsMissionEntity(self.PedSpawned,true,true)
        SetModelAsNoLongerNeeded(hash)
      end
      if distToDropoff < self.DrawTextDist then
        if not self.MissionCompleted then 
          startTime = 0
          self.MissionCompleted = true
          ESX.ShowNotification("Encontraste el comprador !")
        end
        Utils.DrawText3D(tPos.x,tPos.y,tPos.z, "pulsa [~r~X~s~] hablar con el comprador.")
        if IsControlJustPressed(0,73) then
          --self:PoliceNotifyTimer(tPos)
          ESX.TriggerServerCallback('MF_DrugSales:GetDrugCount', function(counts)
            ESX.UI.Menu.CloseAll()
            local elements = {}
            for k,v in pairs(self.DrugItems) do 
              drugPrice = prices[v]
              table.insert(elements, {label = k..' : €'..drugPrice, val = v, price = drugPrice})
            end
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Drug_Dealer',{ title = "Comprador de medicamentos", align = 'left', elements = elements },
              function(data,menu) 
                local count = false 
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'How_Much', {title = "Cuanto quieres vender ? [Max : "..counts[data.current.val].."]"}, 
                  function(data2, menu2)
                    local quantity = tonumber(data2.value)

                    if quantity == nil then
                      ESX.ShowNotification("Cantidad inválida.")
                    else
                      count = quantity
                      menu2.close()
                    end
                  end, 
                  function(data2, menu2)
                    menu2.close()
                  end
                )
                while not count do Citizen.Wait(0); end
                if tonumber(count) > tonumber(counts[data.current.val]) then 
                  ESX.ShowNotification("No tienes tanto. "..data.current.val..".")
                else 
                  ESX.ShowNotification("Tu vendiste "..tonumber(count).." "..data.current.val.." por €"..tonumber(count)*tonumber(data.current.price)..".")
                  TriggerServerEvent('MF_DrugSales:Sold',data.current.val,data.current.price,count)
                  menu.close()
                  Citizen.Wait(1500)
                end
              end,
              function(data,menu)
                menu.close()
              end
            )
          end)
        end
      end
    end
  end

  if not self.MissionCompleted then
    ESX.ShowNotification("Se te acabó el tiempo y el comprador se fue.")
    if self.PedSpawned then 
      DeletePed(self.PedSpawned)
    end
    self.MissionCompleted = false 
    self.MissionStarted = false
    self.PedSpawned = false
  else
    ESX.ShowNotification("El distribuidor dejó el lugar.")
    if self.PedSpawned then 
      DeletePed(self.PedSpawned)
    end
    self.MissionCompleted = false 
    self.MissionStarted = false
    self.PedSpawned = false
  end
end



Citizen.CreateThread(function(...) MFS:Awake(...); end)

---------------------------------
--------- ikNox#6088 ------------
---------------------------------