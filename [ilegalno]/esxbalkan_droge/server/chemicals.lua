local playersProcessingChemicalsToHydrochloricAcid = {}

RegisterServerEvent('esxbalkan_droge:pickedUpChemicals')
AddEventHandler('esxbalkan_droge:pickedUpChemicals', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('chemicals')

	if xItem.weight ~= -1 and (xItem.count + 1) > xItem.weight then
		xPlayer.showNotification(_U('Chemicals_inventoryfull'))
	else
		xPlayer.addInventoryItem(xItem.name, 1)
	end
end)

RegisterServerEvent('esxbalkan_droge:ChemicalsConvertionMenu')
AddEventHandler('esxbalkan_droge:ChemicalsConvertionMenu', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem(itemName)
	local xChemicals = xPlayer.getInventoryItem('chemicals')

	if xChemicals.count < amount then
		TriggerClientEvent('esx:showNotification', source, _U('Chemicals_notenough', xItem.label))
		return
	end
	
	Wait(5000)

	xPlayer.addInventoryItem(xItem.name, amount)

	xPlayer.removeInventoryItem('chemicals', amount)

	TriggerClientEvent('esx:showNotification', source, _U('Chemicals_made', xItem.label))
end)
