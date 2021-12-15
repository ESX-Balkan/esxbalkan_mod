Config = {}
Translation = {}


Config.Webhook = ""
Config.Shopkeeper = 0x18CE57D0 -- hash of the shopkeeper ped
Config.Locale = 'en' -- 'en', 'sv' or 'custom'

Config.Shops = {
    -- {coords = vector3(x, y, z), heading = peds heading, money = {min, max}, cops = amount of cops required to rob, blip = true: add blip on map false: don't add blip, name = name of the store (when cops get alarm, blip name etc)}
    {coords = vector3(24.03, -1345.63, 29.5-0.98), heading = 266.0, money = {5000, 15000}, cops = 0, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-705.73, -914.91, 19.22-0.98), heading = 91.0, money = {7500, 20000}, cops = 0, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false}

}

Translation = {
    ['en'] = {
        ['shopkeeper'] = 'Prodavac',
        ['robbed'] = "Upravo su me opljačkali i ~r~nemam ~w~vise para",
        ['cashrecieved'] = 'Dobio si:',
        ['currency'] = '$',
        ['scared'] = 'Uplasen:',
        ['no_cops'] = 'Nema ~r~trenutno~w~ policajaca u gradu!',
        ['cop_msg'] = 'Poslali smo fotografiju razbojnika koju je napravila CCTV kamera!',
        ['set_waypoint'] = 'Postavite waypoint do prodavnice',
        ['hide_box'] = 'Zatvorite ovu kutiju',
        ['robbery'] = 'Pljacka je u toku',
        ['walked_too_far'] = 'Previše si otišao!'
    }
}