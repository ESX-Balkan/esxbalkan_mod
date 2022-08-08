fx_version 'adamant'
game 'gta5'
version '1.2.1'


server_scripts {
  "@async/async.lua",
  "@oxmysql/lib/MySQL.lua",
  "@es_extended/locale.lua",
  "locales/en.lua",
  "config.lua",
  "server/classes/c_trunk.lua",
  "server/trunk.lua",
  "server/esx_trunk-sv.lua"
}

client_scripts {
  "@es_extended/locale.lua",
  "locales/en.lua",
  "config.lua",
  "client/esx_trunk-cl.lua"
}

