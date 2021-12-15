
Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


local uberBasladi = false
local paketNoktasi = false
local uberChoosenAdress = nil
local uberChoosenItem = nil
local kapiCalindi = false

function Draw3DText2(x,y,z,text,size)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35,0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    --DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 100)
end

function blipOlustur()
	uberBlip = AddBlipForCoord(Config.uberDelivery[uberChoosenAdress]["x"], Config.uberDelivery[uberChoosenAdress]["y"],Config.uberDelivery[uberChoosenAdress]["z"])
	SetBlipSprite(uberBlip, 1)
	SetBlipColour(uberBlip, 16742399)
	SetBlipScale(uberBlip, 0.5)
	SetNewWaypoint(Config.uberDelivery[uberChoosenAdress]["x"], Config.uberDelivery[uberChoosenAdress]["y"])
end

RegisterNUICallback('crewPhone_uberTrigger', function()
    if uberBasladi then
        ESX.ShowNotification(_U('uber_passive'))
		uberBasladi = false
		paketNoktasi = true	
        RemoveBlip(uberBlip)
        SendNUIMessage({event = 'updateUber', status = uberBasladi})
        SendNUIMessage({event = 'updateSiparisStatus', status = false})
	else
		ESX.ShowNotification(_U('uber_active'))
		uberBasladi = true
        paketNoktasi = false
        SendNUIMessage({event = 'updateUber', status = uberBasladi})
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if uberBasladi and not paketNoktasi then
			cooldown = math.random(10000,15000)
			Citizen.Wait(cooldown) 
			if uberBasladi then
				PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
				uberChoosenItem = math.random(1,#Config.uberItems)
				ESX.ShowNotification(_U('uber_new_delivery') .. Config.uberItems[uberChoosenItem]["name"] .. _U('uber_marked'))
				paketNoktasi = true
                uberChoosenAdress = math.random(1,#Config.uberDelivery)
                local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(Config.uberDelivery[uberChoosenAdress]["x"], Config.uberDelivery[uberChoosenAdress]["y"], Config.uberDelivery[uberChoosenAdress]["z"]))
                SendNUIMessage({event = 'updateSiparisStatus', status = true})
                SendNUIMessage({event = 'updateSiparisAdres', adres = streetName})
                SendNUIMessage({event = 'updateSiparisUrun', urun = Config.uberItems[uberChoosenItem]["name"]})
				blipOlustur()
			end
		elseif not uberBasladi then
			paketNoktasi = true
		end
	end
end)

function rewarduber()
	kapiCalindi = false
	paketNoktasi = false
	RemoveBlip(uberBlip)
	local esyaMarketFiyat = Config.uberItems[uberChoosenItem]["price"]
	local price = (esyaMarketFiyat * Config.uberPriceMultiplier) + math.random(Config.uberTipMin,Config.uberTipMax)
	ESX.ShowNotification(_U('uber_delivery_succ') .. ESX.Math.Round(price))
	if npcEvdemi == 1 then
		local bahsis = math.random(3,10)
		local toplamPara = price + bahsis
		TriggerServerEvent('esx_uber:pay', toplamPara)
		ESX.ShowNotification(_U('uber_tips') .. bahsis)

	elseif npcEvdemi ~= 1 then
		TriggerServerEvent('esx_uber:pay', price)
    end
    SendNUIMessage({event = 'updateSiparisStatus', status = false})
end

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if uberBasladi and uberChoosenAdress ~= nil then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.uberDelivery[uberChoosenAdress]["x"], Config.uberDelivery[uberChoosenAdress]["y"], Config.uberDelivery[uberChoosenAdress]["z"], true ) < 1.2 and paketNoktasi and not kapiCalindi then
				Draw3DText2(Config.uberDelivery[uberChoosenAdress]["x"], Config.uberDelivery[uberChoosenAdress]["y"], Config.uberDelivery[uberChoosenAdress]["z"] + 0.3, tostring("~w~~g~[E]~w~ ".._U('uber_knock_door')))
			
				if(IsControlJustPressed(1, Keys["E"])) then
					ESX.TriggerServerCallback('crew-phone:item-check', function(qtty)
						if qtty > 0 then
							TriggerServerEvent("uber:esyaSil", Config.uberItems[uberChoosenItem]["item"])
							kapiCalindi = true
							npcEvdemi = math.random(1,2)
							PlayAnimation(PlayerPedId(), "timetable@jimmy@doorknock@", "knockdoor_idle")
							Citizen.Wait(3000)
							
							if npcEvdemi == 1 then
								TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
								Citizen.Wait(3000)
								ClearPedTasks(PlayerPedId(-1))
								delivery1 = false
								paketNoktasi = false
								rewarduber()
							else
								TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
								Citizen.Wait(3000)
								ClearPedTasks(PlayerPedId(-1))
								PlaceObjectOnGroundProperly(PackageDeliveryObject)
								rewarduber()
							end
						else
							ESX.ShowNotification(_U('uber_not_have_item') .. Config.uberItems[uberChoosenItem]["name"])
						end
					end, Config.uberItems[uberChoosenItem]["item"])
				end
			end
		end
	end
end)

PlayAnimation = function(ped, dict, anim, settings)
    if dict then
        Citizen.CreateThread(function()
            RequestAnimDict(dict)

            while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
      end

      if settings == nil then
        TaskPlayAnim(ped, dict, anim, 1.0, -1.0, 1.0, 0, 0, 0, 0, 0)
      else 
        local speed = 1.0
        local speedMultiplier = -1.0
        local duration = 1.0
        local flag = 0
        local playbackRate = 0

        if settings["speed"] ~= nil then
          speed = settings["speed"]
        end

        if settings["speedMultiplier"] ~= nil then
          speedMultiplier = settings["speedMultiplier"]
        end

        if settings["duration"] ~= nil then
          duration = settings["duration"]
        end

        if settings["flag"] ~= nil then
          flag = settings["flag"]
        end

        if settings["playbackRate"] ~= nil then
          playbackRate = settings["playbackRate"]
        end

        TaskPlayAnim(ped, dict, anim, speed, speedMultiplier, duration, flag, playbackRate, 0, 0, 0)
      end
      
      RemoveAnimDict(dict)
        end)
    else
        TaskStartScenarioInPlace(ped, anim, 0, true)
    end
end