fx_version 'adamant'
game 'gta5'
author 'ESX BALKAN DEVELOPMENT TEAM'
description 'Skripta koja je srce servera'
version '0.0.1'

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    '@es_extended/locale.lua',  
    'locales/en.lua',  	
	'config.lua',
    'server/antiafk.lua',
    'server/cron.lua',
    'server/proveri-rank.lua',
    'server/richpresence.lua',
}


client_scripts {
    '@es_extended/locale.lua',	
	'config.lua',
    'locales/en.lua',
    'client/richpresence.lua',
    'client/anti-sitemi.lua',
    'client/estetika.lua',
    'client/finger-cucenje-ruke.lua',
    'client/admin-id.lua',
    'client/cron.lua',
} 

