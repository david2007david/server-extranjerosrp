ESX = nil

TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'pearls', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'pearls', _U('pearls_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'pearls', 'pearls', 'society_pearls', 'society_pearls', 'society_pearls', {type = 'private'})

RegisterServerEvent('esx_gacha_pearls:getStockItem')
AddEventHandler('esx_gacha_pearls:getStockItem', function(itemName, count)
  local _source = source  
  local xPlayer = ESX.GetPlayerFromId(_source) 

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pearls', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count and xPlayer.getInventoryItem(itemName, count) then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)
  end)
end)

ESX.RegisterServerCallback('esx_gacha_pearls:getStockItems', function(source, cb)
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pearls', function(inventory)

    cb(inventory.items)
  end)
end)

ESX.RegisterServerCallback('esx_gacha_pearls:getStockItemsNorte', function(source, cb)
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pearls', function(inventory)

    cb(inventory.items)
  end)
end)

ESX.RegisterServerCallback('esx_gacha_pearls:getStockItemsJefe', function(source, cb)
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pearls_privado', function(inventory)

    cb(inventory.items)
  end)
end)

RegisterServerEvent('esx_gacha_pearls:putStockItems')
AddEventHandler('esx_gacha_pearls:putStockItems', function(itemName, count)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pearls', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)
  end)
end)

RegisterServerEvent('esx_gacha_pearls:putStockItemsNorte')
AddEventHandler('esx_gacha_pearls:putStockItemsNorte', function(itemName, count)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pearls', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)
  end)
end)

RegisterServerEvent('esx_gacha_pearls:putStockItemsJefe')
AddEventHandler('esx_gacha_pearls:putStockItemsJefe', function(itemName, count)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pearls_privado', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)
  end)
end)

RegisterServerEvent('esx_gacha_pearls:buyItem')
AddEventHandler('esx_gacha_pearls:buyItem', function(itemName, price, itemLabel)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pearls', function(account)
        societyAccount = account
      end)
    --print("sociedad: "..account)
    if societyAccount ~= nil and societyAccount.money >= price then
        if xPlayer.getInventoryItem(itemName, 1) then
            societyAccount.removeMoney(price)
            xPlayer.addInventoryItem(itemName, 1)
            TriggerClientEvent('esx:showNotification', _source, _U('bought') .. itemLabel)
        else
            TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
        end
    else
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
    end
end)


RegisterServerEvent('esx_gacha_pearls:crafteo')
AddEventHandler('esx_gacha_pearls:crafteo', function(itemValue)
    local _source = source
    local _itemValue = itemValue

    TriggerClientEvent('esx:showNotification', _source, _U('assembling_cocktail'))
    --Crafteo Caldo pollo
    if _itemValue == 'caldopollo' then
        SetTimeout(10000, function()        
  
            local xPlayer = ESX.GetPlayerFromId(_source)

            local alephQuantity = xPlayer.getInventoryItem('pollo').count
            local bethQuantity = xPlayer.getInventoryItem('water').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('pollo') .. '~w~')
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') ..'agua' .. '~w~')
            else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('caldopollo') .. ' ~w~!')
                    xPlayer.removeInventoryItem('pollo', 1)
                    xPlayer.removeInventoryItem('water', 1)
                    xPlayer.addInventoryItem('caldopollo', 1)
            end 
        end)
      elseif _itemValue == 'entrecot' then
          SetTimeout(10000, function()        
    
              local xPlayer = ESX.GetPlayerFromId(_source)
  
              local alephQuantity = xPlayer.getInventoryItem('pollo').count
              local bethQuantity = xPlayer.getInventoryItem('water').count
  
              if alephQuantity < 1 then
                  TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('pollo') .. '~w~')
              elseif bethQuantity < 1 then
                  TriggerClientEvent('esx:showNotification', _source, _U('not_enough') ..'agua' .. '~w~')
              else
                      TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('entrecot') .. ' ~w~!')
                      xPlayer.removeInventoryItem('pollo', 1)
                      xPlayer.removeInventoryItem('water', 1)
                      xPlayer.addInventoryItem('entrecot', 1)
              end 
          end)
    end --fin entrecot   
end) 

ESX.RegisterServerCallback('esx_gacha_pearls:getPlayerInventory', function(source, cb)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local items = xPlayer.inventory
 
  cb({items = items})  
end)
