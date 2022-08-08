--================================================================================================
--==                      VB-BANKING BY VISIBAIT (BASED OFF NEW_BANKING)                        ==
--================================================================================================

ESX                         = nil
local inMenu = false
local atbank = false

--
-- MAIN THREAD
--

CreateThread(function()

  while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(0)
	end
end)


RegisterKeyMapping('+banka', 'Banka', 'keyboard', 'E')
-- Main thread
RegisterCommand('-banka', function()
	---prazno mora biti
end, false)
RegisterCommand('+banka', function()
    local igrac = PlayerPedId()
    if nearBankorATM() then
    inMenu = true
    SetNuiFocus(true,true)
    SendNUIMessage({type = 'openGeneral', banco = atbank})
    TriggerServerEvent('vb-banking:server:balance', inMenu)
  end
end, false)
--
-- BLIPS
--

CreateThread(function()
  for k,v in ipairs(Config.Zone["banke"])do
  local blip = AddBlipForCoord(v.x, v.y, v.z)
  SetBlipSprite (blip, 434)
  SetBlipDisplay(blip, 4)
  SetBlipScale  (blip, 0.65)
  SetBlipColour (blip, 2)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(tostring(v.name))
  EndTextCommandSetBlipName(blip)
  end
end)

-- CreateThread(function()
--   for k,v in ipairs(Config.Zone["bankomati"])do
--   local blip = AddBlipForCoord(v.x, v.y, v.z)
--   SetBlipSprite (blip, v.id)
--   SetBlipDisplay(blip, 4)
--   SetBlipScale  (blip, 0.5)
--   SetBlipColour (blip, 2)
--   SetBlipAsShortRange(blip, true)
--   BeginTextCommandSetBlipName("STRING")
--   AddTextComponentString(tostring(v.name))
--   EndTextCommandSetBlipName(blip)
--   end
-- end)

--
-- EVENTS
--

RegisterNetEvent('vb-banking:client:refreshbalance')
AddEventHandler('vb-banking:client:refreshbalance', function(balance)
  local _streetcoords = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(PlayerPedId()))))
  local _pid = GetPlayerServerId(PlayerId())
  ESX.TriggerServerCallback('vb-banking:server:GetPlayerName', function(playerName)
    SendNUIMessage({
      type = "balanceHUD",
      balance = balance,
      player = playerName,
      address = _streetcoords,
      playerid = _pid
    })
  end)
end)

--
-- NUI CALLBACKS
--

RegisterNUICallback('deposit', function(data)
	TriggerServerEvent('vb-banking:server:depositvb', tonumber(data.amount), inMenu)
	TriggerServerEvent('vb-banking:server:balance', inMenu)
end)

RegisterNUICallback('withdraw', function(data)
	TriggerServerEvent('vb-banking:server:withdrawvb', tonumber(data.amountw), inMenu)
	TriggerServerEvent('vb-banking:server:balance', inMenu)
end)

RegisterNUICallback('balance', function()
	TriggerServerEvent('vb-banking:server:balance', inMenu)
end)

RegisterNetEvent('balance:back')
AddEventHandler('balance:back', function(balance)
	SendNUIMessage({type = 'balanceReturn', bal = balance})
end) 

RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('vb-banking:server:transfervb', data.to, data.amountt, inMenu)
	TriggerServerEvent('vb-banking:server:balance', inMenu)
end)

RegisterNetEvent('vb-banking:result')
AddEventHandler('vb-banking:result', function(type, message)
	SendNUIMessage({type = 'result', m = message, t = type})
end)

RegisterNUICallback('NUIFocusOff', function()
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeAll'})
  Wait(500)
  inMenu = false
end)

--
-- FUNCS
--

nearBankorATM = function()
    local _ped = PlayerPedId()
    local _pcoords = GetEntityCoords(_ped)
    local _toreturn = false
    for _, search in pairs(Config.Zone["banke"]) do
    local distance = #(vector3(search.x, search.y, search.z) - vector3(_pcoords))
        if distance < 3 then
          atbank = true
          toreturn = true  
        end
    end
    for _, search in pairs(Config.Zone["bankomati"]) do
    local distance = #(vector3(search.x, search.y, search.z) - vector3(_pcoords))
    if distance < 2 then
        atbank = false
        _toreturn = true
        end
    end
    return _toreturn
end


