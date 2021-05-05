fx_version 'adamant'

game 'gta5'

description 'YKZ-AC ykz#0893'

version '0.1'

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config/clientconfig.lua',
	'anti-cliente.lua'
}
server_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config/clientconfig.lua',
	'config/serverconfig.lua',
	'anti-server.lua'
}
