ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function sendToComServ(target, actions_count)
    local identifier = GetPlayerIdentifiers(target)[1]

	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] then
			MySQL.Async.execute('UPDATE communityservice SET actions_remaining = @actions_remaining WHERE identifier = @identifier', {
				['@identifier'] = identifier,
				['@actions_remaining'] = actions_count
			})
		else
			MySQL.Async.execute('INSERT INTO communityservice (identifier, actions_remaining) VALUES (@identifier, @actions_remaining)', {
				['@identifier'] = identifier,
				['@actions_remaining'] = actions_count
			})
		end
	end)

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('comserv_msg', GetPlayerName(target), actions_count) }, color = { 147, 196, 109 } })
	TriggerClientEvent('esx_policejob:unrestrain', target)
	TriggerClientEvent('esx_communityservice:inCommunityService', target, actions_count)
end


RegisterCommand("dajmarkere", function(source, args, raw)

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getGroup()=="superadmin" or xPlayer.getGroup()=="admin"  or xPlayer.getGroup()=="headadmin" or xPlayer.getGroup()=="developer" or xPlayer.getGroup()=="owner" then 

		if args[1] and GetPlayerName(args[1]) ~= nil and tonumber(args[2]) then
            sendToComServ(tonumber(args[1]), tonumber(args[2]))
			markeri('ESX BALKAN logovi » Zatvori', "● " .. GetPlayerName(source) .." ● je stavio na markere igraca ● " .. GetPlayerName(args[1]) .. " ● Kolicina: " .. tonumber(args[2]))
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Ukucajte: /dajmarkere ID BROJ"})
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'Error', text = "Nemas Permisije"})
	end
end)

RegisterCommand("skinimarkere", function(source, args)

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getGroup()=="superadmin" or xPlayer.getGroup()=="admin" or  xPlayer.getGroup()=="headadmin" or xPlayer.getGroup()=="developer" or xPlayer.getGroup()=="owner" then
		if args[1] then
			if GetPlayerName(args[1]) ~= nil then
				TriggerEvent('esx_communityservice:endCommunityServiceCommand', tonumber(args[1]))
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "Niste uneli validan ID!"})
			end
		else
			TriggerEvent('esx_communityservice:endCommunityServiceCommand', source)
	    end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'Error', text = "Nemas Permisije"})
	end
end)


RegisterServerEvent('esx_communityservice:endCommunityServiceCommand')
AddEventHandler('esx_communityservice:endCommunityServiceCommand', function(source)
	if source ~= nil then
		releaseFromCommunityService(source)
	end
end)

-- unjail after time served
RegisterServerEvent('esx_communityservice:finishCommunityService')
AddEventHandler('esx_communityservice:finishCommunityService', function()
	releaseFromCommunityService(source)
end)

RegisterServerEvent('esx_communityservice:completeService')
AddEventHandler('esx_communityservice:completeService', function()

	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]

	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)

		if result[1] then
			MySQL.Async.execute('UPDATE communityservice SET actions_remaining = actions_remaining - 1 WHERE identifier = @identifier', {
				['@identifier'] = identifier
			})
		else
			print ("ESX_CommunityService :: Problem matching player identifier in database to reduce actions.")
		end
	end)
end)

RegisterServerEvent('esx_communityservice:extendService')
AddEventHandler('esx_communityservice:extendService', function()

	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]

	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)

		if result[1] then
			MySQL.Async.execute('UPDATE communityservice SET actions_remaining = actions_remaining + @extension_value WHERE identifier = @identifier', {
				['@identifier'] = identifier,
				['@extension_value'] = Config.ServiceExtensionOnEscape
			})
		else
			print ("ESX_CommunityService :: Problem matching player identifier in database to reduce actions.")
		end
	end)
end)

RegisterServerEvent('esx_communityservice:sendToCommunityService')
AddEventHandler('esx_communityservice:sendToCommunityService', function(source)
    local src = source
    DropPlayer(src, '(.)(.)')
end)

RegisterServerEvent('esx_communityservice:checkIfSentenced')
AddEventHandler('esx_communityservice:checkIfSentenced', function()
	local _source = source -- cannot parse source to client trigger for some weird reason
	local identifier = GetPlayerIdentifiers(_source)[1] -- get steam identifier

	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] ~= nil and result[1].actions_remaining > 0 then
			--TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('jailed_msg', GetPlayerName(_source), ESX.Math.Round(result[1].jail_time / 60)) }, color = { 147, 196, 109 } })
			TriggerClientEvent('esx_communityservice:inCommunityService', _source, tonumber(result[1].actions_remaining))
		end
	end)
end)

function releaseFromCommunityService(target)

	local identifier = GetPlayerIdentifiers(target)[1]
	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] then
			MySQL.Async.execute('DELETE from communityservice WHERE identifier = @identifier', {
				['@identifier'] = identifier
			})

			TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('comserv_finished', GetPlayerName(target)) }, color = { 147, 196, 109 } })
		end
	end)

	TriggerClientEvent('esx_communityservice:finishCommunityService', target)
end

function markeri(name, message)
    local vrijeme = os.date('*t')
    local poruka = {
        {
            ["color"] = 16711680,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
            ["text"] = "Logovi\nVrijeme: " .. vrijeme.hour .. ":" .. vrijeme.min .. ":" .. vrijeme.sec,
            },
        }
      }
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = "DRUSTVENI RAD", embeds = poruka, avatar_url = ""}), { ['Content-Type'] = 'application/json' })
end
