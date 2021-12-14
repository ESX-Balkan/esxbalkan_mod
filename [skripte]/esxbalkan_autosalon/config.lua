Config                            = {}
Config.DrawDistance               = 10
Config.MarkerColor                = {r = 0, g = 220, b = 240}
Config.EnablePlayerManagement     = false -- Ukljuci ako koristis job autosalona
Config.ResellPercentage           = 50

Config.Locale                     = 'en'

Config.LicenseEnable = false -- Ako je false igracu ne treba dozvola za auto,ako je true treba mu kako bi mogao da kupi

-- Izgleda ovako: 'LLL NNN'
-- Maksimalna dužina tablica je 8 znakova (uključujući razmake i simbole), nemojte ići dalje!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {

	ShopEntering = {
		Pos   = vector3(-33.7, -1102.0, 25.5),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = 26
	},

	ShopInside = {
		Pos     = vector3(-47.5, -1097.2, 25.4),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = -20.0,
		Type    = -1
	},

	ShopOutside = {
		Pos     = vector3(-28.6, -1085.6, 25.5),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 330.0,
		Type    = -1
	},

	BossActions = {
		Pos   = vector3(-32.0, -1114.2, 25.4),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	GiveBackVehicle = {
		Pos   = vector3(-18.2, -1078.5, 25.6),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	ResellVehicle = {
		Pos   = vector3(-44.6, -1080.7, 25.6),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = 27
	}

}
