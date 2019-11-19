ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx_makeitrain:pay')
AddEventHandler('esx_makeitrain:pay', function(itemName)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 1000
    if xPlayer.getMoney() >= price then
        TriggerEvent('esx_makeitrain:TakeMoney', source, price)
    else
        local missingMoney = price - xPlayer.getMoney()
        TriggerClientEvent('esx:showNotification', source, _U('not_enough', missingMoney))
    end
end)

AddEventHandler('esx_makeitrain:TakeMoney', function(source, price)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeMoney(price)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_unicorn', function(account)
        account.addMoney(price)
    end)
    TriggerClientEvent('esx:showNotification', source, _U('tipped_dancer'))
end)