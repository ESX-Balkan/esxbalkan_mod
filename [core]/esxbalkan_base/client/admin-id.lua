local ESX  = nil

local open = false
local PlayerData = {}
local disPlayerNames = 20

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)


local idovi = false
RegisterCommand("id", function()
  ESX.TriggerServerCallback("esx:proveriRank", function(playerRank)
    if playerRank == "admin" or playerRank == "superadmin" or playerRank == "mod" then
          if not idovi then
            ESX.ShowNotification('Uključili ste IDove')
            idovi = true
          else
            idovi = false
          ESX.ShowNotification('Isključili ste IDove')
      end
    else
      ESX.ShowNotification('Niste admin')
    end
  end)
end)


playerDistances = {}

CreateThread(function()
    Wait(1000)
    while true do
    Wait(5)
      if not idovi then
        Wait(2000)
      else
        for _, player in ipairs(GetActivePlayers()) do
          local ped = GetPlayerPed(player)
          if GetPlayerPed(player) ~= PlayerPedId() then
            if playerDistances[player] ~= nil and playerDistances[player] < disPlayerNames then
              x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
              if not NetworkIsPlayerTalking(player) then
                TINKY3D(vec(x2, y2, z2+0.94), '~b~' .. GetPlayerServerId(player) .. ' ~c~| ~b~[~w~' .. GetPlayerName(player)..'~b~]~w~')
              else
                TINKY3D(vec(x2, y2, z2+0.94), '🎤' .. GetPlayerServerId(player) .. ' ~c~| ~b~[~w~' .. GetPlayerName(player)..'~b~]~w~')
              end
            end
          end
        end
      end
    end
end)


CreateThread(function()
    while true do
        for _, player in ipairs(GetActivePlayers()) do
            if GetPlayerPed(player) ~= PlayerPedId() then
                x1, y1, z1 = table.unpack(GetEntityCoords(PlayerPedId(), true))
                x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
                playerDistances[player] = distance
            end
        end
        Wait(1500)
    end
end)

function TINKY3D(coords, text, size)
  local onScreen,_x,_y=World3dToScreen2d(coords.x,coords.y,coords.z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  if onScreen then
      SetTextScale(0.35, 0.38)
      SetTextFont(4)
      SetTextProportional(1)
      SetTextColour(255, 255, 255, 215)
      SetTextDropshadow(255, 255, 255, 255, 255)
      SetTextEdge(1, 0, 0, 0, 150)
      SetTextDropshadow()
      SetTextOutline()
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(text)
      DrawText(_x,_y)
  end
end

