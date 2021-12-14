local InSpectatorMode = false
local TargetSpectate
local LastPosition
local polarAngleDeg = 0
local azimuthAngleDeg = 90
local radius = -3.5
local cam
local PlayerDate = {}
local ShowInfos = false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function polar3DToWorld3D(entityPosition, radius, polarAngleDeg, azimuthAngleDeg)
	-- convert degrees to radians
	local polarAngleRad   = polarAngleDeg   * math.pi / 180.0
	local azimuthAngleRad = azimuthAngleDeg * math.pi / 180.0
	local pos = {
		x = entityPosition.x + radius * (math.sin(azimuthAngleRad) * math.cos(polarAngleRad)),
		y = entityPosition.y - radius * (math.sin(azimuthAngleRad) * math.sin(polarAngleRad)),
		z = entityPosition.z - radius * math.cos(azimuthAngleRad)
	}
	return pos
end

function spectate(target)
	ESX.TriggerServerCallback('esx:getPlayerData', function(player)
		if not InSpectatorMode then
			LastPosition = GetEntityCoords(PlayerPedId())
		end

		local playerPed = PlayerPedId()

		SetEntityCollision(playerPed, false, false)
		SetEntityVisible(playerPed, false)

		PlayerData = player

		if ShowInfos then
			SendNUIMessage({
				type = 'infos',
				data = PlayerData
			})	
		end

		Citizen.CreateThread(function()
			if not DoesCamExist(cam) then
				cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
			end

			SetCamActive(cam, true)
			RenderScriptCams(true, false, 0, true, true)

			InSpectatorMode = true
			TargetSpectate  = target
		end)
	end, target)

end

function resetNormalCamera()
	InSpectatorMode = false
	TargetSpectate  = nil
	local playerPed = PlayerPedId()

	SetCamActive(cam, false)
	RenderScriptCams(false, false, 0, true, true)

	SetEntityCollision(playerPed, true, true)
	SetEntityVisible(playerPed, true)
	SetEntityCoords(playerPed, LastPosition.x, LastPosition.y, LastPosition.z)
end

function getPlayersList()

	local players = ESX.Game.GetPlayers()
	local data = {}

	for i=1, #players, 1 do

		local _data = {
			id = GetPlayerServerId(players[i]),
			name = GetPlayerName(players[i])
		}
		table.insert(data, _data)
	end

	return data
end

RegisterNetEvent('esx_spectate:spectate')
AddEventHandler('esx_spectate:spectate', function()
	SetNuiFocus(true, true)

	SendNUIMessage({
		type = 'show',
		data = getPlayersList(),
		player = GetPlayerServerId(PlayerId())
	})
end)

RegisterNetEvent('esx_spectate:leavespectate')
AddEventHandler('esx_spectate:leavespectate', function()
	SetNuiFocus(false)
	resetNormalCamera()
end)

RegisterNUICallback('select', function(data, cb)
	spectate(data.id)
	SetNuiFocus(false)
end)

RegisterNUICallback('close', function(data, cb)
	SetNuiFocus(false)
end)

RegisterNUICallback('quit', function(data, cb)
	SetNuiFocus(false)
	resetNormalCamera()
end)

RegisterNUICallback('kick', function(data, cb)
	SetNuiFocus(false)
	TriggerServerEvent('esx_spectate:kick', data.id, data.reason)
	TriggerEvent('esx_spectate:spectate')
end)

Citizen.CreateThread(function()
  	while true do
		Wait(0)
		if InSpectatorMode then
			local targetPlayerId = GetPlayerFromServerId(TargetSpectate)
			local playerPed	  = PlayerPedId()
			local targetPed	  = GetPlayerPed(targetPlayerId)
			local coords	 = GetEntityCoords(targetPed)
			for _, i in ipairs(GetActivePlayers()) do
				if i ~= PlayerId() then
					local otherPlayerPed = GetPlayerPed(i)
					SetEntityNoCollisionEntity(playerPed,  otherPlayerPed,  true)
					SetEntityVisible(playerPed, false)
				end
			end
			if IsControlPressed(2, 241) then
				radius = radius + 2.0
			end
			if IsControlPressed(2, 242) then
				radius = radius - 2.0
			end
			if radius > -1 then
				radius = -1
			end
			local xMagnitude = GetDisabledControlNormal(0, 1)
			local yMagnitude = GetDisabledControlNormal(0, 2)
			polarAngleDeg = polarAngleDeg + xMagnitude * 10
			if polarAngleDeg >= 360 then
				polarAngleDeg = 0
			end
			azimuthAngleDeg = azimuthAngleDeg + yMagnitude * 10
			if azimuthAngleDeg >= 360 then
				azimuthAngleDeg = 0
			end
			local nextCamLocation = polar3DToWorld3D(coords, radius, polarAngleDeg, azimuthAngleDeg)
			SetCamCoord(cam,  nextCamLocation.x,  nextCamLocation.y,  nextCamLocation.z)
			PointCamAtEntity(cam,  targetPed)
			SetEntityCoords(playerPed,  coords.x, coords.y, coords.z + 10)
		else
			Wait(1000)
		end
	end
end)