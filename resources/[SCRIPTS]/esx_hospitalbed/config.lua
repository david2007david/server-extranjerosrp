Config = {
    Price = 250,
    ReviveTime = 20, -- seconds until you are revived
    Hospitals = {
        {
            Bed = {coords = vector3(321.11, -567.89, 44.2), heading = 167.00, occupied = false},
            Peds = {
                pedHash = -730659924,
                reception = {coords = vector3(349.5, -587.59, 27.8), heading = 252.18},
                doctor = {coords = vector3(320.36, -567.94, 42.30), heading = 252.93},
            },
        },
    },
}

Strings = {
    ['get_help'] = [[Pulsa %s para ser tratado ~g~$%s]],
    ['not_enough'] = [[No tienes suficiente dinero!]],
    ['getting_help'] = [[Estas recibiendo ayuda, %s segundos restantes!]],
    ['occupied'] = [[La cama esta ocupada! Vuelve mas tarde]]
}