ESX                           = nil



Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

----

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
		local sleep = true
    local distance = #(GetEntityCoords(PlayerPedId()) - Config.MestoRegistracije)
    if distance < 20 then

		sleep = false
        DrawMarker(1, Config.MestoRegistracije, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.5, 2.5, 2.5, 0,0,120, 100, false, true,2,true,false,false,false)
        if distance < 2 then
          --exports['djansr_UI']:Open('[E] da pritupis registraciji', 'darkblue', 'right')
        end
    if IsControlPressed(0, 38)    then
      local playerPed = PlayerPedId()
      local vehicle       = GetVehiclePedIsIn(playerPed)
      local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
      if vehicleProps ~= nil then
      OtvoriDokumentMenii()
      else
        ESX.ShowNotification("Moras biti u vozilu")
      end
     end
    else
     

  end
	if sleep == true then
		Citizen.Wait(1500)
	end
end
    end)

    local blip 
    Citizen.CreateThread(function()
    
            blip = AddBlipForCoord(Config.MestoRegistracije)
    
            SetBlipSprite (blip, 525)
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, 0.7)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Registracija vozila")
            EndTextCommandSetBlipName(blip)
    
        
    end)
RegisterNetEvent("meni")
AddEventHandler("meni", function()
   local distance = #(GetEntityCoords(PlayerPedId()) - Config.MestoRegistracije)
        if distance < 2 then
          OtvoriDokumentMenii()
        end
end)


    function OtvoriDokumentMenii(data)

        ESX.UI.Menu.CloseAll()
        local playerPed = PlayerPedId()
        local vehicle       = GetVehiclePedIsIn(playerPed)
        local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'dokumenti_actions',
          {
            css      = 'meni',
            title    = ' TABLICE : ' ..  vehicleProps.plate,
            align    = 'right',
            elements = {
              {label = 'Registruj na 7 dana', value = '7'},
              {label = 'Registruj na 15 dana', value = '15'},
              {label = 'Registruj na 30 dana', value = '30'},
              {label = 'Registruj na 60 dana', value = '60'},
            }
          },
          function(data, menu)
            if data.current.value == '7' then
             
              ESX.UI.Menu.CloseAll()
              local playerPed = PlayerPedId()
              local vehicle       = GetVehiclePedIsIn(playerPed)
              local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
              ESX.TriggerServerCallback("djansr:registruj", function(veh) 
      
                if veh then
                end
    
            end, vehicleProps.plate, Config.Cena7, 7)

            elseif data.current.value == '15' then
              ESX.UI.Menu.CloseAll()
              local playerPed = PlayerPedId()
              local vehicle       = GetVehiclePedIsIn(playerPed)
              local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
              ESX.TriggerServerCallback("djansr:registruj", function(veh)

                if veh then
                end
              
              end, vehicleProps.plate,Config.Cena15, 15)
            elseif data.current.value == '30' then
              ESX.UI.Menu.CloseAll()
              local playerPed = PlayerPedId()
              local vehicle       = GetVehiclePedIsIn(playerPed)
              local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
              ESX.TriggerServerCallback("djansr:registruj", function(veh)

                if veh then
                  ESX.ShowNotification("Uspesno si registrovao vozilo na 30 dana")
						TriggerServerEvent('logovi:client', bot, msg)
                end
              
              end, vehicleProps.plate, Config.Cena30, 30)
            elseif data.current.value == '60' then
              ESX.UI.Menu.CloseAll()
              ESX.ShowNotification("Uspesno si registrovao vozilo na 60 dana")
              local playerPed = PlayerPedId()
              local vehicle       = GetVehiclePedIsIn(playerPed)
              local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
              ESX.TriggerServerCallback("djansr:registruj", function(veh)

                if veh then
                  ESX.ShowNotification("Uspesno si registrovao vozilo na 60 dana")
                end
              
              end, vehicleProps.plate, Config.Cena60, 60)
              
            end
          end
        )
        end
