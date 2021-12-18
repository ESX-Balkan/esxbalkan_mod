Citizen.CreateThread(function()
	while true do
	SetDiscordAppId(921851620906643567)
	SetDiscordRichPresenceAsset('esx-balkan-logo')
        SetDiscordRichPresenceAssetText('by ESX BALKAN TEAM')
        SetDiscordRichPresenceAssetSmall('esx-balkan-logo')
        SetDiscordRichPresenceAssetSmallText('by ESX BALKAN TEAM')
        SetDiscordRichPresenceAction(0, "Nas Discord!", "https://discord.gg/7SK3fGDeHN")
        SetDiscordRichPresenceAction(1, "Connectaj se!", "fivem://connect/ip:30120")
        SetRichPresence("ID: " .. GetPlayerServerId(PlayerId()) .. " | " .. GlobalState["BrojIgraca"] .. "/" .. GlobalState.brojSlotova)    
	Citizen.Wait(60000)
	end
end)
