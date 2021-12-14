
weaponblacklist = {
	"WEAPON_MINIGUN",
        "weapon_bottle",
        "weapon_hammer",
        "weapon_hachet",
        "weapon_battleaxe",
        "weapon_poolcue",
        "weapon_stone_hatchet",
        "weapon_pistol_mk2",
        "weapon_snspistol_mk2",
        "weapon_marksmanpistol",
        "weapon_revolver",
        "weapon_revolver_mk2",
        "weapon_doubleaction",
        "weapon_ceramicpistol",
        "weapon_raypistol",
        "weapon_navyrevolver",
        "weapon_smg_mk2",
        "weapon_machinepistol",
        "weapon_raycarbine",
        "weapon_pumpshotgun_mk2",
        "weapon_dbshotgun",
        "weapon_assaultrifle_mk2",
        "weapon_carbinerifle_mk2",
        "weapon_specialcarbine_mk2",
        "weapon_bullpuprifle_mk2",
        "weapon_combatmg_mk2",
        "weapon_sniperrifle",
        "weapon_heavysniper",
        "weapon_heavysniper_mk2",
        "weapon_marksmanrifle",
        "weapon_marksmanrifle_mk2",
        "weapon_rpg",
        "weapon_grenadelauncher",
        "weapon_grenadelauncher_smoke",
        "weapon_railgun",
        "weapon_hominglauncher",
        "weapon_compactlauncher",
        "weapon_rayminigun",
        "weapon_grenade",
        "weapon_molotov",
        "weapon_stickybomb",
        "weapon_proxmine",
        "weapon_pipebomb",
        "weapon_smokegranade",
        "weapon_fireextinguisher",


}

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(3000)

		playerPed = PlayerPedId()
		if playerPed then
			nothing, weapon = GetCurrentPedWeapon(playerPed, true)

			if disableallweapons then
				RemoveAllPedWeapons(playerPed, true)
			else
				if isWeaponBlacklisted(weapon) then
					RemoveWeaponFromPed(playerPed, weapon)
                                        TriggerEvent('x_notify:sendNotification', 'fas fa-times', 'Oruzje je blacklistovano!', 1000)
				end
			end
		end
	end
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(weaponblacklist) do
		if model == GetHashKey(blacklistedWeapon) then
                return true
	      end
	end
     return false
end


