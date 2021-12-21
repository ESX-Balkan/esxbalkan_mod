-- Resource Metadata
fx_version 'cerulean'
game 'gta5'

client_scripts {
	"config.lua",
	"client/functions.lua",
	"client/main.lua"
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"config.lua",
	"server/main.lua",
	"server/functions.lua",
	"server/database.lua"
}
