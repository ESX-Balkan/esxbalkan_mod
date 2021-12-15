GlobalState["BrojIgraca"] = 0

CreateThread(function()
    while true do
        local igraci = GetPlayers()
        GlobalState["BrojIgraca"] = #igraci
        Wait(10000)
    end
end)

GlobalState.brojSlotova = GetConvar("sv_maxclients", "8")
