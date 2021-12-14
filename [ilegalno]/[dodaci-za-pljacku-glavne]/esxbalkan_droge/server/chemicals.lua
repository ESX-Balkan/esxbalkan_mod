local playersProcessingChemicalsToHydrochloricAcid = {}

RegisterServerEvent('esxbalkan_droge:pickedUpChemicals')
AddEventHandler('esxbalkan_droge:pickedUpChemicals', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.canCarryItem('chemicals', 1) then
		xPlayer.addInventoryItem('chemicals', 1)
	else
		xPlayer.showNotification(_U('Chemicals_inventoryfull'))
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
	
	Citizen.Wait(5000)

	xPlayer.addInventoryItem(xItem.name, amount)

	xPlayer.removeInventoryItem('chemicals', amount)

	TriggerClientEvent('esx:showNotification', source, _U('Chemicals_made', xItem.label))
end)