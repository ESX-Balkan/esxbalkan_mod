Config = {}

Config.AllLogs = false											-- Enable/Disable All Logs Channel
Config.postal = false  											-- set to false if you want to disable nerest postal (https://forum.cfx.re/t/release-postal-code-map-minimap-new-improved-v1-2/147458)
Config.username = "Connected/Discconected" 							-- Bot Username
Config.avatar = ""				-- Bot Avatar
Config.communtiyName = "Logovi"					-- Icon top of the embed
Config.communtiyLogo = ""		-- Icon top of the embed
Config.FooterText = "Logovi"						-- Footer text for the embed
Config.FooterIcon = ""			-- Footer icon for the embed


Config.weaponLog = true  			-- set to false to disable the Pucanje weapon logs
Config.InlineFields = false			-- set to false if you don't want the player details next to each other

Config.playerID = true				-- set to false to disable Player ID in the logs
Config.steamID = true				-- set to false to disable Steam ID in the logs
Config.steamURL = false				-- set to false to disable Steam URL in the logs
Config.discordID = true				-- set to false to disable Discord ID in the logs
Config.license = false				-- set to false to disable license in the logs
Config.IP = true					-- set to false to disable IP in the logs

-- Change color of the default embeds here
-- It used Decimal or Hex color codes. They will both work.
Config.BaseColors ={		-- For more info have a look at the docs: https://docs.preffech.com
	chat = "#A1A1A1",				-- Chat Message
	Ulazi = "#3AF241",				-- Player Connecting
	Izlazi = "#F23A3A",			-- Player Disconnected
	smrti = "#000000",				-- Pucanje a weapon
	Pucanje = "#2E66F2",			-- Player Died
	resources = "#EBEE3F",			-- Resource Stopped/Started	
}


Config.webhooks = {		-- For more info have a look at the docs: https://docs.preffech.com
	all = "DISCORD_WEBHOOK",		-- All logs will be send to this channel
	chat = "",		-- Chat Message
	Ulazi = "",		-- Player Connecting
	Izlazi = "",	-- Player Disconnected
	smrti = "",		-- Pucanje a weapon
	Pucanje = "",	-- Player Died
	resources = "",	-- Resource Stopped/Started	
}

Config.TitleIcon = {		-- For more info have a look at the docs: https://docs.preffech.com
	chat = "💬",				-- Chat Message
	Ulazi = "📥",				-- Player Connecting
	Izlazi = "📤",			-- Player Disconnected
	smrti = "💀",				-- Pucanje a weapon
	Pucanje = "🔫",			-- Player Died
	resources = "🔧",			-- Resource Stopped/Started	
}


 --Debug shizzels :D
Config.debug = false
Config.versionCheck = "1.2.0"


