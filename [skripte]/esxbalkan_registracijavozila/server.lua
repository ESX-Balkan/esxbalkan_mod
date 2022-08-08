ESX = nil



TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterServerCallback('djansr:proverireg', function (source, cb, plate)


    local xPlayer = ESX.GetPlayerFromId(source)
  

        MySQL.Async.fetchScalar('SELECT * FROM owned_vehicles WHERE owner = @tab AND plate = @plate', {
            ["@tab"] = xPlayer.identifier,
            ["@plate"] = plate
        }, function(result)
    
            if  result then
            cb(true)
    
       
            else
               cb(false)
               print("nije tvoje")
            end
      end)
end)
RegisterCommand('proveriregistracije', function(source, args, h, m)

    local xPlayer = ESX.GetPlayerFromId(source)
  
    if xPlayer.job.name == 'police' then
    end
    if args[1] == nil then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Moras uneti /proveriregistracije  pa onda tablice auta"})

    else
        MySQL.Async.fetchScalar('SELECT izvadio FROM registracija WHERE tablice = @tab', {
            ["@tab"] = args[1]
        }, function(izvadio)
        MySQL.Async.fetchScalar('SELECT tablice FROM registracija WHERE tablice = @tab', {
            ["@tab"] = args[1] 
        }, function(result)
    
            if  result then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Ovo vozilo je registrovano  tablice " .. args[1] .. " registrovano jos " .. izvadio .. " dana"})

    
       
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Ovo vozilo nije registrovano tablice : " .. args[1]})
            end
        
      end)
    end)
    end	
    if redjansrult == 1 then

    end

end)
RegisterServerEvent("obrisizadan")
AddEventHandler("obrisizadan", function(source)

    MySQL.Async.fetchAll('SELECT * FROM registracija WHERE tablice = tablice', {
    }, function(result)
        if result then
            MySQL.Sync.execute(
                'UPDATE registracija SET izvadio = izvadio - 1  WHERE tablice = tablice',
                {
    
                   
                }
            )	
  
        end
    end)
end)
RegisterServerEvent("obrisizadan2")
AddEventHandler("obrisizadan2", function(source)
Wait(1500)
    MySQL.Async.fetchAll('SELECT * FROM registracija WHERE tablice = tablice', {
    }, function(result)
        if result then
            MySQL.Sync.execute(
                              'DELETE FROM registracija WHERE izvadio = 0',
                {
    
                   
                }
            )	
  
        end
    end)
end)

ESX.RegisterServerCallback('djansr:registruj', function (source, cb, plate, brojka, drugabrojka)

    local xPlayer = ESX.GetPlayerFromId(source)
        local kurac = #(GetEntityCoords(GetPlayerPed(source)) - Config.MestoRegistracije)
    if kurac < 10.0 then
        TriggerEvent("uso")
        print("registrovao")
        registracijeLogovi('Registrovanje Auta', GetPlayerName(source) .. ' je registrovao auta na ' .. drugabrojka .. ' tablice su ' .. plate)
        MySQL.Async.fetchScalar('SELECT * FROM owned_vehicles WHERE owner = @tab AND plate = @plate', {
            ["@tab"] = xPlayer.identifier,
            ["@plate"] = plate
        }, function(result2)
        MySQL.Async.fetchScalar('SELECT tablice FROM registracija WHERE tablice = @tab', {
            ["@tab"] = plate
        }, function(result)
            if xPlayer.getMoney() >= brojka then
            if   not result  and result2  then
            
                xPlayer.removeMoney( brojka)

                MySQL.Sync.execute(
                    'INSERT INTO registracija (tablice, izvadio) VALUES (@owner, @izvadio)',
                    {
                        ['@owner']   = plate,
                        ['@izvadio']   = drugabrojka,
                    }
                )
            
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Ovo vozilo je registrovano ili nije tvoje"})
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Nemas para za registraciju"})
        end
      end)
    end)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Moras biti na mestu za registraciju auta"})
   


      end	
end)




function Pokreni(d, h, m)

    TriggerEvent("obrisizadan")
    print("Sve registracije pomerene za 1")
    TriggerEvent("obrisizadan2")
  
end
  
  TriggerEvent('cron:runAt', 20, 0, Pokreni)

  function registracijeLogovi(name,message, color)
    local vreme = os.date("*t")
    local embeds = {
        {
            ["title"]=message,
            ["type"]="rich",
            ["color"] =color,
            ["footer"]=  {
          ["text"]= "Vrijeme: " .. vreme.hour .. ":" .. vreme.min .. ":" .. vreme.sec,
  
           },
        }
    }
  
      if message == nil or message == '' then return FALSE end
      PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({ username = name, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end
  
  RegisterServerEvent('logovi:client')
  AddEventHandler('logovi:client', function(bot, msg)
    registracijeLogovi(bot, msg, 0)
  end)
