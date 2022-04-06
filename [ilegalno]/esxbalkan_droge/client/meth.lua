local isPickingUp, isProcessing = false, false

CreateThread(function()
	while true do
		local wait = 1000
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if #(coords - Config.CircleZones.MethProcessing.coords) < 1 then
			wait = 2
			if not isProcessing then
				ESX.ShowHelpNotification(_U('meth_processprompt'))
			end

			if IsControlJustReleased(0, 38) and not isProcessing then
				ProcessMeth()	
			end
		end
		Wait(wait)
	end
end)


function ProcessMeth()
	isProcessing = true

	ESX.ShowNotification(_U('meth_processingstarted'))
	TriggerServerEvent('esxbalkan_droge:processMeth')
	local timeLeft = Config.Delays.MethProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if #(GetEntityCoords(playerPed) - Config.CircleZones.MethProcessing.coords) < 5 then
			ESX.ShowNotification(_U('meth_processingtoofar'))
			TriggerServerEvent('esxbalkan_droge:cancelProcessing')
			break
		end
	end

	isProcessing = false
end
