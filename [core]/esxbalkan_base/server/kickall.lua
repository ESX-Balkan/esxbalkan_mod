local ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('kickall', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local steamime = GetPlayerName(xPlayer.source)--Logovi
    if xPlayer.getGroup()=="superadmin" or xPlayer.getGroup()=="admin" then
        izbaciSve()
        komandelog2("KickAll 🔄", "\n Steam Admina: **"  .. steamime .. "**")
        print('[Server] Odrađen kickall,možeš restartovati!')

    else
        xPlayer.showNotification('Nemate dozvolu!')
    end
end, true)

function izbaciSve()
    local xPlayers = ESX.GetPlayers()
    ESX.SavePlayers()
    Wait(6000)
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        xPlayer.kick("RESTART SERVERA U TOKU🔄[ESX BALKAN MOD]")
    end
end

----------------------Logovi
function komandelog2(name, message)
	local vrijeme = os.date('*t')
	local poruka = {
		{
			["color"] = 2061822,
			["title"] = "".. name .."",
			["description"] = message,
			-- ["footer"] = {
			-- ["text"] = "Hugo Logovi ⏱️\nVrijeme: " .. vrijeme.hour .. ":" .. vrijeme.min .. ":" .. vrijeme.sec,
			-- },
		}
		}
	PerformHttpRequest("https://discord.com/api/webhooks/872076260090707968/CZRKrFApgUePLMiL3L7aILAbXj2yQE1QaTAGFqQADCspYPjjZpKaJzm4JcAz6_n7s71Y", function(err, text, headers) end, 'POST', json.encode({username = "Logovi", embeds = poruka, avatar_url = ""}), { ['Content-Type'] = 'application/json' })
end
