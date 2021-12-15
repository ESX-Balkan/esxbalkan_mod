ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



ESX.RegisterCommand('spec', 'admin', function(xPlayer, args, showError)
	local steamime = GetPlayerName(xPlayer.source)
	xPlayer.triggerEvent('esx_spectate:spectate')
	komandelog("Komanda Spectate 🔍", "\n Steam Ime: **"  .. steamime  .. "**")
end, false, {help = 'Posmatraj', validate = true, arguments = {
}})

ESX.RegisterCommand('izadjispec', 'admin', function(xPlayer, args, showError)
	local steamime = GetPlayerName(xPlayer.source)
	xPlayer.triggerEvent('esx_spectate:leavespectate')
	komandelog("Komanda IzadjiSpec 🔍", "\n Steam Ime: **"  .. steamime  .. "**")
end, false, {help = 'Posmatraj', validate = true, arguments = {
}})

ESX.RegisterServerCallback('esx_spectate:getPlayerData', function(source, cb, id)
	local xPlayer = ESX.GetPlayerFromId(id)
	cb(xPlayer)
end)

RegisterNetEvent('esx_spectate:kick')
AddEventHandler('esx_spectate:kick', function(target, msg)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getGroup() ~= 'user' then
		DropPlayer(target, msg)
	else
		DropPlayer(source, "Ide hakuj negde drugde.")
	end
end)

function komandelog(name, message)
	local vrijeme = os.date('*t')
	local poruka = {
		{
			["color"] = 16449301,
			["title"] = "".. name .."",
			["description"] = message,
			-- ["footer"] = {
			-- ["text"] = "Hugo Logovi ⏱️\nVrijeme: " .. vrijeme.hour .. ":" .. vrijeme.min .. ":" .. vrijeme.sec,
			-- },
		}
	  }
	PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = "Logovi", embeds = poruka, avatar_url = ""}), { ['Content-Type'] = 'application/json' })
end


RegisterCommand("admini", function(source, rawCommand)

	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "admin" then
		  TriggerClientEvent('chat:addMessage', source, {
		  
			args = {"^2 LISTA ONLINE ADMINA"}
			})
	
			TriggerClientEvent('chat:addMessage', source, {
  
			  args = {"^4" .. GetPlayerName(xPlayers[i]) .. " ^2" .. xPlayer.getGroup() }
			  })
			else
			  TriggerClientEvent('chat:addMessage', source, {
		  
				args = {"^4 Trenutno nema admina "}
				})
			end
  
  
		if xPlayers == nil then
		 -- print("nema online admina")
		end
	end
  
  end)
