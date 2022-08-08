ESX = nil

CreateThread(function()
	while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(0) end
end)

local pozoviServer = TriggerServerEvent
local pozoviClient = TriggerEvent

-- PRVA VRATA MRTVA
exports['qtarget']:AddBoxZone("GlavnaVrataPrva", vector3(257.0361, 220.28475, 105.96898), 1.25, 1.25, {
	name="GlavnaVrataPrva",
	heading= 344.04281,
	debugPoly=false,
	minZ=105.87871,
	maxZ=110.97871,
	}, {
		options = {
			{
				event = "esxGlavna:thermal",
				icon = "fas fa-bomb",
				label = "Istopi Vrata",
			},
			{
				event = "esxGlavna:pokreniLockPick",
				icon = "fas fa-key",
				label = "Lockpickaj Vrata",
			},

		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("PrviPanel", vector3(262.34487, 223.0867, 106.13586), 0.50, 0.50, {
	name="PrviPanel",
	heading= 267.95248, 
	debugPoly=false,
	minZ=103.87871,
	maxZ=108.97871,
	}, {
		options = {
			{
				event = "esxGlavna:mrtvoHakovanje",
				icon = "fas fa-user-secret",
				label = "Hakuj Panel",
			},

		},
		distance = 2.5
})

exports['qtarget']:AddBoxZone("DrugiPanel", vector3(252.9168, 228.5272, 102.0883), 0.50, 0.50, {
	name="DrugiPanel",
	heading= 267.95248, 
	debugPoly=false,
	minZ=100.87871,
	maxZ=104.97871,
	}, {
		options = {
			{
				event = "esxGlavna:mrtvoHakovanje2",
				icon = "fas fa-user-secret",
				label = "Hakuj Panel",
			},

		},
		distance = 2.5
})

exports['qtarget']:AddBoxZone("TreciPanel", vector3(272.19503, 231.56225, 97.59172), 0.50, 0.50, {
	name="TreciPanel",
	heading= 335.43719, 
	debugPoly=false,
	minZ=95.87871,
	maxZ=105.97871,
	}, {
		options = {
			{
				event = "esxGlavna:mrtvoHakovanje3",
				icon = "fas fa-user-secret",
				label = "Hakuj Panel",
			},

		},
		distance = 2.5
})


local keypadHash = {
    623406777,
}

exports['qtarget']:AddTargetModel(keypadHash, {
    options = {
        {
            event = "esxGlavna:hakujKeypad",
            icon = "fas fa-user-secret",
            label = "Hakuj Keypad",
        },
    },
    distance = 2.5
}) 


exports['qtarget']:AddBoxZone("vratausefu", vector3(252.55432, 220.74447, 101.40464), 1.25, 1.25, {
	name="vratausefu",
	heading= 160.02145,
	debugPoly=false,
	minZ=100.87871,
	maxZ=106.97871,
	}, {
		options = {
			{
				event = "esxGlavna:thermal2",
				icon = "fas fa-bomb",
				label = "Istopi Vrata",
			},

		},
		distance = 3.5
})



exports['qtarget']:AddBoxZone("dajSifruLaseraNajjace", vector3(240.75105, 210.68231, 110.18274), 1.5, 1.5, {
	name="dajSifruLaseraNajjace",
	heading= 99.928199,
	debugPoly=false,
	minZ=107.87871,
	maxZ=112.97871,
	}, {
		options = {
			{
				event = "esxGlavna:preuzmiIsusovBlagoslav",
				icon = "fas fa-key",
				label = "Preuzmi Sigurnosni Kljuc",
			},

		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("ugasiLasere", vector3(265.7846, 220.24725, 101.61069), 1.5, 1.5, {
	name="ugasiLasere",
	heading= 267.53677,
	debugPoly=false,
	minZ=99.87871,
	maxZ=112.97871,
	}, {
		options = {
			{
				event = "esxGlavna:ugasiLasere",
				icon = "fas fa-user-secret",
				label = "Ugasi Lasere",
			},

		},
		distance = 3.5
})


exports['qtarget']:AddBoxZone("busenje2", vector3(266.28347, 213.9367, 101.68371), 1.5, 1.5, {
	name="busenje2",
	heading= 252.85983,
	debugPoly=false,
	minZ=100.87871,
	maxZ=106.97871,
	}, {
		options = {
			{
				event = "esxGlavna:ormaricUpperVault",
				icon = "fas fa-hdd",
				label = "Provali u Sef",
			},

		},
		distance = 3.5
})



exports['qtarget']:AddBoxZone("generirajBoga", vector3(279.64794, 230.18031, 97.95832), 1.5, 1.5, {
	name="generirajBoga",
	heading=  141.9156,
	debugPoly=false,
	minZ=95.87871,
	maxZ=105.97871,
	}, {
		options = {
			{
				event = "esxGlavna:generisiKodLowerVault",
				icon = "fas fa-user-secret",
				label = "Generisi Kod",
			},

		},
		distance = 3.5
})


local propara = {
	GetHashKey('prop_cash_dep_bag_01'),
}

exports['qtarget']:AddTargetModel(propara, {
    options = {
        {
            event = "esxGlavna:lootajProp",
            icon = "fas fa-user-secret",
            label = "Lootaj",
        },
    },
    distance = 2.5
})

local propara2 = {
	-1578700034,
}

exports['qtarget']:AddTargetModel(propara2, {
    options = {
        {
            event = "esxGlavna:bushi",
            icon = "fas fa-user-secret",
            label = "Izbusi Sef",
        },
    },
    distance = 2.5
})


exports['qtarget']:AddBoxZone("dolebomba", vector3(304.10113, 230.87936, 97.688125), 1.25, 1.25, {
	name="dolebomba",
	heading= 349,
	debugPoly=false,
	minZ=93.87871,
	maxZ=101.97871,
	}, {
		options = {
			{
				event = "esxGlavna:postaviC4",
				icon = "fas fa-bomb",
				label = "Postavi C4",
			},

		},
		distance = 3.5
})