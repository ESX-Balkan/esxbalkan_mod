ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

esxGlavna = {
    ['saucesnici'] = {},
}

local pozoviServer = TriggerEvent
local pozoviClient = TriggerClientEvent

local RSE = RegisterServerEvent
local AEH = AddEventHandler

local mikicajci = 0
local brojPokupljenih = 0

local licencaRaw = ESXBalkan.Licenca

ESX.RegisterServerCallback('esxGlavna:povuciPolicajce', function(source, cb)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
     local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
     if xPlayer.job.name == 'police' then
            mikicajci = mikicajci + 1
        end
    end

    cb(mikicajci)
  end)

ESX.RegisterServerCallback('esxGlavna:itemCallback', function(source, cb, imeItema)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getInventoryItem(imeItema) then
        if xPlayer.getInventoryItem(imeItema).count > 0 then
            cb(true)
        end
    else
        cb(false)
    end
end)

RSE('esxGlavna:pljackaZapoceta')
AEH('esxGlavna:pljackaZapoceta', function(kordinate)
    if (os.time() - ESXBalkan.OpljackanaZadnjiPut) < 3600 and ESXBalkan.OpljackanaZadnjiPut ~= 0 then
        TriggerClientEvent('esx:showNotification', 'Banka je vec opljackana!')
        return
    end

    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

        ESXBalkan.OpljackanaZadnjiPut = os.time()

        if xPlayer.getJob().name == 'police' then
           pozoviClient('esxGlavna:upaliBlip', xPlayers[i])
           --xPlayer.showNotification('Pljacka glavne banke je u toku, potrebna hitna intervencija!')
           TriggerClientEvent('esx:showNotification', 'Pljacka glavne banke je u toku, potrebna hitna intervencija!')
        else
            --xPlayer.showNotification('Pljacka glavne banke je u toku, mole se gradjani da ostanu na sigurnom i da ne prilaze banci')
            TriggerClientEvent('esx:showNotification', 'Pljacka glavne banke je u toku, mole se gradjani da ostanu na sigurnom i da ne prilaze banci')
        end

        esxGlavna['saucesnici'] = {}

        local kordinatePlayera = xPlayer.getCoords(true)
        local dist = #(kordinatePlayera - kordinate)
        if dist <= 7.0 then
            esxGlavna['saucesnici'][i] = xPlayers[i]
        end
    end
end)

RSE('esxGlavna:pocniStopSekvencu')
AEH('esxGlavna:pocniStopSekvencu', function()

end)

RSE('esxGlavna:oduzmiItem')
AEH('esxGlavna:oduzmiItem', function(imeItema, kolicina)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem(imeItema, kolicina)
    --xPlayer.showNotification('Uklonjeno vam je (' .. kolicina .. 'x)' ..  imeItema)
    TriggerClientEvent('esx:showNotification', 'Uklonjeno vam je (' .. kolicina .. 'x)' ..  imeItema)
end)

RSE('esxGlavna:ormaric:nagrada')
AEH('esxGlavna:ormaric:nagrada', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    for k,v in pairs(ESXBalkan.ItemiUpperVault) do
        xPlayer.addInventoryItem(v.imeDatabaza, v.kolicina)
        --xPlayer.showNotification('Dobili ste ste (' .. v.kolicina .. 'x)' .. v.label)
        TriggerClientEvent('esx:showNotification', 'Dobili ste ste (' .. v.kolicina .. 'x)' .. v.label)
    end

    if ESXBalkan.UpperDobijanjePara then
        if ESXBalkan.UpperPrljavePare then
            xPlayer.addAccountMoney('black_money', ESXBalkan.UpperKolicinaPara)
            --xPlayer.showNotification('Dobili ste ste (' .. ESXBalkan.UpperKolicinaPara .. '$) prljavog novca!')
            TriggerClientEvent('esx:showNotification', 'Dobili ste ste (' .. ESXBalkan.UpperKolicinaPara .. '$) prljavog novca!')
        else
            xPlayer.addMoney(ESXBalkan.UpperKolicinaPara)
            --xPlayer.showNotification('Dobili ste ste (' .. ESXBalkan.UpperKolicinaPara .. '$) cistog novca!')    
            TriggerClientEvent('esx:showNotification', 'Dobili ste ste (' .. ESXBalkan.UpperKolicinaPara .. '$) cistog novca!')
        end
    end

    discordLog('💵 esxGlavna | Pacific Heist', GetPlayerName(source) .. ' je opljackao upper vault!\nLokacija ormaric u upperu: (266.28347, 213.9367, 101.68371)\nLokacija Igraca (' .. GetEntityCoords(GetPlayerPed(source)) .. ')\nKolicina dobijenog novca: ' .. ESXBalkan.UpperKolicinaPara .. '$' , ESXBalkan.Zelena)
end) 

