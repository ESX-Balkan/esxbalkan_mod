
local hasAlreadyEnteredMarker, hasPaid, currentActionData = false, false, {}
local lastZone, currentAction, currentActionMsg

function OpenShopMenu()
	hasPaid = false

	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
		menu.close()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title = _U('valid_this_purchase'),
			align = 'top-left',
			elements = {
				{label = _U('no'), value = 'no'},
				{label = _U('yes'), value = 'yes'}
		}}, function(data, menu)
			menu.close()

			if data.current.value == 'yes' then
				ESX.TriggerServerCallback('esx_clotheshop:buyClothes', function(bought)
					if bought then
						TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerServerEvent('esx_skin:save', skin)
						end)

						hasPaid = true

					else
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
						end)

						ESX.ShowNotification(_U('not_enough_money'))
					end
				end)
			elseif data.current.value == 'no' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			currentAction     = 'shop_menu'
			currentActionMsg  = _U('shop_menu')
			currentActionData = {}
		end, function(data, menu)
			menu.close()

			currentAction     = 'shop_menu'
			currentActionMsg  = _U('shop_menu')
			currentActionData = {}
		end)

	end, function(data, menu)
		menu.close()

		currentAction     = 'shop_menu'
		currentActionMsg  = _U('shop_menu')
		currentActionData = {}
	end, {
		'tshirt_1', 'tshirt_2',
		'torso_1', 'torso_2',
		'decals_1', 'decals_2',
		'arms',
		'pants_1', 'pants_2',
		'shoes_1', 'shoes_2',
        'bags_1', 'bags_2',
		'chain_1', 'chain_2',
		'helmet_1', 'helmet_2',
		'glasses_1', 'glasses_2'
	})
end

AddEventHandler('esx_clotheshop:hasEnteredMarker', function(zone)
	currentAction     = 'shop_menu'
	currentActionMsg  = _U('shop_menu')
	currentActionData = {}
end)

AddEventHandler('esx_clotheshop:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	currentAction = nil

	if not hasPaid then
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end)
	end
end)

-- Create Blips
Citizen.CreateThread(function()
	for k,v in ipairs(Config.Shops) do
		local blip = AddBlipForCoord(v)

		SetBlipSprite (blip, 73)
		SetBlipColour (blip, 47)
		SetBlipScale  (blip, 0.8)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('clothes'))
		EndTextCommandSetBlipName(blip)
	end
end)

-- Enter / Exit marker events & draw markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local playerCoords, isInMarker, currentZone, letSleep = GetEntityCoords(PlayerPedId()), false, nil, true

		for k,v in pairs(Config.Shops) do
			local distance = #(playerCoords - v)

			if distance < Config.DrawDistance then
				letSleep = false
				DrawMarker(Config.MarkerType, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)

				if distance < Config.MarkerSize.x then
					isInMarker, currentZone = true, k
				end
			end
		end

		if (isInMarker and not hasAlreadyEnteredMarker) or (isInMarker and lastZone ~= currentZone) then
			hasAlreadyEnteredMarker, lastZone = true, currentZone
			TriggerEvent('esx_clotheshop:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_clotheshop:hasExitedMarker', lastZone)
		end

		if letSleep then
			Citizen.Wait(1000)
		end
	end
end)

-- Key controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		if currentAction then
			ESX.ShowHelpNotification(currentActionMsg)

			if IsControlJustReleased(0, 38) then
				if currentAction == 'shop_menu' then
					OpenShopMenu()
				end

				currentAction = nil
			end
		else
			Citizen.Wait(800)
		end
	end
end)


