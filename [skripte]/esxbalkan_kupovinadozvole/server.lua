ESX.RegisterServerCallback('esxbalkan_kupovina:Kupovinalicence', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Config.Cena then
		xPlayer.removeMoney(Config.Cena)

		TriggerEvent('esx_license:addLicense', source, 'weapon', function()
			cb(true)
		end)
	else
		TriggerClientEvent('esx:showNotification', source, ('Nemas dovoljno para'))
		cb(false)
	end
end)