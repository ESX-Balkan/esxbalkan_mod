Config = {}
Config.Webhook = ""
Config.Locale = 'en'
Config.onDutyCooldown = 0 --seconds
Config.SeeOwnLabel = true
Config.SeeDistance = 100
Config.TextSize = 0.6
Config.ZOffset = 1.0
Config.NearCheckWait = 500
Config.TagByPermission = false --Using xPlayer.getPermissions() which is deprecated method for old ESX
Config.GroupLabels = {
    helper = "HELPER",
    mod = "~g~MODERATOR",
    admin = "~b~ADMINISTRATOR",
    superadmin = "~r~GOD",
}

Config.PermissionLabels = {
    [1] = "HELPER",
    [2] = "~g~MODERATOR",
    [3] = "~b~ADMINISTRATOR",
    [4] = "~r~GOD",
    [5] = "~r~GOD",
}



Config.Admin = {
    superadmin = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 10,
            ['torso_1'] = 287,   ['torso_2'] = 10,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 3,
            ['pants_1'] = 114,   ['pants_2'] = 10,
            ['shoes_1'] = 78,   ['shoes_2'] = 10,
            ['helmet_1'] = -1,  ['helmet_2'] = 10,
            ['mask_1'] = 135,  ['mask_2'] = 10,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
            ['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 300,   ['torso_2'] = 2,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 8,
            ['pants_1'] = 121,   ['pants_2'] = 2,
            ['shoes_1'] = 82,   ['shoes_2'] = 2,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 153,  ['mask_2'] = 2,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
            ['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
    },
    admin = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 5,
            ['torso_1'] = 287,   ['torso_2'] = 5,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 3,
            ['pants_1'] = 114,   ['pants_2'] = 5,
            ['shoes_1'] = 78,   ['shoes_2'] = 5,
            ['helmet_1'] = -1,  ['helmet_2'] = 5,
            ['mask_1'] = 135,  ['mask_2'] = 5,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
            ['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 300,   ['torso_2'] = 2,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 8,
            ['pants_1'] = 121,   ['pants_2'] = 2,
            ['shoes_1'] = 82,   ['shoes_2'] = 2,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 153,  ['mask_2'] = 2,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
            ['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
    },

    mod = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 287,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 3,
            ['pants_1'] = 114,   ['pants_2'] = 0,
            ['shoes_1'] = 78,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 135,  ['mask_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
            ['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 300,   ['torso_2'] = 2,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 8,
            ['pants_1'] = 121,   ['pants_2'] = 2,
            ['shoes_1'] = 82,   ['shoes_2'] = 2,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 153,  ['mask_2'] = 2,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
            ['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
    }
}

Config.reportCooldown = 60 --seconds
Config.warnMax = 3  --how many warn player can get before getting kicked?
Config.adminRanks = { -- change this as your server ranking ( default are : superadmin | admin | moderator )
				'superadmin',
				'admin',
                'mod',
            }