ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('napravizonu')
AddEventHandler('napravizonu', function(ime, korde, width, height, boja, placanje)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local player = xPlayer.source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(ped)
    
    MySQL.Async.execute('INSERT INTO zone (`ime`, `vlasnik`, `koordinate`, `height`, `width`, `boja`, `placanje`, `mestozauzimanja`) VALUES (@ime, @vlasnik, @koordinate, @height, @width, @boja,  @placanje, @mestozauzimanja);',
        {
            ime  =  ime,
            koordinate = korde,
            vlasnik = xPlayer.job.name,
            width = width,
            height = height,
            boja = boja,
            mestozauzimanja = json.encode(playerCoords),
            placanje = placanje,
        })
end)

ESX.RegisterServerCallback('checkorgt', function(source, cb, ime)
        local result = MySQL.Sync.fetchAll('SELECT * FROM zone WHERE ime = @ime', {
            ['@ime'] = ime
        })
        if result[1].vreme ~= nil then
        if tonumber(os.time()) - tonumber(result[1].vreme) > 14640  then
            cb(true)
        else
            cb(false)
        end
    else
        cb(true)
    end
end)

RegisterServerEvent('zona-update:s')
AddEventHandler('zona-update:s', function()
    local tabla = {}
    local _source = source
    local result = MySQL.Sync.fetchAll('SELECT * FROM zone')
    for i=1, #result, 1 do
        table.insert(tabla, {
            ime = result[i].ime,
            vlasnik = result[i].vlasnik,
            koordinate = json.decode(result[i].koordinate),
            height = result[i].height,
            width = result[i].width,
            boja = result[i].boja,
            mestozauzimanja = json.decode(result[i].mestozauzimanja),
        })
    end
    TriggerClientEvent('zone-update:c', _source, tabla)

end)

ESX.RegisterServerCallback('checkorgz', function(source, cb, org)
    local _source = source
    local zPlayer = ESX.GetPlayerFromId(_source)
    local bb = {}
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == zPlayer.job.name then
           table.insert(bb, xPlayer.source)
        end
    end
    cb(#bb)
    end)

ESX.RegisterServerCallback('checkorg', function(source, cb, org)
    local bb = {}
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == org then
           table.insert(bb, xPlayer.source)
        end
    end
    cb(#bb)
    end)

dajparezazone = function()

    function dajPare()
        local xPlayers = ESX.GetPlayers()
       local result = MySQL.Sync.fetchAll('SELECT * FROM zone')
       for i=1, #result, 1 do
        for j=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[j])
            if xPlayer.job.name == result[i].vlasnik then
            xPlayer.addAccountMoney('bank', tonumber(result[i].placanje))
            xPlayer.showNotification('Dobili ste '.. result[i].placanje.. '$ od zone '.. result[i].ime)
            sendToDiscord('Dobijanje Para Od Zona', GetPlayerName(source) .. ' je dobio ' .. ' ' .. result[i].placanje .. ' ' .. '$ od zone' .. result[i].ime)
            end
            end
        end
        SetTimeout(60 * 60000, dajPare)
    end
    SetTimeout(60 * 60000, dajPare)
end


RegisterServerEvent('zonauzbuna')
AddEventHandler('zonauzbuna', function(vlasnik, korde, ime)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == vlasnik then
            xPlayer.showNotification('Neko pokusava zauzeti vasu zonu ('..ime..'), zona vam je oznacena na mapi!')
            TriggerClientEvent('setajwpzone', xPlayer.source, korde)
        end
    end
end)
RegisterServerEvent('zauzmizonu')
AddEventHandler('zauzmizonu', function(ime, boja, vlasnik)
    local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        vreme = os.time()
    MySQL.Async.execute('UPDATE zone SET vlasnik = @vlasnik, boja = @boja, vreme = @vreme WHERE ime = @ime', {
        ['@ime'] = ime,
        ['@vlasnik'] = xPlayer.job.name,
        ['@boja'] = boja,
        ['@vreme'] = vreme,
    })
end)


RegisterServerEvent('vreme:u')
AddEventHandler('vreme:u', function(ime)
    vreme = os.time()
    MySQL.Async.execute('UPDATE zone SET vreme = @vreme WHERE ime = @ime', {
        ['@vreme'] = vreme,
        ['@ime'] = ime,
    })
end)

   dajparezazone()

function sendToDiscord(name,message, color)
    local vreme = os.date("*t")
    local DiscordWebHook = "WEBHOOK"
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
  
RegisterServerEvent('logovi:client')
AddEventHandler('logovi:client', function(bot, msg)
    sendToDiscord(bot, msg, 0)
end)