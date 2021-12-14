local playersProcessingPoppyResin = {}

RegisterServerEvent('esxbalkan_droge:pickedUpPoppy')
AddEventHandler('esxbalkan_droge:pickedUpPoppy', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.canCarryItem('poppyresin', 1) then
		xPlayer.addInventoryItem('poppyresin', 1)
	else
		xPlayer.showNotification(_U('poppy_inventoryfull'))
	end
end)

RegisterServerEvent('esxbalkan_droge:processPoppyResin')
AddEventHandler('esxbalkan_droge:processPoppyResin', function()
	if not playersProcessingPoppyResin[source] then
		local _source = source

		playersProcessingPoppyResin[_source] = ESX.SetTimeout(Config.Delays.HeroinProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xPoppyResin, xHeroin = xPlayer.getInventoryItem('poppyresin'), xPlayer.getInventoryItem('heroin')

			if xPoppyResin.count > 0 then
				if xPlayer.canSwapItem('poppyresin', 1, 'heroin', 1) then
					xPlayer.removeInventoryItem('poppyresin', 1)
					xPlayer.addInventoryItem('heroin', 1)

					xPlayer.showNotification(_U('heroin_processed'))
				else
					xPlayer.showNotification(_U('heroin_processingfull'))
				end
			else
				xPlayer.showNotification(_U('heroin_processingenough'))
			end

			playersProcessingPoppyResin[_source] = nil
		end)
	else
		print(('esxbalkan_droge: %s attempted to exploit heroin processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingPoppyResin[playerID] then
		ESX.ClearTimeout(playersProcessingPoppyResin[playerID])
		playersProcessingPoppyResin[playerID] = nil
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
