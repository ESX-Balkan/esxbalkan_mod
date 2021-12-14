
CreateThread(function()
    SetMaxWantedLevel(0) --GASENJE WANTED LEVELA
    SetGarbageTrucks(false) --KONTROLIRANJE SMECARSKIH KAMIONA
    SetRandomBoats(false) --KONTROLIRANJE BRODOVA
    SetRandomTrains(false) --KONTROLIRANJE VOZOVA
    SetCreateRandomCops(false) --KONTROLIRANJE NPC POLICIJE
    SetCreateRandomCopsNotOnScenarios(false) --KONTROLIRANJE NPC POLICIJE NA SCENARIJIMA
    SetCreateRandomCopsOnScenarios(false) -- KONTROLIRANJE NPC POLICIJE NA SCENARIJIMA
    SetDispatchCopsForPlayer(PlayerId(), false) -- KONTROLIRANJE NPC POLICIJE
    SetPedPopulationBudget(0.001) -- KONTROLA GUSTINE NPC KOJI SETAJU
    SetBlipAlpha(GetNorthRadarBlip(), 0) ---Mice N sa MiniMape
end)

CreateThread(function()
    local id = PlayerId()
    while true do
        Citizen.Wait(3)
        DisablePlayerVehicleRewards(id) -- DISABLEOVANJE DOBJANJA ORUZIJA U VOZILIMA
        SetVehicleDensityMultiplierThisFrame(0.15) ---NPC KONTROLA
	    SetRandomVehicleDensityMultiplierThisFrame(0.15) ---NPC KONTROLA
	    SetParkedVehicleDensityMultiplierThisFrame(1.0) ---NPC KONTROLA
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0) ---NPC KONTROLA
        BlockWeaponWheelThisFrame()----INVENTORY
        DisableControlAction(0,37,true)----INVENTORY
        DisableControlAction(0,36,true)----Cucenje
		DisableControlAction( 0, 26, true ) --Cucenje
        -------------------------OVO DISABLUJE CASH I ONE STVARI PO EKRANU
		HideHudComponentThisFrame(1)  -- Wanted Stars
		HideHudComponentThisFrame(2)  -- Weapon Icon
		HideHudComponentThisFrame(3)  -- Cash
		HideHudComponentThisFrame(4)  -- MP Cash
		HideHudComponentThisFrame(6)  -- Vehicle Name
		HideHudComponentThisFrame(7)  -- Area Name
		HideHudComponentThisFrame(8)  -- Vehicle Class
		HideHudComponentThisFrame(9)  -- Street Name
		HideHudComponentThisFrame(13) -- Cash Change
		HideHudComponentThisFrame(17) -- Save Game
		HideHudComponentThisFrame(20) -- Weapon Stats
    end
end)








