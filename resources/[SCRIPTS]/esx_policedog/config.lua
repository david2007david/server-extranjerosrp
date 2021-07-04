-- TriggerEvent('esx_policedog:openMenu') to open menu

Config = {
    Job = 'police',
    Command = 'policedog', -- set to false if you dont want to have a command
    Model = 351016938,
    TpDistance = 50.0,
    Sit = {
        dict = 'creatures@rottweiler@amb@world_dog_sitting@base',
        anim = 'base'
    },
    Drugs = {'crack', 'coke', 'cannabinoid','cannabis', 'spice', 'marijuana'}, -- add all drugs here for the dog to detect
}

Strings = {
    ['not_police'] = 'Usted ~r~no ~s~es un oficial!',
    ['menu_title'] = 'Perro policía',
    ['take_out_remove'] = 'Sacar / quitar perro policía',
    ['deleted_dog'] = 'Eliminado el perro policía',
    ['spawned_dog'] = 'Creó un perro policía',
    ['sit_stand'] = 'Hacer que el perro se siente / se pare',
    ['no_dog'] = "No tienes perro!",
    ['dog_dead'] = 'Tu perro esta muerto :/',
    ['search_drugs'] = 'Buscar al jugador más cercano para las drogas',
    ['no_drugs'] = 'No se encontraron drogas.', 
    ['drugs_found'] = 'Drogas encontradas',
    ['dog_too_far'] = 'El perro esta muy lejos!',
    ['attack_closest'] = 'Atacar al jugador más cercano',
    ['get_in_out'] = 'Entrar / salir del vehículo'
}