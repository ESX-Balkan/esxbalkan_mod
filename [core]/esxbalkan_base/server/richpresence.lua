GlobalState["BrojIgraca"] = 0

Citizen.CreateThread(function()
    while true do
        local igraci = GetPlayers()
        GlobalState["BrojIgraca"] = #igraci
        Citizen.Wait(5000)
    end
end)

GlobalState.brojSlotova = GetConvar("sv_maxclients", "8")
