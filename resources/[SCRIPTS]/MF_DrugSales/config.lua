MF_DrugSales = {}
local MFS = MF_DrugSales

MFS.UpdateVersion = '1.0.0.002'

TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj; end)

Citizen.CreateThread(function(...)
  while not ESX do
    TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj; end)
    Citizen.Wait(0)
  end
end)

-- Police Job
--MFS.PoliceJobName = 'police' 

-- For the door.
MFS.ShowBlip = true
MFS.DrawTextDist = 10.0
MFS.NotificationTime = 5.0

--MFS.PoliceNotifyCountdown = 0.5 -- minutes from reaching dealer until police are notified.
--MFS.NotifyPoliceTimer = 10

-- The door.
MFS.HintLocation      =   vector4(-1152.0,-1447.54,4.71, 36.74)
MFS.SalesLocations    =   {
  [1] = vector4(1372.69,3617.62,34.89,198.17),
  [2] = vector4(2318.79,2553.66,47.69,221.28),
  [3] = vector4(1510.11,6326.52,24.60,040.02),
  [4] = vector4(0033.86,3666.52,39.72,227.70),
}

MFS.TargetAverageSpeed = 60.0

MFS.DealerPed = 's_m_y_dealer_01'

MFS.DrugItems = {
  ['marijuana'] = 'marijuana',  
  ['Cocaina'] = 'coke',
  ['especias'] = 'spice',
  ['Montre Rolex'] = 'rolex',
  ['Lingote de oro'] = 'gold',
  ['Diamantes'] = 'diamond',
  ['Saco de Drogas'] = 'bagofdope',
}

MFS.DrugPrices = {
  ['spice'] = 12,
  ['coke'] = 14,
  ['marijuana'] = 10,
  ['gold'] = 11,
  ['rolex'] = 18,
  ['diamond'] = 14,
  ['bagofdope'] = 119,
}

MFS.MaxPriceVariance = 10.0 --%