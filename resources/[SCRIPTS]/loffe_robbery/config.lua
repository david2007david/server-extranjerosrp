Config = {}
Translation = {}

Config.Shopkeeper = 416176080 -- hash of the shopkeeper ped
Config.Locale = 'en' -- 'en', 'sv' or 'custom'

Config.Shops = {
    -- {coords = vector3(x, y, z), heading = peds heading, money = {min, max}, cops = amount of cops required to rob, blip = true: add blip on map false: don't add blip, name = name of the store (when cops get alarm, blip name etc)}
    {coords = vector3(24.03, -1345.63, 29.5-0.98), heading = 266.0, money = {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(-705.73, -914.91, 19.22-0.98), heading = 91.0, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(-47.04, -1758.8, 29.44-0.98), heading = 42.8, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(1959.44, 3740.96, 32.36-0.98), heading = 296.88, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(1164.92,-323.64, 69.2-0.98), heading = 100.32, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(-1222.0, -908.32, 12.32-0.98), heading = 37.08, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(-2966.32, 391.12, 15.04-0.98), heading = 92.04, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(1134.2, -982.44, 46.4-0.98), heading = 275.36, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(549.32, 2669.68, 42.16-0.98), heading = 87.68, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(2676.6, 3280.24, 55.24-0.98), heading = 338.36, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(1697.84, 4923.04, 42.08-0.98), heading = 319.64, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(1392.88, 3606.44, 35.0-0.98), heading = 197.68, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(-3242.28, 9865.0, 12.84-0.98), heading = 353.48, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(-3040.64, 584.0, 7.92-0.98), heading = 11.96, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(372.92, 328.2, 103.56-0.98), heading = 248.12, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(2555.24, 380.92, 108.64-0.98), heading = 354.56, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(-1486.28, -378.0, 40.16-0.98), heading = 136.92, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false},
    {coords = vector3(1728.64, 6416.8, 35.04-0.98), heading = 238.96, money =  {3456, 9865}, cops = 1, blip = false, name = '24/7', cooldown = {hour = 0, minute = math.random(1, 2), second = 0}, robbed = false}
}



Translation = {
    ['en'] = {
        ['shopkeeper'] = 'Tendero:',
        ['robbed'] = "Ya me han robado, ~r~no ~w~tengo nada",
        ['cashrecieved'] = 'Has recibido: ',
        ['currency'] = '$',
        ['scared'] = 'Asustado:',
        ['no_cops'] = 'No hay policias de servicio suficiente',
        ['cop_msg'] = 'Hemos recibido una alerta de robo en un badulake',
        ['set_waypoint'] = 'Marcar en el gps el robo',
        ['hide_box'] = 'Cierra la caja',
        ['robbery'] = 'Robo en progreso',
        ['walked_too_far'] = 'Te has alejado demasiado'
    },
    ['sv'] = {
        ['shopkeeper'] = 'butiksbiträde',
        ['robbed'] = 'Jag blev precis rånad och har inga pengar kvar!',
        ['cashrecieved'] = 'Du fick:',
        ['currency'] = 'SEK',
        ['scared'] = 'Rädd:',
        ['no_cops'] = 'Det är inte tillräckligt med poliser online!',
        ['cop_msg'] = 'Vi har skickat en bild på rånaren från övervakningskamerorna!',
        ['set_waypoint'] = 'Sätt GPS punkt på butiken',
        ['hide_box'] = 'Stäng denna rutan',
        ['robbery'] = 'Pågående butiksrån',
        ['walked_too_far'] = 'Du gick för långt bort!'
    },
    ['custom'] = { -- edit this to your language
        ['shopkeeper'] = '',
        ['robbed'] = '',
        ['cashrecieved'] = '',
        ['currency'] = '',
        ['scared'] = '',
        ['no_cops'] = '',
        ['cop_msg'] = '',
        ['set_waypoint'] = '',
        ['hide_box'] = '',
        ['robbery'] = '',
        ['walked_too_far'] = ''
    }
}