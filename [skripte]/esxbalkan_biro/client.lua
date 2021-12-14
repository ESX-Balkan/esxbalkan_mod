ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OtvoriMeniPoslova()
	local elements = {
		{ label = Config.Rudar, value = Config.Rudnik},
		{ label = Config.Mesar, value = Config.Mesara},
		{ label = Config.Drvoseca, value = Config.Cepadrva},
		{ label = Config.Krojac, value = Config.Krojacnica},
		{ label = Config.NovinarskaRadnja, value = Config.Novinar},
		{ label = Config.Pecaros, value = Config.Riba},
		{ label = Config.Razvozac, value = Config.RazvozacNafte},
		{ label = Config.Nezaposlenlabel, value = Config.Nezaposlen},
	}

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'alati', {
		title    = 'BIRO ZA ZAPOSLJAVANJE',
		align    = 'top-left',
		elements = elements
	}, 
	function(data, menu)
		if data.current.value == Config.Nezaposlen then
			TriggerServerEvent('esxbalkan_biro:setajPosao', Config.Nezaposlen, 0)
		elseif data.current.value == Config.Rudnik then
			TriggerServerEvent('esxbalkan_biro:setajPosao', Config.Rudnik, 0)
		elseif data.current.value == Config.Mesara then
			TriggerServerEvent('esxbalkan_biro:setajPosao', Config.Mesara, 0)
		elseif data.current.value == Config.Cepadrva then
			TriggerServerEvent('esxbalkan_biro:setajPosao', Config.Cepadrva, 0)
		elseif data.current.value == Config.Krojacnica then
			TriggerServerEvent('esxbalkan_biro:setajPosao', Config.Krojacnica, 0)
        elseif data.current.value == Config.Novinar then
			TriggerServerEvent('esxbalkan_biro:setajPosao', Config.Novinar, 0)
		elseif data.current.value == Config.Riba then
			TriggerServerEvent('esxbalkan_biro:setajPosao', Config.Riba, 0)
		elseif data.current.value == Config.RazvozacNafte then
			TriggerServerEvent('esxbalkan_biro:setajPosao', Config.RazvozacNafte, 0)
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

Citizen.CreateThread(function()
	while true do
		
		Citizen.Wait(0)
		for i=1, #Config.Biro, 1 do
		local distance = #(GetEntityCoords(PlayerPedId()) - Config.Biro[i])
		local letSleep = true
		if distance < 10.0 then
			DrawMarker(6, Config.Biro[i], 0.0, 0.0, 0.0, 270.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 200, false, true, 2, true, false, false, false)
		    letSleep = false
		end
		
		if distance < 1 then
			if (IsControlJustReleased(1, 51)) then
				OtvoriMeniPoslova()
			end
		end
		if letSleep then
			Citizen.Wait(1000)
		end
	end
end
end)

Citizen.CreateThread(function()
	for i=1, #Config.Biro, 1 do
		local blip = AddBlipForCoord(Config.Biro[i])

		SetBlipSprite (blip, 475)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 37)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Gradska Kuca - LS")
		EndTextCommandSetBlipName(blip)
	end
end)
