Config = {}
-- # vas webhook za logove stavljate ovde
Config.Webhook 						= " "
-- # Jezik na kom ce da  bude skripta
Config.Locale       				= 'en' -- Jezik 

-- # Koliko dobija markera ako pokusa da pobegne
Config.ServiceExtensionOnEscape		= 8

-- # Gde ga teleportuje kad dobija markere
Config.ServiceLocation 				= {x = 481.26, y= 4812.16, z=-59.38}

-- # Gde ga teleportuje kad zavrsi markere
Config.ReleaseLocation				= {x = 427.33, y = -979.51, z = 30.2}


-- # Lokacija ciscenja
Config.ServiceLocations = {
	{ type = "cleaning", coords = vector3(478.64, 4816.47, -58.38) },
	{ type = "cleaning", coords = vector3(482.19, 4819.82, -58.38) },
	{ type = "cleaning", coords = vector3(485.01, 4814.31, -58.38) },
	{ type = "cleaning", coords = vector3(487.59, 4806.19, -58.38) },
	{ type = "cleaning", coords = vector3(486.16, 4797.28, -58.39) },
	{ type = "cleaning", coords = vector3(477.09, 4799.49, -58.39) },
	{ type = "cleaning", coords = vector3(474.24, 4807.30, -58.39) },
	{ type = "cleaning", coords = vector3(473.66, 4819.31, -58.38) },
	{ type = "cleaning", coords = vector3(478.64, 4816.47, -58.38) },
	{ type = "cleaning", coords = vector3(478.48, 4827.12, -58.38) },
	{ type = "cleaning", coords = vector3(487.19, 4826.48, -58.39) },
	{ type = "cleaning", coords = vector3(495.22, 4822.76, -58.40) },
	{ type = "cleaning", coords = vector3(491.42, 4794.91, -58.39) }
}



Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 146, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 119, ['pants_1']  = 3,
			['pants_2']  = 7,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 0,
			['chain_2']  = 0
		},
		female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
			['torso_1']  = 38,  ['torso_2']  = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 120,  ['pants_1'] = 3,
			['pants_2']  = 15,  ['shoes_1']  = 66,
			['shoes_2']  = 5,   ['chain_1']  = 0,
			['chain_2']  = 0
		}
	}
}
