Config = {}
Config.DrawDistance = 100.0

Config.EnablePlayerManagement = true
Config.EnableMoneyWash = false
Config.MaxInService = -1
Config.Locale = 'es'
 
Config.MissCraft = 15 -- %

Config.Blips = {
    Blip = {
      Pos     = { x = -1821.0, y = -1197.9, z = 14.5 },
      Sprite  = 52,
      Display = 4,
      Scale   = 1.0,
      Colour  = 3,
    }
}

Config.Zones = {
    Cloakroom = {
        Pos   = { x = -1838.4, y = -1180.8, z = 18.19 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 255, g = 187, b = 255 },
        Type  = 27,
    }, 
 
    Vaults = {
        Pos   = { x = -1839.77, y = -1190.3, z = 13.33 },    
        Size  = { x = 1.3, y = 1.3, z = 1.0 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 23, 
    }, 

    VaultsNorte = {
        Pos   = { x = -1842.7, y = -1182.6, z = 18.19 }, 
        Size  = { x = 1.3, y = 1.3, z = 1.0 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 23,
    },

    VaultJefe = {
        Pos = { x = -1838.64, y = -1183.69, z = 13.33},  
        Size  = { x = 1.3, y = 1.3, z = 1.0 },
        Color = { r = 255, g = 144, b = 255 },
        Type  = 23,
    },

    Tienda = {
        Pos   = { x = -1838.15, y = -1187.46, z = 13.33 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 0, b = 0 },
        Type  = 23,
        Items = {
            { name = 'water', label = 'Agua', price = 3 },
            { name = 'barrita_energetica', label = 'Barrita Energetica', price = 3 }, 
            { name = 'beer', label = 'Cerveza', price = 3 },
            { name = 'cafe', label = 'Cafe', price = 3 },  
            { name = 'bjamon', label = 'Bocadillo de Jamón', price = 3 }, 
            { name = 'blomo', label = 'Bocadillo de Lomo', price = 3 },
            { name = 'bolsacacahuetes', label = 'Bolsa de Cacahuetes', price = 3 },  
            { name = 'bolsapatatas', label = 'Bolsa de Patatas', price = 3 },
            { name = 'bolpistache', label = 'Paquete de Pistachos', price = 3 },
            { name = 'bombones', label = 'Caja de Bombones', price = 3 },
            { name = 'burger', label = 'Hamburguesa', price = 3 },
            { name = 'chicles', label = 'Chicle', price = 3 },
            { name = 'chocolate', label = 'Tableta de Chocolate', price = 3 },
            { name = 'cocacola', label = 'Coca Cola', price = 3 },
            { name = 'condones', label = 'Condones', price = 3 },
            { name = 'cupcake', label = 'Magdalena', price = 3 },
            { name = 'fanta', label = 'Fanta', price = 3 },
            { name = 'fries', label = 'Patatas Fritas', price = 3 },
            { name = 'taco', label = 'Taco', price = 3 },
            { name = 'sprite', label = 'Sprite', price = 3 },
            { name = 'chorizo_portuano', label = 'Chorizo Portuano', price = 3 },
            { name = 'chuleta', label = 'Chuleta', price = 3 },
            { name = 'donut', label = 'Donut', price = 3 },
            { name = 'entrecot', label = 'Entrecot', price = 3 },   
            { name = 'juice', label = 'Zumo de frutas', price = 3 },
            { name = 'phone', label = 'Telefono', price = 500 },
            { name = 'pollo', label = 'Pollo', price = 3 },
            { name = 'porcion_pizza', label = 'Porcion Pizza', price = 3 },
            { name = 'powerade', label = 'Powerade', price = 3 },
            { name = 'proteinas', label = 'Batido de Chocolate', price = 3 },
            { name = 'te', label = 'Te', price = 3 },
            { name = 'bread', label = 'Pan', price = 3}
        },
    },

    Tienda2 = {
        Pos   = { x = -1838.32, y = -1185.53, z = 18.22 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 0, b = 0 },
        Type  = 23,
        Items = {
            { name = 'water', label = 'Agua', price = 3 },
            { name = 'barrita_energetica', label = 'Barrita Energetica', price = 3 },   
            { name = 'beer', label = 'Cerveza', price = 3 },
            { name = 'cafe', label = 'Cafe', price = 3 },  
            { name = 'bjamon', label = 'Bocadillo de Jamón', price = 3 }, 
            { name = 'blomo', label = 'Bocadillo de Lomo', price = 3 },
            { name = 'bolsacacahuetes', label = 'Bolsa de Cacahuetes', price = 3 },  
            { name = 'bolsapatatas', label = 'Bolsa de Patatas', price = 3 },
            { name = 'bolpistache', label = 'Paquete de Pistachos', price = 3 },
            { name = 'bombones', label = 'Caja de Bombones', price = 3 },
            { name = 'burger', label = 'Hamburguesa', price = 3 },
            { name = 'chicles', label = 'Chicle', price = 3 },
            { name = 'chocolate', label = 'Tableta de Chocolate', price = 3 },
            { name = 'cocacola', label = 'Coca Cola', price = 3 },
            { name = 'condones', label = 'Condones', price = 3 },
            { name = 'cupcake', label = 'Magdalena', price = 3 },
            { name = 'fanta', label = 'Fanta', price = 3 },
            { name = 'fries', label = 'Patatas Fritas', price = 3 },
            { name = 'taco', label = 'Taco', price = 3 },
            { name = 'sprite', label = 'Sprite', price = 3 },
            { name = 'chorizo_portuano', label = 'Chorizo Portuano', price = 3 },
            { name = 'chuleta', label = 'Chuleta', price = 3 },
            { name = 'donut', label = 'Donut', price = 3 },
            { name = 'entrecot', label = 'Entrecot', price = 3 },   
            { name = 'juice', label = 'Zumo de frutas', price = 3 },
            { name = 'phone', label = 'Telefono', price = 500 },
            { name = 'pollo', label = 'Pollo', price = 3 },
            { name = 'porcion_pizza', label = 'Porcion Pizza', price = 3 },
            { name = 'powerade', label = 'Powerade', price = 3 },
            { name = 'proteinas', label = 'Batido de Chocolate', price = 3 },
            { name = 'te', label = 'Te', price = 3 },
            { name = 'bread', label = 'Pan', price = 3}
        },
    },

    BossActions = {
        Pos   = { x = -1836.83, y = -1175.91, z = 18.22 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 27,
    },
}
  
Config.Uniforms = {
  empleado_outfit = { 
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 83,   ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 11,
        ['pants_1'] = 4,   ['pants_2'] = 4,
        ['shoes_1'] = 1,   ['shoes_2'] = 0,
        ['chain_1'] = 0,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 14,   ['tshirt_2'] = 0,
        ['torso_1'] = 1,    ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 5,
        ['pants_1'] = 0,   ['pants_2'] = 10,
        ['shoes_1'] = 1,    ['shoes_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 0
    },
}}
 