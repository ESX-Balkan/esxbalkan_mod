fx_version "adamant"
game "gta5"

client_scripts {
    'client/client.lua',
    'config.lua',
    'client/spectate.lua',
    'client/mojid.lua',
}

server_scripts {
    'server/spectate.lua',
    'config.lua',
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
}

shared_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'config.lua'
}

ui_page {
	'ui/index.html'
}

files {
	'ui/index.html',
	'ui/style.css',
	'ui/main.js'
}
