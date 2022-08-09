local ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(100)
    end

    while ESX.GetPlayerData().job == nil do
        Wait(100)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

local vehiclesCars = {0,1,2,3,4,5,6,7,8,9,10,11,12,17,18,19,20};


-- -- Vehicle Info
local vehicleCruiser
local seatbeltEjectSpeed = 9999.0
local seatbeltEjectAccel = 9999.0
local seatbeltIsOn = false
local currSpeed = 0.0
local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}

CreateThread(function()
    while true do
        Wait(450)

        local player = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(player, false)
        local position = GetEntityCoords(player)
        local vehicleIsOn = GetIsVehicleEngineRunning(vehicle)
        local vehicleInfo

        if IsPedInAnyVehicle(player, false) and vehicleIsOn then
            local vehicleClass = GetVehicleClass(vehicle)

            -- Vehicle Speed
            local vehicleSpeedSource = GetEntitySpeed(vehicle)
            local vehicleSpeed
            vehicleSpeed = math.ceil(vehicleSpeedSource * 3.6)

            -- Vehicle Gradient Speed
            local vehicleNailSpeed

            if vehicleSpeed > Config.vehicle.maxSpeed then
                vehicleNailSpeed = math.ceil(  280 - math.ceil( math.ceil(Config.vehicle.maxSpeed * 205) / Config.vehicle.maxSpeed) )
            else
                vehicleNailSpeed = math.ceil(  280 - math.ceil( math.ceil(vehicleSpeed * 205) / Config.vehicle.maxSpeed) )
            end

            -- Vehicle Fuel and Gear
            local vehicleFuel
            vehicleFuel = GetVehicleFuelLevel(vehicle)

            local vehicleGear = GetVehicleCurrentGear(vehicle)

            if (vehicleSpeed == 0 and vehicleGear == 0) or (vehicleSpeed == 0 and vehicleGear == 1) then
                vehicleGear = 'N'
            elseif vehicleSpeed > 0 and vehicleGear == 0 then
                vehicleGear = 'R'
            end

            -- Vehicle Lights
            local vehicleVal,vehicleLights,vehicleHighlights  = GetVehicleLightsState(vehicle)
            local vehicleIsLightsOn
            if vehicleLights == 1 and vehicleHighlights == 0 then
                vehicleIsLightsOn = 'normal'
            elseif (vehicleLights == 1 and vehicleHighlights == 1) or (vehicleLights == 0 and vehicleHighlights == 1) then
                vehicleIsLightsOn = 'high'
            else
                vehicleIsLightsOn = 'off'
            end

            -- Vehicle Siren
            local vehicleSiren

            if IsVehicleSirenOn(vehicle) then
                vehicleSiren = true
            else
                vehicleSiren = false
            end

            -- Vehicle Seatbelt
            if has_value(vehiclesCars, vehicleClass) == true and vehicleClass ~= 8 then

                local prevSpeed = currSpeed
                currSpeed = vehicleSpeedSource

                SetPedConfigFlag(PlayerPedId(), 32, true)

                if not seatbeltIsOn then
                    local vehIsMovingFwd = GetEntitySpeedVector(vehicle, true).y > 1.0
                    local vehAcc = (prevSpeed - currSpeed) / GetFrameTime()
                    if (vehIsMovingFwd and (prevSpeed > (seatbeltEjectSpeed/2.237)) and (vehAcc > (seatbeltEjectAccel*9.81))) then

                        SetEntityCoords(player, position.x, position.y, position.z - 0.47, true, true, true)
                        SetEntityVelocity(player, prevVelocity.x, prevVelocity.y, prevVelocity.z)
                        SetPedToRagdoll(player, 1000, 1000, 0, 0, 0, 0)
                    else
                        -- Update previous velocity for ejecting player
                        prevVelocity = GetEntityVelocity(vehicle)
                    end

                else
                    DisableControlAction(0, 75)
                end
            end
                vehicleInfo = {
                    action = 'updateVehicle',
                    status = true,
                    speed = vehicleSpeed,
                    nail = vehicleNailSpeed,
                    gear = vehicleGear,
                    fuel = vehicleFuel,
                    lights = vehicleIsLightsOn,
                    cruiser = vehicleCruiser,
                    type = vehicleClass,
                    siren = vehicleSiren,
                    seatbelt = {},
    
                    config = {
                        speedUnit = Config.vehicle.speedUnit,
                        maxSpeed = Config.vehicle.maxSpeed
                    }
                }
    
                vehicleInfo['seatbelt']['status'] = seatbeltIsOn
    
            else
                Wait(1000)  -- Performance
    
                vehicleCruiser = false
                vehicleNailSpeed = 0
    
                seatbeltIsOn = false
    
                vehicleInfo = {
                    action = 'updateVehicle',
                    status = false,
                    nail = vehicleNailSpeed,
                    seatbelt = { status = seatbeltIsOn },
                    cruiser = vehicleCruiser,
                    type = 0,
                }
            end
            SendNUIMessage(vehicleInfo)
        end
    end)


    CreateThread(function()
        while true do
            Wait(1500) -- 1000 default
    
            local playerStatus
            local showPlayerStatus = 0
            local ped = PlayerPedId()
    
            playerStatus = { action = 'setStatus', status = {} }
    
            showPlayerStatus = (showPlayerStatus+1)
    
            playerStatus['isdead'] = false
    
            playerStatus['status'][showPlayerStatus] = {
                name = 'health',
                value = GetEntityHealth(ped) - 100
            }
    
            if IsEntityDead(ped) then
                playerStatus.isdead = true
            end
    
    
            showPlayerStatus = (showPlayerStatus+1)
    
            playerStatus['status'][showPlayerStatus] = {
                name = 'armor',
                value = GetPedArmour(ped),
            }
    
            showPlayerStatus = (showPlayerStatus+1)
    
            playerStatus['status'][showPlayerStatus] = {
                name = 'stamina',
                value = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
            }
    
    
            showPlayerStatus = (showPlayerStatus+1)
    
            TriggerEvent('esx_status:getStatus', 'hunger', function(status)
                playerStatus['status'][showPlayerStatus] = {
                    name = 'hunger',
                    value = math.floor(100-status.getPercent())
                }
            end)
    
            showPlayerStatus = (showPlayerStatus+1)
    
            TriggerEvent('esx_status:getStatus', 'thirst', function(status)
                playerStatus['status'][showPlayerStatus] = {
                    name = 'thirst',
                    value = math.floor(100-status.getPercent())
                }
            end)
    
            if showPlayerStatus > 0 then
                SendNUIMessage(playerStatus)
            end
        end
    end)

