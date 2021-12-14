author 'Prefech'
description 'FXServer logs to Discord (https://prefech.com/)'
version '1.2.0'
url 'https://prefech.com'

-- Config
server_script 'config.lua'

-- Server Scripts
server_script 'server/server.lua'

--Client Scripts
client_script 'client/client.lua'

file 'postals.json'
postal_file 'postals.json'
file 'version.json'

game 'gta5'
fx_version 'cerulean'

