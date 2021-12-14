
ESX                           = nil


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)
Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while true do
Wait(Config.VremeRateKredita * 10000)

ESX.TriggerServerCallback("esx.rata", function(esx)
    if esx then
print("skinuta ti je rata kredita")

    end
end)
ESX.TriggerServerCallback("esx.obrisi", function(sesx)
    if esx then
print("ObRIesxN TI JE KREDIT")

    end
end)
Wait(Config.VremeRateKredita * 10000)
end


end)
local blip 
Citizen.CreateThread(function()

        blip = AddBlipForCoord(Config.Zonakredita)

        SetBlipSprite (blip, 277)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.7)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Kredit")
        EndTextCommandSetBlipName(blip)
end)
Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        local sleep = true
    local distance = #(GetEntityCoords(PlayerPedId()) - Config.Zonakredita)
    if ESX.PlayerData.job.name == "unemployed" then
    else

    if distance < 10  then
       
        sleep = false
        DrawMarker(42, 235.5577, 223.0627, 110.28, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0,0,120, 100, false, true,2,true,false,false,false)
        if distance < 2 then
          ESX.ShowHelpNotification('Pritisnite ~INPUT_CONTEXT~ da pristupite meniju za podizanje ~o~kredita')
        end

        if IsControlJustReleased(0, 38) and distance < 2 then
    

 
                       KreditMeni()
      
        end 
    end 
    if sleep == true then
        Wait(1000)
    end
end
end 

    end)

    function  KreditMeni()
        ESX.UI.Menu.CloseAll()
        local elements = {}

    
            table.insert(elements, {label = 'Preostalo kredita' , value = 'upravljanjeplatama'})

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'dokumenti_actions',
          {
            css      = 'meni',
            title    = 'Podizanje kredita | 📄',
            align    = 'right',
            elements = {
              {label = 'Kredit - $50.000', value = '50k'},
              {label = 'Kredit - $100.000', value = '100k'},
              {label = 'Kredit - $150.000', value = '150k'},
              {label = 'Preostali kredit', value = 'preostalo'},
            }
          },
          function(data, menu)
            if data.current.value == '50k' then
                local distance = #(GetEntityCoords(PlayerPedId()) - Config.Zonakredita)
                if distance < 10 then
                ESX.UI.Menu.CloseAll()
                
                ESX.TriggerServerCallback("esx.proverikredit", function(ukredit)
                    if not ukredit then
                        ESX.TriggerServerCallback("esx.podigni",  function(podigni)
                            if podigni then
                                
                            end
                        end, 50000)
                    else
                                       ESX.ShowNotification("Vec si u kreditu")
                    end
                end)
            else
                ESX.UI.Menu.CloseAll()
                 ESX.ShowNotification("Previse si daleko od mesta za kredit")
            end
        end
            if data.current.value == '100k' then
                local distance = #(GetEntityCoords(PlayerPedId()) - Config.Zonakredita)
                if distance < 10 then
                ESX.UI.Menu.CloseAll()
                ESX.TriggerServerCallback("esx.proverikredit", function(ukredit)
                    if not ukredit then
                        ESX.TriggerServerCallback("esx.podigni",  function(podigni)
                            if podigni then
                                
                            end
                        end, 100000)
                    else
               ESX.ShowNotification("Vec si u kreditu")
                    end
                end)
            else
                ESX.UI.Menu.CloseAll()
                ESX.ShowNotification("Previse si daleko od mesta za kredit")
            end
        end
            if data.current.value == '150k' then
                local distance = #(GetEntityCoords(PlayerPedId()) - Config.Zonakredita)
                if distance < 10 then
                ESX.UI.Menu.CloseAll()
                ESX.TriggerServerCallback("esx.proverikredit", function(ukredit)
                    if not ukredit then
                        ESX.TriggerServerCallback("esx.podigni",  function(podigni)
                            if podigni then
                                
                            end
                        end,  150000)
                    else
                                       ESX.ShowNotification("Vec si u kreditu")
                    end
                end)
            else
                ESX.UI.Menu.CloseAll()
                 ESX.ShowNotification("Previse si daleko od mesta za kredit")
            end
        end
  
        if data.current.value == 'preostalo' then
            local distance = #(GetEntityCoords(PlayerPedId()) - Config.Zonakredita)
            if distance < 10 then
            ESX.UI.Menu.CloseAll()
            ESX.TriggerServerCallback("esx.proverikredit", function(ukredit)
                if  ukredit then
                    ESX.TriggerServerCallback("esx.ostalo", function(ukreditt)
                        if  ukreditt then
                        end
                    end)
                else
                    ESX.ShowNotification("Nisi u kreditu")
                end
            end)
        else
            ESX.UI.Menu.CloseAll()
             ESX.ShowNotification("Previse si daleko od mesta za kredit")
        end
    end
          end
        )
        end
