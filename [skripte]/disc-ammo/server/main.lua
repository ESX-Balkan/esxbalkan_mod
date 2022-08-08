ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

CreateThread(function()
    Wait(0)
    for k, v in pairs(Config.Ammo) do
        ESX.RegisterUsableItem(v.name, function(source)
            TriggerClientEvent('disc-ammo:useAmmoItem', source, v)
        end)
    end
end)

RegisterServerEvent('disc-ammo:removeAmmoItem')
AddEventHandler('disc-ammo:removeAmmoItem', function(ammo)
    local player = ESX.GetPlayerFromId(source)
    player.removeInventoryItem(ammo.name, 1)
end)