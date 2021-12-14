fx_version 'adamant'
game 'gta5'


resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Balkan X HUd by Mina #1596'

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/main.css',
	'html/app.js',

	'html/img/vehicle-gear.png',
	'html/img/vehicle-lights.png',
	'html/img/vehicle-lights-high.png',
	'html/img/vehicle-seatbelt.png',

	'html/img/weapon-bullets.png',

	'html/sounds/seatbelt-buckle.ogg',
	'html/sounds/seatbelt-unbuckle.ogg',

	'html/sounds/car-indicators.ogg',
}

client_scripts {
	'config.lua',
	'client/client.lua',
}

server_scripts {
	'config.lua',
	-- 'server/server.lua'
}