-- Overall Info
AddEventHandler('trew_hud_ui:getServerInfo', function(info)

        local playerStatus
        local showPlayerStatus = 0
        playerStatus = { action = 'setStatus', status = {} }

        showPlayerStatus = (showPlayerStatus+1)

        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            playerStatus['status'][showPlayerStatus] = {
                name = 'hunger',
                value = math.floor(100-status.getPercent())
            }
        end)

        showPlayerStatus = (showPlayerStatus+1)

        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            playerStatus['status'][showPlayerStatus] = {
                name = 'thirst',
                value = math.floor(100-status.getPercent())
            }
        end)

        if showPlayerStatus > 0 then
            SendNUIMessage(playerStatus)
        end
end)



RegisterKeyMapping('+tempomat', 'Tempomat', 'keyboard', 'Y')
    -- Main thread
RegisterCommand('-tempomat', function()
    ---prazno mora biti
end, false)
RegisterCommand('+tempomat', function()
    
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player, false)
    local vehicleClass = GetVehicleClass(vehicle)

    if GetPedInVehicleSeat(vehicle, -1) == player and (has_value(vehiclesCars, vehicleClass) == true) then

        local vehicleSpeedSource = GetEntitySpeed(vehicle)

        if vehicleCruiser == 'on' then
            vehicleCruiser = 'off'
            SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel"))

        else
            vehicleCruiser = 'on'
            SetEntityMaxSpeed(vehicle, vehicleSpeedSource)
        end
    end
end, false)


RegisterKeyMapping('+pojas', 'Pojas', 'keyboard', 'B')
-- Main thread
RegisterCommand('-pojas', function()
    ---prazno mora biti
end, false)
RegisterCommand('+pojas', function()
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player, false)
    local vehicleClass = GetVehicleClass(vehicle)
    
    if IsPedInAnyVehicle(player, false) and GetIsVehicleEngineRunning(vehicle) then
        if (has_value(vehiclesCars, vehicleClass) == true and vehicleClass ~= 8) then
            seatbeltIsOn = not seatbeltIsOn
        end
    end
end, false)

-----------FIX POJAS---------------
CreateThread(function()
    while true do
        if seatbeltIsOn then
			DisableControlAction(0, 75)
			if IsDisabledControlJustPressed(0, 75) then
				ESX.ShowNotification("Prvo odvezi pojas da izadjes...", true, false, 90)
			end
        else
            Wait(1500)
        end
        Wait(9)
    end
end)




AddEventHandler('playerSpawned', function()
    
    NetworkSetTalkerProximity(5.0)
    HideHudComponentThisFrame(7) -- Area
    HideHudComponentThisFrame(9) -- Street
    HideHudComponentThisFrame(6) -- Vehicle
    HideHudComponentThisFrame(3) -- SP Cash
    HideHudComponentThisFrame(4) -- MP Cash
    HideHudComponentThisFrame(13) -- Cash changes!
end)


function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

RegisterNetEvent('energy_hud:ulazakIgraca')
AddEventHandler('energy_hud:ulazakIgraca', function()
    SendNUIMessage({ action = 'ui', config = Config.ui })
    SendNUIMessage({ action = 'setFont', url = Config.font.url, name = Config.font.name })
end)


