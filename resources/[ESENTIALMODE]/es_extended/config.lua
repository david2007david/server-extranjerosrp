Config                      = {}
Config.Locale               = 'fr'

Config.Accounts             = { 'bank', 'black_money', 'ca_coins' }
Config.AccountLabels        = { bank = _U('bank'), black_money = _U('black_money'), ca_coins = "CA Coins" }

Config.EnableSocietyPayouts = false -- pay from the society account that the player is employed at? Requirement: esx_society
Config.DisableWantedLevel   = true
Config.EnableHud            = false -- enable the default hud? Display current job and accounts (black, bank & cash)

Config.PaycheckInterval     = 25 * 60000

Config.EnableDebug          = false
