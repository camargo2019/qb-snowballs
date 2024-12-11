fx_version 'cerulean'
game 'gta5'

author 'Gabriel Camargo <git@camargo2019>'
description 'Making snowballs in snowy weather'
version '1.0.0'

client_scripts {
    'config.lua',
    'client-side/*.lua'
}

server_scripts {
    'config.lua',
    'server-side/*.lua'
}

dependencies {
    'qb-target'
}