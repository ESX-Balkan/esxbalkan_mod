local playersProcessingCocaLeaf = {}

RegisterServerEvent('esxbalkan_droge:pickedUpCocaLeaf')
AddEventHandler('esxbalkan_droge:pickedUpCocaLeaf', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.canCarryItem('coca_leaf', 1) then
		xPlayer.addInventoryItem('coca_leaf', 1)
	else
		xPlayer.showNotification(_U('coca_leaf_inventoryfull'))
	end
end)

RegisterServerEvent('esxbalkan_droge:processCocaLeaf')
AddEventHandler('esxbalkan_droge:processCocaLeaf', function()
	if not playersProcessingCocaLeaf[source] then
		local _source = source

		playersProcessingCocaLeaf[_source] = ESX.SetTimeout(Config.Delays.CokeProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCocaLeaf, xCoke = xPlayer.getInventoryItem('coca_leaf'), xPlayer.getInventoryItem('coke')

			if xCocaLeaf.count > 3 then
				if xPlayer.canSwapItem('coca_leaf', 3, 'coke', 1) then
					xPlayer.removeInventoryItem('coca_leaf', 3)
					xPlayer.addInventoryItem('coke', 1)

					xPlayer.showNotification(_U('coke_processed'))
				else
					xPlayer.showNotification(_U('coke_processingfull'))
				end
			else
				xPlayer.showNotification(_U('coke_processingenough'))
			end

			playersProcessingCocaLeaf[_source] = nil
		end)
	else
		print(('esxbalkan_droge: %s attempted to exploit coke processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingCocaLeaf[playerID] then
		ESX.ClearTimeout(playersProcessingCocaLeaf[playerID])
		playersProcessingCocaLeaf[playerID] = nil
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
