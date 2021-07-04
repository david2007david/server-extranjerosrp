ESX = nil

TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(source)
  TriggerEvent('esx_license:getLicenses', source, function(licenses)
    TriggerClientEvent('esx_airschool:loadLicenses', source, licenses)
  end)
end)

RegisterNetEvent('esx_airschool:addLicense')
AddEventHandler('esx_airschool:addLicense', function(type)

  local _source = source

  TriggerEvent('esx_license:addLicense', _source, type, function()
    TriggerEvent('esx_license:getLicenses', _source, function(licenses)
      TriggerClientEvent('esx_airschool:loadLicenses', _source, licenses)
    end)
  end)

end)

RegisterNetEvent('esx_airschool:pay')
AddEventHandler('esx_airschool:pay', function(price)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  xPlayer.removeMoney(price)

  TriggerClientEvent('esx:showNotification', _source, _U('you_paid') .. price)

end)
