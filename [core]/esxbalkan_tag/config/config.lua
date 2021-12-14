Config = {}
Config.SeeOwnLabel = true
Config.SeeDistance = 30
Config.TextSize = 0.5
Config.ZOffset = 1.35
Config.NearCheckWait = 3000
Config.TagByPermission = false --Koriscenje xPlayer.getPermissions() je metoda sa starog ESX-A
Config.GroupLabels = {
    helper = "HELPER",
    mod = "~w~[~p~MODERATOR~w~]~h~",
    admin = "~w~[~g~ADMIN~w~]~h~",
    superadmin = "~w~[~y~DEVELOPER~w~]~h~",
}

Config.PermissionLabels = {
    [1] = "HELPER",
    [2] = "~p~[MODERATOR] ",
    [3] = "~g~[ADMIN] ",
    [4] = "~Y~[SUPERADMIN] ",
    [5] = "~Y~[SUPERADMIN] ",
}
