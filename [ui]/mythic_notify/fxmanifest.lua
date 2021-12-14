fx_version 'adamant'
game 'gta5'
name 'Mythic Framework Notification System'
author 'Alzar - https://github.com/Alzar'
version 'v1.1.0'

ui_page {
    'html/ui.html',
}

files {
	'html/ui.html',
	'html/js/app.js', 
	'html/css/style.css',
}

client_scripts {
	'client/main.lua',
}

exports {
	'SendAlert',
	'SendUniqueAlert',
	'PersistentAlert',
}
