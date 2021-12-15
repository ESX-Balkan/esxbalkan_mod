local rob = false
local robbers = {}
PlayersCrafting    = {}
local CopsConnected  = 0
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()

RegisterServerEvent('esxbalkan_zlatara:toofar')
AddEventHandler('esxbalkan_zlatara:toofar', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. Stores[robb].nameofstore)
			TriggerClientEvent('esxbalkan_zlatara:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esxbalkan_zlatara:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. Stores[robb].nameofstore)
	end
end)

RegisterServerEvent('esxbalkan_zlatara:endrob')
AddEventHandler('esxbalkan_zlatara:endrob', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('end'))
			TriggerClientEvent('esxbalkan_zlatara:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esxbalkan_zlatara:robberycomplete', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_ended') .. Stores[robb].nameofstore)
	end
end)

RegisterServerEvent('esxbalkan_zlatara:rob')
AddEventHandler('esxbalkan_zlatara:rob', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	if Stores[robb] then

		local store = Stores[robb]

		if (os.time() - store.lastrobbed) < Config.SecBetwNextRob and store.lastrobbed ~= 0 then

            TriggerClientEvent('esxbalkan_zlatara:togliblip', source)
			TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. (Config.SecBetwNextRob - (os.time() - store.lastrobbed)) .. _U('seconds'))
			return
		end

		if rob == false then

			rob = true
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. store.nameofstore)
					TriggerClientEvent('esxbalkan_zlatara:setblip', xPlayers[i], Stores[robb].position)
				end
			end

			TriggerClientEvent('esx:showNotification', source, _U('started_to_rob') .. store.nameofstore .. _U('do_not_move'))
			sendToDiscord('Zlatara', GetPlayerName(source) .. ' je zapoceo pljacku zlatare')
			TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
			TriggerClientEvent('esx:showNotification', source, _U('hold_pos'))
			TriggerClientEvent('esxbalkan_zlatara:currentlyrobbing', source, robb)
            CancelEvent()
			Stores[robb].lastrobbed = os.time()
		else
			TriggerClientEvent('esx:showNotification', source, _U('robbery_already'))
		end
	end
end)

RegisterServerEvent('esxbalkan_zlatara:gioielli')
AddEventHandler('esxbalkan_zlatara:gioielli', function()

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addInventoryItem('jewels', math.random(Config.MinJewels, Config.MaxJewels))
end)

RegisterServerEvent('lester:vendita')
AddEventHandler('lester:vendita', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local reward = math.floor(Config.PriceForOneJewel * Config.MaxJewelsSell)

	xPlayer.removeInventoryItem('jewels', Config.MaxJewelsSell)
	xPlayer.addMoney(reward)

	sendToDiscord('Zlatara Prodaja', GetPlayerName(source) .. ' je prodao nakit za ' .. reward .. '$')

end)

ESX.RegisterServerCallback('esxbalkan_zlatara:conteggio', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb(CopsConnected)
end)

function sendToDiscord(name,message, color)
	local vreme = os.date("*t")
	local embeds = {
		{
			["title"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
		  ["text"]= "Vreme: " .. vreme.hour .. ":" .. vreme.min .. ":" .. vreme.sec,
  
		   },
		}
	} 
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({ username = name, embeds = embeds}), { ['Content-Type'] = 'application/json' })
end