fx_version 'adamant'

game 'gta5'

description 'ESX Balkan Zone'

version 'legacy'

client_scripts {
    "client.lua"
}

server_scripts {
	"server.lua",
	'@mysql-async/lib/MySQL.lua',
}
