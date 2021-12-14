local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum
local isBusy, deadPlayers, deadPlayerBlips, isOnDuty = false, {}, {}, false
isInShopMenu = false

function OpenAmbulanceActionsMenu()
	local elements = {{label = _U('cloakroom'), value = 'cloakroom'}}

	if Config.EnablePlayerManagement and ESX.PlayerData.job.grade_name == 'boss' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ambulance_actions', {
		title    = _U('ambulance'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'cloakroom' then
			OpenCloakroomMenu()
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data, menu)
				menu.close()
			end, {wash = false})
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenMobileAmbulanceActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_ambulance_actions', {
		title    = _U('ambulance'),
		align    = 'top-left',
		elements = {
			{label = _U('ems_menu'), value = 'citizen_interaction'}
	}}, function(data, menu)
		if data.current.value == 'citizen_interaction' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('ems_menu_title'),
				align    = 'top-left',
				elements = {
					{label = _U('ems_menu_revive'), value = 'revive'},
					{label = _U('ems_menu_small'), value = 'small'},
					{label = _U('ems_menu_big'), value = 'big'},
					{label = _U('ems_menu_putincar'), value = 'put_in_vehicle'},
					{label = _U('ems_menu_search'), value = 'search'}
			}}, function(data, menu)
				if isBusy then return end

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if data.current.value == 'search' then
					TriggerServerEvent('esx_ambulancejob:svsearch')
				elseif closestPlayer == -1 or closestDistance > 1.0 then
					ESX.ShowNotification(_U('no_players'))
				else
					if data.current.value == 'revive' then
						revivePlayer(closestPlayer)
					elseif data.current.value == 'small' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_bandage'))
							end
						end, 'bandage')

					elseif data.current.value == 'big' then

						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_medikit'))
							end
						end, 'medikit')

					elseif data.current.value == 'put_in_vehicle' then
						TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(closestPlayer))
					end
				end
			end, function(data, menu)
				menu.close()
			end)
		end

	end, function(data, menu)
		menu.close()
	end)
end

function revivePlayer(closestPlayer)
	isBusy = true

	ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
		if quantity > 0 then
			local closestPlayerPed = GetPlayerPed(closestPlayer)

			if IsPedDeadOrDying(closestPlayerPed, 1) then
				local playerPed = PlayerPedId()
				local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
				ESX.ShowNotification(_U('revive_inprogress'))

				for i=1, 15 do
					Citizen.Wait(900)

					ESX.Streaming.RequestAnimDict(lib, function()
						TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
					end)
				end

				TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
				TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
			else
				ESX.ShowNotification(_U('player_not_unconscious'))
			end
		else
			ESX.ShowNotification(_U('not_enough_medikit'))
		end
		isBusy = false
	end, 'medikit')
end

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(500)
	end

	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)

		if heading then
			SetEntityHeading(playerPed, heading)
		end
	end)
end

