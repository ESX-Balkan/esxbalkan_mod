local isPickingUp, isProcessing = false, false

CreateThread(function()
	while true do
		local wait = 1000
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if #(coords - Config.CircleZones.lsdProcessing.coords) < 1 then
			wait = 2
			if not isProcessing then
				ESX.ShowHelpNotification(_U('lsd_processprompt'))
			end

			if IsControlJustReleased(0, 38) and not isProcessing then
				Processlsd()	
			end
		end
		Wait(wait)
	end
end)

function Processlsd()
	isProcessing = true

	ESX.ShowNotification(_U('lsd_processingstarted'))
	TriggerServerEvent('esxbalkan_droge:processLSD')
	local timeLeft = Config.Delays.lsdProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if #(coords - Config.CircleZones.lsdProcessing.coords) > 5 then
			ESX.ShowNotification(_U('lsd_processingtoofar'))
			TriggerServerEvent('esxbalkan_droge:cancelProcessing')
			break
		end
	end

	isProcessing = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if #(coords - Config.CircleZones.thionylchlorideProcessing.coords) < 5 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('thionylchloride_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then

				Processthionylchloride()

			end
		else
			Citizen.Wait(500)
		end
	end
end)

function Processthionylchloride()
	isProcessing = true

	ESX.ShowNotification(_U('thionylchloride_processingstarted'))
	TriggerServerEvent('esxbalkan_droge:processThionylChloride')
	local timeLeft = Config.Delays.thionylchlorideProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if #(coords - Config.CircleZones.thionylchlorideProcessing.coords) > 5 then
			ESX.ShowNotification(_U('thionylchloride_processingtoofar'))
			TriggerServerEvent('esxbalkan_droge:cancelProcessing')
			break
		end
	end

	isProcessing = false
end
