
Config = {}


Config.Webhook = " "
Config.CheckOwnership = false -- Ako je true, samo vlasnik vozila može čuvati stvari u prtljažniku.
Config.AllowPolice = true -- Ako je true policija moze otvarat gepeke drugih

Config.Locale = "en"

Config.OpenKey = 58

-- Ograničenje, jedinica može biti šta god želite. Prvobitno grama (pošto prosečni ljudi mogu da izdrže 25 kg)
Config.Weight = 25000

-- Podrazumevana težina za stavku:
-- težina == 0 : Stavka ne utiče na težinu inventara likova
-- težina > 0 : Stavka troškova stavke na inventar
-- težina < 0 : Stavka dodaje mesto na inventaru. Pametnim ljudima će se svideti.
Config.DefaultWeight = 10

Config.localWeight = {
    bread = 125,
    water = 330,
    WEAPON_SMG = 5000
}

Config.VehicleWeight = {
    [0] = 30000, --Compact
    [1] = 40000, --Sedan
    [2] = 70000, --SUV
    [3] = 25000, --Coupes
    [4] = 30000, --Muscle
    [5] = 10000, --Sports Classics
    [6] = 5000, --Sports
    [7] = 5000, --Super
    [8] = 5000, --Motorcycles
    [9] = 180000, --Off-road
    [10] = 300000, --Industrial
    [11] = 70000, --Utility
    [12] = 100000, --Vans
    [13] = 0, --Cycles
    [14] = 5000, --Boats
    [15] = 2000, --Helicopters
    [16] = 0, --Planes
    [17] = 4000, --Service
    [18] = 4000, --Emergency
    [19] = 0, --Military
    [20] = 30000, --Commercial
    [21] = 0 --Trains
}

Config.VehiclePlate = {
    taxi = "TAXI",
    cop = "LSPD",
    ambulance = "EMS0",
    mecano = "MECA"
}
