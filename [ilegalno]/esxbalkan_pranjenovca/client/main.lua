key_to_teleport = 38

positions = {
    {{-599.6, -1605.71 ,29.77, 0}, {1138.1, -3198.57, -40.67, 358.97},{36,237,157}, "Ulaz/Izlaz"}, -- Ulaz u sobu za pranje para
}

ESX								= nil
local hasAlreadyEnteredMarker	= nil
local CurrentAction				= nil
local CurrentActionMsg			= ''
local CurrentActionData			= {}
local player = GetPlayerPed(-1)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenWashedMenu(zone)
	local elements = {{label = 'Operi Novac | 💰', value = 'wash_money'}}
		
		ESX.UI.Menu.CloseAll()
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wash', {
			title		= 'Pranje Novca | 💰',
			align		= 'top-left',
			elements	= elements
		}, function(data, menu)
			if data.current.value == 'wash_money' then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'wash_money_amount_', {
					title = 'Količina za pranje'
				}, function(data, menu)
				
					local amount = tonumber(data.value)
					
					if amount == nil then
					    TriggerEvent("pNotify:SendNotification", {text = "Nevažeća količina!", type = "success", queue = "success", timeout = 2000, layout = "center"})
					else
						menu.close()
						TriggerServerEvent('esxbalkan_pranjenovca:pranjePara', amount)
					end
				end, function(data, menu)
					menu.close()
				end)
			end
			end, function(data, menu)
			menu.close()
			
			CurrentAction	 = 'wash_menu'
			CurrentActionMsg = 'Pritsinite ~INPUT_CONTEXT~ da ~b~operete novac~s~.'
			CurrentActionData = {zone = zone}
	end)
end

AddEventHandler('esxbalkan_pranjenovca:hasEnteredMarker', function(zone)
	CurrentAction     = 'wash_menu'
	CurrentActionMsg  = 'Pritsinite ~INPUT_CONTEXT~ da ~b~operete novac~s~.'
	CurrentActionData = {zone = zone}
end)

AddEventHandler('esxbalkan_pranjenovca:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()		
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local letSleep = true
		local coords = GetEntityCoords(PlayerPedId())
		local isInMarker	= false
		local currentZone = nil
		
		for k,v in pairs(PranjeKonfig.Zones) do
			for i = 1, #v.Pos, 1 do

				if(PranjeKonfig.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < PranjeKonfig.DrawDistance) then
					DrawMarker(PranjeKonfig.Type, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, PranjeKonfig.Size.x, PranjeKonfig.Size.y, PranjeKonfig.Size.z, PranjeKonfig.Color.r, PranjeKonfig.Color.g, PranjeKonfig.Color.b, 100, false, true, 2, false, false, false, false)
				    letSleep = false
				end

				if(GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < PranjeKonfig.Size.x) then
					isInMarker = true
					currentZone = k
				end

			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('esxbalkan_pranjenovca:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esxbalkan_pranjenovca:hasExitedMarker', LastZone)
		end

		if letSleep then
			Citizen.Wait(1000)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)
			
			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'wash_menu' then
					OpenWashedMenu(CurrentActionData.zone)
				end
				CurrentAction = nil
			end
		else
			Citizen.Wait(1000)
		end
	end
end)
