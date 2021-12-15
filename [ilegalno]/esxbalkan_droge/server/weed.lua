local playersProcessingCannabis = {}

RegisterServerEvent('esxbalkan_droge:pickedUpCannabis')
AddEventHandler('esxbalkan_droge:pickedUpCannabis', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('cannabis')

	if xItem.weight ~= -1 and (xItem.count + 1) > xItem.weight then
		xPlayer.showNotification(_U('weed_inventoryfull'))
	else
		xPlayer.addInventoryItem(xItem.name, 1)
	end
end)

RegisterServerEvent('esxbalkan_droge:processCannabis')
AddEventHandler('esxbalkan_droge:processCannabis', function()
	if not playersProcessingCannabis[source] then
		local _source = source

		playersProcessingCannabis[_source] = ESX.SetTimeout(Config.Delays.WeedProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCannabis = xPlayer.getInventoryItem('cannabis')

			if xCannabis.count > 3 then
				if xPlayer.canSwapItem('cannabis', 3, 'marijuana', 1) then
					xPlayer.removeInventoryItem('cannabis', 3)
					xPlayer.addInventoryItem('marijuana', 1)

					xPlayer.showNotification(_U('weed_processed'))
				else
					xPlayer.showNotification(_U('weed_processingfull'))
				end
			else
				xPlayer.showNotification(_U('weed_processingenough'))
			end

			playersProcessingCannabis[_source] = nil
		end)
	else
		print(('esxbalkan_droge: %s attempted to exploit weed processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingCannabis[playerID] then
		ESX.ClearTimeout(playersProcessingCannabis[playerID])
		playersProcessingCannabis[playerID] = nil
	end
end

RegisterServerEvent('esxbalkan_droge:cancelProcessing')
AddEventHandler('esxbalkan_droge:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('esx:playerDropped', function(playerID, reason)
	CancelProcessing(playerID)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	CancelProcessing(source)
end)
