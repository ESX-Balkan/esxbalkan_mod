local spawnedPoppys = 0
local PoppyPlants = {}
local isPickingUp, isProcessing = false, false


CreateThread(function()
	while true do
		Wait(700)
		local coords = GetEntityCoords(PlayerPedId())

		if #(coords - Config.CircleZones.HeroinField.coords) < 50 then
			SpawnPoppyPlants()
		end
	end
end)

CreateThread(function()
	while true do
		local wait = 1000
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if #(coords - Config.CircleZones.HeroinProcessing.coords) < 1 then
			wait = 2
			if not isProcessing then
				ESX.ShowHelpNotification(_U('heroin_processprompt'))
			end

			if IsControlJustReleased(0, 38) and not isProcessing then
				ProcessHeroin()	
			end
		end
		Wait(wait)
	end
end)

function ProcessHeroin()
	isProcessing = true

	ESX.ShowNotification(_U('heroin_processingstarted'))
	TriggerServerEvent('esxbalkan_droge:processPoppyResin')
	local timeLeft = Config.Delays.HeroinProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Wait(1000)
		timeLeft = timeLeft - 1

		if #(GetEntityCoords(playerPed) - Config.CircleZones.HeroinProcessing.coords) < 5 then
			ESX.ShowNotification(_U('heroin_processingtoofar'))
			TriggerServerEvent('esxbalkan_droge:cancelProcessing')
			break
		end
	end

	isProcessing = false
end

CreateThread(function()
	while true do
		Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #PoppyPlants, 1 do
			if #(coords - GetEntityCoords(PoppyPlants[i])) < 1 then
				nearbyObject, nearbyID = PoppyPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('heroin_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('esxbalkan_droge:canPickUp', function(canPickUp)

					if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)

						Wait(2000)
						ClearPedTasks(playerPed)
						Wait(1500)
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(PoppyPlants, nearbyID)
						spawnedPoppys = spawnedPoppys - 1
		
						TriggerServerEvent('esxbalkan_droge:pickedUpPoppy')
					else
						ESX.ShowNotification(_U('poppy_inventoryfull'))
					end

					isPickingUp = false

				end, 'poppyresin')
			end

		else
			Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(PoppyPlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnPoppyPlants()
	while spawnedPoppys < 15 do
		Wait(0)
		local heroinCoords = GenerateHeroinCoords()

		ESX.Game.SpawnLocalObject('prop_cs_plant_01', heroinCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(PoppyPlants, obj)
			spawnedPoppys = spawnedPoppys + 1
		end)
	end
end

function ValidateHeroinCoord(plantCoord)
	if spawnedPoppys > 0 then
		local validate = true

		for k, v in pairs(PoppyPlants) do
			if #(plantCoord - GetEntityCoords(v)) < 5 then
				validate = false
			end
		end

		if #(plantCoord - Config.CircleZones.HeroinField.coords) < 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateHeroinCoords()
	while true do
		Wait(1)

		local heroinCoordX, heroinCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-20, 20)

		Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 20)

		heroinCoordX = Config.CircleZones.HeroinField.coords.x + modX
		heroinCoordY = Config.CircleZones.HeroinField.coords.y + modY

		local coordZ = GetCoordZHeroin(heroinCoordX, heroinCoordY)
		local coord = vector3(heroinCoordX, heroinCoordY, coordZ)

		if ValidateHeroinCoord(coord) then
			return coord
		end
	end
end

function GetCoordZHeroin(x, y)
	local groundCheckHeights = { 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 12.64
end

CreateThread(function()
    while true do
        Wait(0)
        if isPickingUp then
            DisableAllControlActions(0)
	else
	    Wait(500)
        end
    end
end)
