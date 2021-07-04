----------- Authors: Morow
----------- Github:  https://github.com/Morow73

_G.language = "fr"
_G.translation = {}

if IsDuplicityVersion() then
    USE_ESX = true
    
    MMA = {}
    MMA.isFightBlocked = false
    MMA.isFightReady = false
    MMA.random = nil
    MMA.timer = {
        ["beforeStart"] = 1 * 60,
        ["betweenTwoFight"] = 1 * 60000
    }

    MMA.bettor = {
        [1] = {},
        [2] = {}
    }

    MMA.fighter = {
        [1] = {
            cote = 0.0,
            bet = 0
        },
        [2] = {
            cote = 0.0,
            bet = 0
        }
    }

    function MMA:new()
        self.isFightBlocked = false
        self.isFightReady = false
        self.random = nil
        self.bettor = {
            [1] = {},
            [2] = {}
        }
        self.fighter = {
            [1] = {
                cote = 0.0,
                bet = 0
            },
            [2] = {
                cote = 0.0,
                bet = 0
            }
        }
    end
else
    MMA = {}
    MMA.object = {}
    MMA.entity = {}
    MMA.displayTimer = false
    MMA.choise = {
        [1] = {
            model = nil,
            name = nil
        },
        [2] = {
            model = nil,
            name = nil
        }
    }

    MMA.UI = {}
    MMA.UI.display = false

    MMA.set = {
        fighter = {
            [1] = {
                model = {
                    "a_m_y_musclbeac_02"
                },
                position = vector3(-296.08, -1991.94, 30.96),
                heading = 77.61,
                name = {{"Karl"}, {"Amin"}, {"Miguel"}, {"Mike"}, {"Rashad"}, {"Lyoto"}},
                random = math.random(0, 8),
                health = 500
            },
            [2] = {
                model = {
                    "a_m_y_musclbeac_02"
                },
                position = vector3(-293.4473, -1992.72, 30.96),
                heading = 258.96,
                name = {{"Karl"}, {"Amin"}, {"Miguel"}, {"Mike"}, {"Rashad"}, {"Lyoto"}},
                random = math.random(0, 8),
                health = 500
            }
        },
        bookmaker = {
            [1] = {
                position = vector3(-306.35, -2012.15, 29.13),
                heading = 293.96,
                model = "u_m_y_chip"
            },
            [2] = {
                position = vector3(-304.70, -2015.45, 29.13),
                heading = 299.0,
                model = "u_f_y_spyactress"
            }
        },
        interact = vector3(-303.09, -2012.42, 30)
    }

    function MMA:new()
        self.entity = {}
        self.choise = {
            [1] = {
                model = nil,
                name = nil
            },
            [2] = {
                model = nil,
                name = nil
            }
        }
    end
end
