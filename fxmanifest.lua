fx_version 'cerulean'
game 'gta5'
name 'fex_carhud'
author 'femabeh'
description 'ESX FiveM Car Hud'
version '1.0.0'
repository 'https://github.com/femabeh/fex_carhud'

ui_page 'html/index.html'

shared_scripts {
	'@es_extended/imports.lua',
	'config.lua',
}

client_scripts {
	'client/main.lua',
}

server_scripts {
	'server/main.lua',
}

files {
	'html/index.html',
	'html/img/*',
}