RSE('esxGlavna:propLoot')
AEH('esxGlavna:propLoot', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local kljuceviNajjace = {}
    for k,_ in pairs(ESXBalkan.LowerVaultPropItemi) do
        table.insert(kljuceviNajjace, k)
    end
    
    local randomKey = kljuceviNajjace[math.random(1, #kljuceviNajjace)]
    local valueKeya = ESXBalkan.LowerVaultPropItemi[randomKey]

    xPlayer.addInventoryItem(valueKeya.imeDatabaza, valueKeya.kolicina)
    --xPlayer.showNotification('Dobili ste ste (' .. valueKeya.kolicina .. 'x)' .. valueKeya.label)
    TriggerClientEvent('esx:showNotification', 'Dobili ste ste (' .. valueKeya.kolicina .. 'x)' .. valueKeya.label)

    if ESXBalkan.LowerVaultPropDobijanjePara then
        discordLog('💵 esxGlavna | Pacific Heist', GetPlayerName(source) .. ' je pokupio prop loot (kovertu)\n\nLokacija Igraca (' .. GetEntityCoords(GetPlayerPed(source)) .. ')\nDobijeni item: ' .. valueKeya.label .. 'Dobijeni novac: ' .. ESXBalkan.UpperKolicinaPara .. '$' , ESXBalkan.Zelena)

        if ESXBalkan.LowerVaultPropBlackPare then
            xPlayer.addAccountMoney('black_money', ESXBalkan.LowerVaultKolicinaPara)
            --xPlayer.showNotification('Dobili ste ste (' .. ESXBalkan.LowerVaultKolicinaPara .. '$) prljavog novca!')
            TriggerClientEvent('esx:showNotification', 'Dobili ste ste (' .. ESXBalkan.LowerVaultKolicinaPara .. '$) prljavog novca!')
        else
            xPlayer.addMoney(ESXBalkan.LowerVaultKolicinaPara)
            --xPlayer.showNotification('Dobili ste ste (' .. ESXBalkan.LowerVaultKolicinaPara .. '$) cistog novca!')   
            TriggerClientEvent('esx:showNotification', 'Dobili ste ste (' .. ESXBalkan.LowerVaultKolicinaPara .. '$) cistog novca!')
        end
    end

    brojPokupljenih = brojPokupljenih + 1
   -- xPlayer.showNotification('Mozete pokupiti jos ' .. ESXBalkan.LowerVaultPropMaxUzimanje - brojPokupljenih .. ' itema!')
   TriggerClientEvent('esx:showNotification', 'Mozete pokupiti jos ' .. ESXBalkan.LowerVaultPropMaxUzimanje - brojPokupljenih .. ' itema!')

    discordLog('💵 esxGlavna | Pacific Heist', GetPlayerName(source) .. ' je pokupio prop loot (kovertu)\n\nLokacija Igraca (' .. GetEntityCoords(GetPlayerPed(source)) .. ')\nDobijeni item: ' .. valueKeya.label .. 'Dobijeni novac: 0$', ESXBalkan.Zelena)
end)

ESX.RegisterServerCallback('esxGlavna:povuciBrojPokupljenih', function(source, cb) cb(brojPokupljenih) end)

RSE('esxGlavna:sefoviNagrada')
AEH('esxGlavna:sefoviNagrada', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    for k,v in pairs(ESXBalkan.SefoviItemi) do
        xPlayer.addInventoryItem(v.imeDatabaza, v.kolicina)
        --xPlayer.showNotification('Dobili ste ste (' .. v.kolicina .. 'x)' .. v.label)
        TriggerClientEvent('esx:showNotification', 'Dobili ste ste (' .. v.kolicina .. 'x)' .. v.label)
        discordLog('💵 esxGlavna | Pacific Heist', GetPlayerName(source) .. ' je dobio ' .. ' ' .. v.kolicina .. ' ' .. v.label)
    end

    if ESXBalkan.SefovirDobijanjePara then
        if ESXBalkan.SefoviPrljavePare then
            xPlayer.addAccountMoney('black_money', ESXBalkan.SefoviKolicinaPara)
            --xPlayer.showNotification('Dobili ste ste (' .. ESXBalkan.SefoviKolicinaPara .. '$) prljavog novca!')
            TriggerClientEvent('esx:showNotification', 'Dobili ste ste (' .. ESXBalkan.SefoviKolicinaPara .. '$) prljavog novca!')
            discordLog('💵 esxGlavna | Pacific Heist', GetPlayerName(source) .. ' je dobio ' .. ' ' .. ESXBalkan.SefoviKolicinaPara .. ' prljavog novca')
        else
            xPlayer.addMoney(ESXBalkan.SefoviKolicinaPara)
            --xPlayer.showNotification('Dobili ste ste (' .. ESXBalkan.SefoviKolicinaPara .. '$) cistog novca!')
            TriggerClientEvent('esx:showNotification', 'Dobili ste ste (' .. ESXBalkan.SefoviKolicinaPara .. '$) cistog novca!')
            discordLog('💵 esxGlavna | Pacific Heist', GetPlayerName(source) .. ' je dobio ' .. ' ' .. ESXBalkan.SefoviKolicinaPara .. ' cistog novca')
        end
    end
end) 

RSE('esxGlavna:trollyReward')
AEH('esxGlavna:trollyReward', function(nagrada)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then
        if nagrada.item ~= nil then
            xPlayer.addInventoryItem(nagrada.item, nagrada.kolicina)
        else
            xPlayer.addMoney(nagrada.kolicina)
        end
    end
end)

RSE('esxGlavna:pukaoGaLaser')
AEH('esxGlavna:pukaoGaLaser', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeAccountMoney('black_money', math.random(500, 2500))
    --xPlayer.showNotification('Udaraju vas laseri, vase pare se deru!')
    TriggerClientEvent('esx:showNotification', 'Udaraju vas laseri, vase pare se deru!')
end)

RSE('esxGlavna:pushajLog')
AEH('esxGlavna:pushajLog', function(name, message, color)
	discordLog(name, message, color)
end)

RSE('esxGlavna:server:lootSinkronizacija')
AEH('esxGlavna:server:lootSinkronizacija', function(index)
    for k, v in pairs(esxGlavna['saucesnici']) do
        TriggerClientEvent('esxGlavna:lootSinkronizacija', v, index)
    end
end)

function discordLog(name, message, color)
	local vreme = os.date('*t')
  
	local embeds = {
		{
		  	["title"] = message,
		  	["type"] = "rich",
		  	["color"] = color,
		  	["footer"] =  {
		  		["text"]= ESXBalkan.LogoviMainTekst .. vreme.hour .. ':' .. vreme.min .. ':' .. vreme.sec,
		 	},
	  	}
  	}
  
if message == nil or message == '' then return FALSE end
	PerformHttpRequest('https://discord.com/api/webhooks/915354582039810109/lrtQTbT5WMhZ4plUVID5Z3iYdB5gorgrC4vm-RKpxFLPCjc2oeS-NQ-WA6Eu-R4Zamc0', function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end