local sakrijui = false
RegisterCommand('ui', function()
    if not sakrijui then
        -- SendNUIMessage({ action = 'element', task = 'disable', value = 'job' })
        -- SendNUIMessage({ action = 'element', task = 'disable', value = 'bank' })
        -- SendNUIMessage({ action = 'element', task = 'disable', value = 'blackMoney' })
        -- SendNUIMessage({ action = 'element', task = 'disable', value = 'wallet' })
        SendNUIMessage({ action = 'element', task = 'disable', value = 'health' })
        SendNUIMessage({ action = 'element', task = 'disable', value = 'armor' })
        SendNUIMessage({ action = 'element', task = 'disable', value = 'stamina' })
        SendNUIMessage({ action = 'element', task = 'disable', value = 'hunger' })
        SendNUIMessage({ action = 'element', task = 'disable', value = 'thirst' })
        -- SendNUIMessage({ action = 'element', task = 'disable', value = 'voice' })
        TriggerEvent('chat:toggleChat')
        for i=1, #ESX.PlayerData.inventory, 1 do
        if ESX.PlayerData.inventory[i].name == 'gps' then
          if ESX.PlayerData.inventory[i].count > 0 then
            DisplayRadar(false)
          end
         end
        end
    else
        -- SendNUIMessage({ action = 'element', task = 'enable', value = 'job' })
        -- SendNUIMessage({ action = 'element', task = 'enable', value = 'bank' })
        -- SendNUIMessage({ action = 'element', task = 'enable', value = 'blackMoney' })
        -- SendNUIMessage({ action = 'element', task = 'enable', value = 'wallet' })
        SendNUIMessage({ action = 'element', task = 'enable', value = 'health' })
        SendNUIMessage({ action = 'element', task = 'enable', value = 'armor' })
        SendNUIMessage({ action = 'element', task = 'enable', value = 'stamina' })
        SendNUIMessage({ action = 'element', task = 'enable', value = 'hunger' })
        SendNUIMessage({ action = 'element', task = 'enable', value = 'thirst' })
        -- SendNUIMessage({ action = 'element', task = 'enable', value = 'voice' })

        TriggerEvent('chat:toggleChat')
        for i=1, #ESX.PlayerData.inventory, 1 do
        if ESX.PlayerData.inventory[i].name == 'gps' then
          if ESX.PlayerData.inventory[i].count > 0 then
            DisplayRadar(true)
          end
         end
        end
    end
    sakrijui = not sakrijui
end)

exports('createStatus', function(args)
    local statusCreation = { action = 'createStatus', status = args['status'], color = args['color'], icon = args['icon'] }
    SendNUIMessage(statusCreation)
end)

exports('setStatus', function(args)
    local playerStatus = { action = 'setStatus', status = {
        { name = args['name'], value = args['value'] }
    }}
    SendNUIMessage(playerStatus)
end)



-- local imageWidth = 80 -- leave this variable, related to pixel size of the directions
-- local containerWidth = 80 -- width of the image container

-- -- local width =  (imageWidth / containerWidth) * 100; -- used to convert image width if changed
-- local width =  0;
-- local south = (-imageWidth) + width
-- local west = (-imageWidth * 2) + width
-- local north = (-imageWidth * 3) + width
-- local east = (-imageWidth * 4) + width
-- local south2 = (-imageWidth * 5) + width

-- function calcHeading(direction)
--     if (direction < 90) then
--         return lerp(north, east, direction / 90)
--     elseif (direction < 180) then
--         return lerp(east, south2, rangePercent(90, 180, direction))
--     elseif (direction < 270) then
--         return lerp(south, west, rangePercent(180, 270, direction))
--     elseif (direction <= 360) then
--         return lerp(west, north, rangePercent(270, 360, direction))
--     end
-- end

-- function rangePercent(min, max, amt)
--     return (((amt - min) * 100) / (max - min)) / 100
-- end

-- function lerp(min, max, amt)
--     return (1 - amt) * min + amt * max
-- end

-- posX = 0.01
-- posY = 0.0-- 0.0152

-- width = 0.183
-- height = 0.32--0.354

-- CreateThread(function()
-- 	RequestStreamedTextureDict("circlemap", false)
-- 	while not HasStreamedTextureDictLoaded("circlemap") do
-- 		Wait(500)
-- 	end

-- 	AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")

-- 	SetMinimapClipType(1) -- native added by cfx.re, it restores beta gta5 minimap (round)
-- 	SetMinimapComponentPosition('minimap', 'L', 'B', posX, posY, width, height)
-- 	SetMinimapComponentPosition('minimap_mask', 'L', 'B', 0.14, 0.14, 0.1, 0.1)
-- 	SetMinimapComponentPosition('minimap_blur', 'L', 'B', 0.012, 0.022, 0.256, 0.337)

--     local minimap = RequestScaleformMovie("minimap")
--     SetRadarBigmapEnabled(true, false)
--     Wait(0)
--     SetRadarBigmapEnabled(false, false)

--     while true do
--         Wait(500)
--         BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
--         ScaleformMovieMethodAddParamInt(3)
--         EndScaleformMovieMethod()
--         if IsBigmapActive() or IsBigmapFull() then
--             SetBigmapActive(false, false)
--         end
--     end
-- end)



