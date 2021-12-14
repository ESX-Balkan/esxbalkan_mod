Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(908862004184358942)
		SetDiscordRichPresenceAsset('esx-balkan-logo')
        SetDiscordRichPresenceAssetText('by ESX BALKAN TEAM')
        SetDiscordRichPresenceAssetSmall('esx-balkan-logo')
        SetDiscordRichPresenceAssetSmallText('by ESX BALKAN TEAM')
        SetDiscordRichPresenceAction(0, "Nas Discord!", "https://discord.gg/7SK3fGDeHN")
        SetDiscordRichPresenceAction(1, "Connectaj se!", "fivem://connect/178.33.34.113:30120")
        SetRichPresence("ID: " .. GetPlayerServerId(PlayerId()) .. " | " .. #GetActivePlayers() .. "/8")    
		Citizen.Wait(60000)
	end
end)