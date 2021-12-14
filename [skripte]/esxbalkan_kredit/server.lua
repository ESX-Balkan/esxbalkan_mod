ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-----------------------------------------------------------------------------------------------------------
ESX.RegisterServerCallback('esx.proverikredit', function (source, cb, identifier)
    local xPlayer= ESX.GetPlayerFromId(source)
    MySQL.Async.fetchScalar('SELECT * FROM kredit WHERE igrac = @igrac', {
        ["@igrac"] = xPlayer.identifier
    }, function(poesxo)
      if poesxo then

      end
    
      cb(poesxo)
    end)
end)
ESX.RegisterServerCallback('esx.podigni', function (source, cb, suma)
    local kurac = #(GetEntityCoords(GetPlayerPed(source)) - Config.Zonakredita)
if kurac < 10.0 then    
    local xPlayer= ESX.GetPlayerFromId(source)
    MySQL.Async.execute('INSERT INTO kredit (igrac, preostalo) VALUES (@owner, @plate)', {
        ['@owner']   = xPlayer.identifier,
        ['@plate']   = suma
    })
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Podigao si kredit $" .. suma ..  " svakih " .. Config.VremeRateKredita .. " ce ti se skidati jedan udeo"})
    xPlayer.addAccountMoney("bank", suma)
    kreditilogovi('Podizanje Kredita', GetPlayerName(source) .. ' je podigao kredit u iznosu od  ' .. ' ' .. suma)
else
    
end
end)




ESX.RegisterServerCallback('esx.rata', function (source, cb, identifier)

    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchScalar('SELECT * FROM kredit WHERE igrac = @igrac AND preostalo > 0', {
        ["@igrac"] = xPlayer.identifier 
    }, function(result)
        if result  then
          MySQL.Async.execute('UPDATE kredit SET preostalo = preostalo - 2000 WHERE igrac = @igrac', {
                ["@igrac"] = xPlayer.identifier

            })
                xPlayer.removeAccountMoney("bank", Config.RataKredita)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Skinuto ti je $2000 sa bankovnog racuna!RAZLOG: RATA ZA KREDIT!" })
                kreditilogovi('Podizanje Kredita', GetPlayerName(source) .. ' se skinulo 2000$ zbog rate')
        else
        

        end
    

    end)
end)


ESX.RegisterServerCallback('esx.obrisi', function (source, cb, identifier)

    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchScalar('SELECT * FROM kredit WHERE igrac = @igrac AND preostalo = 0', {
        ["@igrac"] = xPlayer.identifier 
    }, function(result)
        
        if result  then
            MySQL.Sync.execute(
                'DELETE FROM kredit WHERE preostalo = 0',
  
                  {
      
                     
                  }
              )	
        else
        

        end
    

    end)
end)
ESX.RegisterServerCallback('esx.ostalo', function (source, cb, identifier)

    local xPlayer= ESX.GetPlayerFromId(source)
    MySQL.Async.fetchScalar('SELECT preostalo FROM kredit WHERE igrac = @igrac', {
        ["@igrac"] = xPlayer.identifier
    }, function(poesxo)
      if poesxo then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Preostalo ti je jos $" .. poesxo .. " kredita" })
        kreditilogovi('Podizanje Kredita', GetPlayerName(source) .. ' preostalo mu je jos $ ' .. poesxo .. ' kredita da odplati')
      end

    end)
end)


function kreditilogovi(name,message, color)
    local vreme = os.date("*t")
    local DiscordWebHook = "https://discord.com/api/webhooks/915354582039810109/lrtQTbT5WMhZ4plUVID5Z3iYdB5gorgrC4vm-RKpxFLPCjc2oeS-NQ-WA6Eu-R4Zamc0"
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
      PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end