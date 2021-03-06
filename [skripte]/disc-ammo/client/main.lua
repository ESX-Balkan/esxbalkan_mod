ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('disc-ammo:useAmmoItem')
AddEventHandler('disc-ammo:useAmmoItem', function(ammo)
    local playerPed = PlayerPedId()
    local weapon

    local found, currentWeapon = GetCurrentPedWeapon(playerPed, true)
    if found then
        for _, v in pairs(ammo.weapons) do
            if currentWeapon == v then
                weapon = v
                break
            end
        end
        if weapon ~= nil then
            local pedAmmo = GetAmmoInPedWeapon(playerPed, weapon)
            local newAmmo = pedAmmo + ammo.count
            ClearPedTasks(playerPed)
            local found, maxAmmo = GetMaxAmmo(playerPed, weapon)
            if newAmmo < maxAmmo then
                TaskReloadWeapon(playerPed)
                SetPedAmmo(playerPed, weapon, newAmmo)
                TriggerServerEvent('disc-ammo:removeAmmoItem', ammo)
                exports['mythic_notify']:SendAlert('inform', 'Repetirali ste oruzije')
            else
                exports['mythic_notify']:SendAlert('error', 'Maksimum municije')
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(300)
        local currentWeapon = GetSelectedPedWeapon(PlayerPedId()) 
        if currentWeapon then
        DisplayAmmoThisFrame(currentWeapon)
        else
            Wait(1000)
        end
    end
end)
