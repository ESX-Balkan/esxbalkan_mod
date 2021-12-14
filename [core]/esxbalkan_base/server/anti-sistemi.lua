----------------SERVER SIDE PROVJERE-------------
local ukljuciantisuperjump = true
local antimodifikacijaoruzija = true
local antinevidljivost = false -- vjerovatno broken..
CreateThread(function()
    while true do
        Wait(3000)
        for k, v in pairs(GetPlayers()) do
            local getajpeda = GetPlayerPed(v)
            if getajpeda ~= 0 then
                local modifikacija1 = GetPlayerWeaponDamageModifier(v)
                local modifikacijadefenca1 = GetPlayerWeaponDefenseModifier(v)
                local modifikacijazastite2 = GetPlayerWeaponDefenseModifier_2(v)
                local modifikacijamelee = GetPlayerMeleeWeaponDamageModifier(v)
                local jeliskacesuperjump = IsPlayerUsingSuperJump(v)
                local jelinevidljiv = IsEntityVisible(getajpeda)
                if jelinevidljiv and antinevidljivost then
                    local src = tonumber(v)
                    print("(" .. GetPlayerName(src) .. ") je pokusao da cheatuje i da koristi Nevidljivost!")
                    DropPlayer(src, 'Zasto koristis Nevidljivost?? Cheateru!')
                end
                if jeliskacesuperjump and ukljuciantisuperjump then
                    local src = tonumber(v)
                    print("(" .. GetPlayerName(src) .. ") je pokusao da cheatuje i koristi superjump!")
                    DropPlayer(src, 'Zasto koristis SuperJump?? Cheateru!')
                end
                    if modifikacija1 > 1.0 or modifikacijadefenca1 > 1.0 or modifikacijazastite2 > 1.0 or modifikacijamelee > 1.0 and antimodifikacijaoruzija then
                    --OVDJE IZBACUJEMO IGRACA... MOZETE DODATI BAN...
                    local src = tonumber(v)
                    print("(" .. GetPlayerName(src) .. ") je pokusao da cheatuje i modificira oruzije!")
                    DropPlayer(src, 'Zasto cheatujes oruzija?')
                end
            end
        end
    end
end)