-- Draw markers & Marker logic
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
			local playerCoords = GetEntityCoords(PlayerPedId())
			local letSleep, isInMarker, hasExited = true, false, false
			local currentHospital, currentPart, currentPartNum

			for hospitalNum,hospital in pairs(Config.Hospitals) do
				-- Ambulance Actions
				for k,v in ipairs(hospital.AmbulanceActions) do
					local distance = #(playerCoords - v)

					if distance < Config.DrawDistance then
						DrawMarker(Config.Marker.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < Config.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'AmbulanceActions', k
						end
					end
				end

				-- Pharmacies
				for k,v in ipairs(hospital.Pharmacies) do
					local distance = #(playerCoords - v)

					if distance < Config.DrawDistance then
						DrawMarker(Config.Marker.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < Config.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Pharmacy', k
						end
					end
				end

				-- Vehicle Spawners
			for k,v in ipairs(hospital.Vehicles) do
				local distance = GetDistanceBetweenCoords(playerCoords, v.Spawner, true)

				if distance < Config.DrawDistance then
					DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
					letSleep = false
				end

				if distance < v.Marker.x then
					isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Vehicles', k
				end
			end

			-- Helikopteri
			for k,v in ipairs(hospital.Helikopteri) do
				local distance = GetDistanceBetweenCoords(playerCoords, v.Spawner, true)

				if distance < Config.DrawDistance then
					DrawMarker(34, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 255, 60, Config.Marker.a, false, false, 2, true, nil, nil, false)
					letSleep = false
				end

				if distance < 1.0 then
					isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Helikopteri', k
				end
			end

			-- ParkirajAuto
			for k,v in ipairs(hospital.ParkirajAuto) do
				local distance = GetDistanceBetweenCoords(playerCoords, v, true)

				if distance < Config.DrawDistance then
					DrawMarker(36, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 0, 0, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil, nil, false)
					letSleep = false
				end

				if distance < 3.0 then
					isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'ParkirajAuto', k
				end
			end

			-- ParkirajHeli
			for k,v in ipairs(hospital.ParkirajHeli) do
				local distance = GetDistanceBetweenCoords(playerCoords, v, true)

				if distance < Config.DrawDistance then
					DrawMarker(36, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 0, 0, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil, nil, false)
					letSleep = false
				end

				if distance < 3.0 then
					isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'ParkirajHeli', k
				end
			end

				-- Fast Travels (Prompt)
				for k,v in ipairs(hospital.FastTravelsPrompt) do
					local distance = #(playerCoords - v.From)

					if distance < Config.DrawDistance then
						DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < v.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'FastTravelsPrompt', k
						end
					end
				end
			end

			-- Logic for exiting & entering markers
			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
					(LastHospital ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum = true, currentHospital, currentPart, currentPartNum

				TriggerEvent('esx_ambulancejob:hasEnteredMarker', currentHospital, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
			end

			if letSleep then
				Citizen.Wait(500)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Fast travels
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords, letSleep = GetEntityCoords(PlayerPedId()), true

		for hospitalNum,hospital in pairs(Config.Hospitals) do
			-- Fast Travels
			for k,v in ipairs(hospital.FastTravels) do
				local distance = #(playerCoords - v.From)

				if distance < Config.DrawDistance then
					DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
					letSleep = false

					if distance < v.Marker.x then
						FastTravel(v.To.coords, v.To.heading)
					end
				end
			end
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

AddEventHandler('esx_ambulancejob:hasEnteredMarker', function(hospital, part, partNum)
	if part == 'AmbulanceActions' then
		CurrentAction = part
		CurrentActionMsg = _U('actions_prompt')
		CurrentActionData = {}
	elseif part == 'Pharmacy' then
		CurrentAction = part
		CurrentActionMsg = _U('open_pharmacy')
		CurrentActionData = {}
	elseif part == 'Vehicles' then
		CurrentAction = part
		CurrentActionMsg = _U('garage_prompt')
		CurrentActionData = {hospital = hospital, partNum = partNum}
	elseif part == 'Helikopteri' then
		CurrentAction = part
		CurrentActionMsg = _U('helicopter_prompt')
		CurrentActionData = {hospital = hospital, partNum = partNum}
	elseif part == 'FastTravelsPrompt' then
		local travelItem = Config.Hospitals[hospital][part][partNum]

		CurrentAction = part
		CurrentActionMsg = travelItem.Prompt
		CurrentActionData = {to = travelItem.To.coords, heading = travelItem.To.heading}
	elseif part == 'ParkirajAuto' then
		local playerPed = PlayerPedId()
		local vehicle   = GetVehiclePedIsIn(playerPed, false)
	if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
		CurrentAction     = 'ParkirajAuto'
		CurrentActionMsg  = 'Pritisnite ~INPUT_CONTEXT~ da ~b~parkirate~s~ vozilo u garažu.'
		CurrentActionData = { vehicle = vehicle }
	end
	elseif part == 'ParkirajHeli' then
		local playerPed = PlayerPedId()
		local vehicle   = GetVehiclePedIsIn(playerPed, false)
	if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
		CurrentAction     = 'ParkirajHeli'
		CurrentActionMsg  = 'Pritisnite ~INPUT_CONTEXT~ da ~b~parkirate~s~ vozilo u garažu.'
		CurrentActionData = { vehicle = vehicle }
		end	
	end
end)

AddEventHandler('esx_ambulancejob:hasExitedMarker', function(hospital, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

function ObrisiVozilo()
	local playerPed = PlayerPedId()
    local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
	ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
	ESX.ShowNotification("Uspešno ste parkirali vozilo u garažu.")
end

function OpenVehicleSpawnerMenuHitna(hospital, partNum)
    ESX.UI.Menu.CloseAll()

    local playerPed = PlayerPedId()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'vozila_meni',
        {
        	css      = 'meni',
            title    = 'Izaberi Vozilo | 🚑',
			align    = 'top-right',
            elements = {
				-- {label = 'Bolničarski Džip | 🚑', value = 'amr_explorer'},--primjer dodavanja vozila
            	{label = 'Bolničarski Kombi | 🚑', value = 'ambulance'},
            }
        },
        function(data, menu)
            if data.current.value == 'ambulance' then
				ESX.Game.SpawnVehicle("ambulance", vector3(297.2, -1429.5, 29.8), 54.57, function(vehicle)
					TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
				end)
				Wait(200)
				local vehicle = GetVehiclePedIsIn(playerPed, false)
				SetVehicleDirtLevel(vehicle, 0.0)
                exports["LegacyFuel"]:SetFuel(vehicle, 100)

				
				ESX.UI.Menu.CloseAll()			
				
			-- elseif data.current.value == 'amr_explorer' then
			-- 	ESX.Game.SpawnVehicle("amr_explorer", vector3(297.2, -1429.5, 29.8), 54.57, function(vehicle)
			-- 		TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
			-- 	end)
			-- 	Wait(200)
			-- 	local vehicle = GetVehiclePedIsIn(playerPed, false) ---> primjer dodavanja vozila
			-- 	SetVehicleDirtLevel(vehicle, 0.0)
            --     exports["LegacyFuel"]:SetFuel(vehicle, 100)
			-- 	ESX.UI.Menu.CloseAll()			
            end

        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenHelicopterSpawnerMenuHitna(type, hospital, part, partNum)
    ESX.UI.Menu.CloseAll()

	local playerPed = PlayerPedId()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'helikopteri_meni',
        {
        	css      = 'hitna',
            title    = 'Izaberi Helikopter | 🚁',
            elements = {
            	{label = 'Helikopter | 🚁', value = 'polmav'},
            	{label = 'SeaSparrow | 🚁', value = 'seasparrow'},
            }
        },
        function(data, menu)
            if data.current.value == 'polmav' then
				ESX.Game.SpawnVehicle("polmav", vector3(299.77,-1454.33,46.9), 135.47, function(vehicle)
					TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
				end)
				Wait(200)
				local vehicle = GetVehiclePedIsIn(playerPed, false)
				SetVehicleDirtLevel(vehicle, 0.0)
                exports["LegacyFuel"]:SetFuel(vehicle, 100)
				ESX.UI.Menu.CloseAll()
		    elseif data.current.value == 'seasparrow' then
				ESX.Game.SpawnVehicle("seasparrow", vector3(299.77,-1454.33,46.9), 135.47, function(vehicle)
					TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
				end)
				Wait(200)
				local vehicle = GetVehiclePedIsIn(playerPed, false)
				SetVehicleDirtLevel(vehicle, 0.0)
                exports["LegacyFuel"]:SetFuel(vehicle, 100)
				ESX.UI.Menu.CloseAll()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

---------------KONTROLE

RegisterKeyMapping('+hitnae', 'HITNA E', 'keyboard', 'E')
-- Main thread
RegisterCommand('-hitnae', function()
    ---prazno mora biti
end, false)
RegisterCommand('+hitnae', function()
	if CurrentAction then
		ESX.ShowHelpNotification(CurrentActionMsg)

		if CurrentAction == 'AmbulanceActions' then
			OpenAmbulanceActionsMenu()
		elseif CurrentAction == 'Pharmacy' then
			OpenPharmacyMenu()
		elseif CurrentAction == 'Vehicles' then
			OpenVehicleSpawnerMenuHitna()
		elseif CurrentAction == 'Helikopteri' then
			OpenHelicopterSpawnerMenuHitna() 
		elseif CurrentAction == 'ParkirajAuto' then
			ObrisiVozilo() 
		elseif CurrentAction == 'ParkirajHeli' then
			ObrisiVozilo() 
		elseif CurrentAction == 'FastTravelsPrompt' then
			FastTravel(CurrentActionData.to, CurrentActionData.heading)
		end

		CurrentAction = nil
	end
end, false)

-----------------------F6 DUGME

RegisterKeyMapping('+emsf6', 'HITNA F6', 'keyboard', 'F6')
-- Main thread
RegisterCommand('-emsf6', function()
	---prazno mora biti
end, false)
RegisterCommand('+emsf6', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' and not isDead then
		OpenMobileAmbulanceActionsMenu()
	end
end, false)

RegisterNetEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local vehicle, distance = ESX.Game.GetClosestVehicle()

	if vehicle and distance < 5 then
		local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

		for i=maxSeats - 1, 0, -1 do
			if IsVehicleSeatFree(vehicle, i) then
				freeSeat = i
				break
			end
		end

		if freeSeat then
			TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
		end
	end
end)

function OpenCloakroomMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'top-left',
		elements = {
			{label = _U('ems_clothes_civil'), value = 'citizen_wear'},
			{label = _U('ems_clothes_ems'), value = 'ambulance_wear'},
	}}, function(data, menu)
		if data.current.value == 'citizen_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
				isOnDuty = false

				for playerId,v in pairs(deadPlayerBlips) do
					RemoveBlip(v)
					deadPlayerBlips[playerId] = nil
				end
			end)
		elseif data.current.value == 'ambulance_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end

				isOnDuty = true
				TriggerEvent('esx_ambulancejob:setDeadPlayers', deadPlayers)
			end)
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

function OpenPharmacyMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
		title    = _U('pharmacy_menu_title'),
		align    = 'top-left',
		elements = {
			{label = _U('pharmacy_take', _U('medikit')), item = 'medikit', type = 'slider', value = 1, min = 1, max = 100},
			{label = _U('pharmacy_take', _U('bandage')), item = 'bandage', type = 'slider', value = 1, min = 1, max = 100}
	}}, function(data, menu)
		TriggerServerEvent('esx_ambulancejob:giveItem', data.current.item, data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	if not quiet then
		ESX.ShowNotification(_U('healed'))
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	if isOnDuty and job ~= 'ambulance' then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		isOnDuty = false
	end
end)

RegisterNetEvent('esx_ambulancejob:setDeadPlayers')
AddEventHandler('esx_ambulancejob:setDeadPlayers', function(_deadPlayers)
	deadPlayers = _deadPlayers

	if isOnDuty then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		for playerId,status in pairs(deadPlayers) do
			if status == 'distress' then
				local player = GetPlayerFromServerId(playerId)
				local playerPed = GetPlayerPed(player)
				local blip = AddBlipForEntity(playerPed)

				SetBlipSprite(blip, 303)
				SetBlipColour(blip, 1)
				SetBlipFlashes(blip, true)
				SetBlipCategory(blip, 7)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(_U('blip_dead'))
				EndTextCommandSetBlipName(blip)

				deadPlayerBlips[playerId] = blip
			end
		end
	end
end)
