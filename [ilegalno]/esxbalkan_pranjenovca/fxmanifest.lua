fx_version 'cerulean'

game 'gta5'

client_scripts {
	'@es_extended/locale.lua',
	'client/main.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
  	'server/server.lua',
}

shared_scripts {
	'config.lua'
}

