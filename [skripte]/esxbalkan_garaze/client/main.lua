local ESX = nil
cachedData = {}

CreateThread(function()
	while not ESX do TriggerEvent("esx:getSharedObject", function(library) ESX = library end) Wait(100) end
	if Config.VehicleMenu then -- ako je ukljeceno onda aktiviraj
        RegisterKeyMapping('+menigaraze', 'Policijski meni', 'keyboard', Config.VehicleMenuButton)
        RegisterCommand('+menigaraze', function()
	    if not IsEntityDead(PlayerPedId()) then
            OpenVehicleMenu()
	    end
    end, false)
    RegisterCommand('-menigaraze', function()
	    ---mora biti prazno :)
    end, false)
	end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerData)
	ESX.PlayerData = playerData
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(newJob)
	ESX.PlayerData["job"] = newJob
end)

CreateThread(function()
	local CanDraw = function(action)
		if action == "vehicle" then
			if IsPedInAnyVehicle(PlayerPedId()) then
				local vehicle = GetVehiclePedIsIn(PlayerPedId())

				if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
					return true
				else
					return false
				end
			else
				return false
			end
		end

		return true
	end

	local GetDisplayText = function(action, garage)
		if not Config.Labels[action] then Config.Labels[action] = action end
		return string.format(Config.Labels[action], action == "vehicle" and GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId())))) or garage)
	end

	for garage, garageData in pairs(Config.Garages) do
		local garageBlip = AddBlipForCoord(garageData["positions"]["menu"]["position"])
		SetBlipSprite(garageBlip, 357)
		SetBlipDisplay(garageBlip, 4)
		SetBlipScale (garageBlip, 0.8)
		SetBlipColour(garageBlip, 67)
		SetBlipAsShortRange(garageBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Garage " .. garage)
		EndTextCommandSetBlipName(garageBlip)
	end

	while true do
		local sleepThread = 1500

		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		for garage, garageData in pairs(Config.Garages) do
			for action, actionData in pairs(garageData["positions"]) do
				local dstCheck = #(pedCoords - actionData["position"])

				if dstCheck <= 10.0 then
					sleepThread = 6

					local draw = CanDraw(action)

					if draw then
						local markerSize = action == "vehicle" and 5.0 or 1.5

						if dstCheck <= markerSize - 0.1 then
							local usable, displayText = not DoesCamExist(cachedData["cam"]), GetDisplayText(action, garage)

							ESX.ShowHelpNotification(usable and displayText or "Odabir vozila")

							if usable then
								if IsControlJustPressed(0, 38) then
									cachedData["currentGarage"] = garage

									HandleAction(action)
								end
							end
						end

						DrawScriptMarker({
							["type"] = 6,
							["pos"] = actionData["position"] - vector3(0.0, 0.0, 0.985),
							["sizeX"] = markerSize,
							["sizeY"] = markerSize,
							["sizeZ"] = markerSize,
							["r"] = 0,
							["g"] = 150,
							["b"] = 150
						})
					end
				end
			end
		end

		Wait(sleepThread)
	end
end)
