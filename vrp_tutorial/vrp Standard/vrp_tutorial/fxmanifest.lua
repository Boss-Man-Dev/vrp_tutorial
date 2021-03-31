fx_version 'cerulean'
game 'gta5'

description 'vRP tutorial'
dependency "vrp"

version '0.0.1'

server_script { 
	"@vrp/lib/utils.lua",
	"vrp_server.lua",
}

client_script {
	"@vrp/lib/utils.lua",
	'client.lua',
}

