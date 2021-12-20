CreateThread(function()
	while true do
	SetDiscordAppId(879426926421356564) -- id aplikacije koju mozete napraviti na : https://discord.com/developers/applications
	SetDiscordRichPresenceAsset('logo') 
        SetDiscordRichPresenceAssetText('by ESX BALKAN TEAM')
        SetDiscordRichPresenceAssetSmall('logo')
        SetDiscordRichPresenceAssetSmallText('by ESX BALKAN TEAM')
        SetDiscordRichPresenceAction(0, "Nas Discord!", "https://discord.gg/7SK3fGDeHN") 
        SetDiscordRichPresenceAction(1, "Connectaj se!", "fivem://connect/ip:30120") -- vas ip servera:30120 
        SetRichPresence("ID: " .. GetPlayerServerId(PlayerId()) .. " | " .. GlobalState["BrojIgraca"] .. "/" .. GlobalState.brojSlotova)    
	Wait(60000)
	end
end)
