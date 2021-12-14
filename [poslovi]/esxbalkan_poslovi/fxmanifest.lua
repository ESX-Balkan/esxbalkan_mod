fx_version 'adamant'

game 'gta5'

description 'ESX Jobs'

version '1.1.0'

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',

	'jobs/fisherman.lua',
	'jobs/fueler.lua',
	'jobs/lumberjack.lua',
	'jobs/miner.lua',
	'jobs/reporter.lua',
	'jobs/slaughterer.lua',
	'jobs/tailor.lua',

	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',

	'jobs/fisherman.lua',
	'jobs/fueler.lua',
	'jobs/lumberjack.lua',
	'jobs/miner.lua',
	'jobs/reporter.lua',
	'jobs/slaughterer.lua',
	'jobs/tailor.lua',

	'client/main.lua'
}