local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local savedCoords   = {}
local onTimer       = {}

-- Discord Permsije
Permisije = {
  DiscordToken = "ODY5NjA3MzczODcyOTg4MTYy.YQAq-g.-hR0eZ1P6JCHYe6fAzCA45K5m3A",		
  GuildId = "728629036544163881",

  Roles = {
    ["WL"] = "728630115952754728", -- This would be checked by doing exports.discord_perms:IsRolePresent(user, "TestRole")			790339413749399592		
    
  }
}

local FormattedToken = "Bot "..Permisije.DiscordToken

function DiscordRequest(method, endpoint, jsondata)
    local data = nil
    PerformHttpRequest("https://discordapp.com/api/"..endpoint, function(errorCode, resultData, resultHeaders)
		data = {data=resultData, code=errorCode, headers=resultHeaders}
    end, method, #jsondata > 0 and json.encode(jsondata) or "", {["Content-Type"] = "application/json", ["Authorization"] = FormattedToken})

    while data == nil do
        Wait(0)
    end
	
    return data
end

function GetRoles(user)
	local discordId = nil
	for _, id in ipairs(GetPlayerIdentifiers(user)) do
		if string.match(id, "discord:") then
			discordId = string.gsub(id, "discord:", "")
			break
		end
	end

	if discordId then
		local endpoint = ("guilds/%s/members/%s"):format(Permisije.GuildId, discordId)
		local member = DiscordRequest("GET", endpoint, {})
		if member.code == 200 then
			local data = json.decode(member.data)
			local roles = data.roles
			local found = true
			return roles
		else
			print("An error occured, maybe they arent in the discord? Error: "..member.data)
			return false
		end
	else
		return false
	end
end

function IsRolePresent(user, role)
	local discordId = nil
	for _, id in ipairs(GetPlayerIdentifiers(user)) do
		if string.match(id, "discord:") then
			discordId = string.gsub(id, "discord:", "")
			break
		end
	end

	local theRole = nil
	if type(role) == "number" then
		theRole = tostring(role)
	else
		theRole = Permisije.Roles[role]
	end

	if discordId then
		local endpoint = ("guilds/%s/members/%s"):format(Permisije.GuildId, discordId)
		local member = DiscordRequest("GET", endpoint, {})
		if member.code == 200 then
			local data = json.decode(member.data)
			local roles = data.roles
			local found = true
			for i=1, #roles do
				if roles[i] == theRole then
					--print("Found role")
					return true
				end
			end
			--print("Not found!")
			return false
		else
			--print("An error occured, maybe they arent in the discord? Error: "..member.data)
			return false
		end
	else
		return false
	end
end

CreateThread(function()
	local guild = DiscordRequest("GET", "guilds/"..Permisije.GuildId, {})
	if guild.code == 200 then
		local data = json.decode(guild.data)
	else
		print("[bx_glavna] Greska: "..(guild.data or guild.code)) 
	end
end)

-- Discord Whitelist

notWhitelisted = "SERVER SE RADI,USKORO UP"
noDiscord = "Morate imati uključen diskord, ukoliko imate prvo restartujte Discord, Steam i FiveM"

roles = {
    "WL",
    --"Prolaz",
}

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
    local src = source
    deferrals.defer()
    deferrals.update("Proveravanje dozvola")

    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end

    if identifierDiscord then
        for i = 1, #roles do
            if IsRolePresent(src, roles[i]) then
                deferrals.done()
            else
                deferrals.done(notWhitelisted)
            end
        end
    else
        deferrals.done(noDiscord)
    end
end)
