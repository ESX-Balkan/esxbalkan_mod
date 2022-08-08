fx_version 'adamant'
game 'gta5'

description 'ESX-Balkan kupovina dozvola za oruzije'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
    'server.lua'
}

client_scripts {
	'config.lua',
	'client.lua'
}
