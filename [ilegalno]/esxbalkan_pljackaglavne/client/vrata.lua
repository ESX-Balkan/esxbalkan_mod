ESX = nil

CreateThread(function()
	while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(0) end
end)

local pozoviServer = TriggerServerEvent
local pozoviClient = TriggerEvent

local RNE = RegisterNetEvent
local AEH = AddEventHandler

RNE("esxGlavna:vault")
AEH("esxGlavna:vault", function()
	local obj = GetClosestObjectOfType(253.92, 224.56, 101.88, 2.0, GetHashKey("v_ilev_bk_vaultdoor"), false, false, false)
    local count = 0

    local metoda = 1

    if metoda == 1 then
        repeat
	        local rotation = GetEntityHeading(obj) - 0.05

            SetEntityHeading(obj, rotation)
            count = count + 1
            Wait(10)
        until count == 1100
    else
        repeat
	        local rotation = GetEntityHeading(obj) + 0.05

            SetEntityHeading(obj, rotation)
            count = count + 1
            Wait(10)
        until count == 1100
    end
    print(count)
    FreezeEntityPosition(obj, true)
end)

RNE("esxGlavna:vaultReset")
AEH("esxGlavna:vaultReset", function()
	local obj = GetClosestObjectOfType(253.92, 224.56, 101.88, 2.0, GetHashKey("v_ilev_bk_vaultdoor"), false, false, false)
    local brojka = 1100

    local metoda = 1

    if metoda == 1 then
        repeat
	        local rotation = GetEntityHeading(obj) + 0.05

            SetEntityHeading(obj, rotation)
            brojka = brojka - 1
            Wait(10)
        until brojka == 0
    else
        repeat
	        local rotation = GetEntityHeading(obj) + 0.05

            SetEntityHeading(obj, rotation)
            brojka = brojka - 1
            Wait(10)
        until brojka == 0
    end
    FreezeEntityPosition(obj, true)
end)
