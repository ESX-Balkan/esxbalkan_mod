Config = {}

Config.Locale = 'en'

Config.Delays = {
	WeedProcessing = 1000 * 10,
	MethProcessing = 1000 * 10,
	CokeProcessing = 1000 * 10,
	lsdProcessing = 1000 * 10,
	HeroinProcessing = 1000 * 10,
	thionylchlorideProcessing = 1000 * 10,
}

Config.DrugDealerItems = {
	heroin = 546,
	marijuana = 784,
	meth = 1635,
	coke = 1027,
	lsd = 2178,
}

Config.ChemicalsConvertionItems = {
	hydrochloric_acid = 0,
	sodium_hydroxide = 0,
	sulfuric_acid = 0,
	lsa = 0,
}

Config.GiveBlack = true -- da li hocete da date prljav novac

Config.CircleZones = {
	--Weed
	WeedField = {coords = vector3(2224.64, 5577.03, 53.85)},
	WeedProcessing = {coords = vector3(1035.86, -3205.20, -38.17)},
	
	--meth
	MethProcessing = {coords = vector3(1007.27, -3197.93, -38.99)},
	HydrochloricAcidFarm = {coords = vector3(2724.12, 1583.03, 24.5)},
	SulfuricAcidFarm = {coords = vector3(3333.34, 5160.22, 18.31)},
	SodiumHydroxideFarm = {coords = vector3(3617.04, 3738.73, 28.69)},
	
	--Chemicals
	ChemicalsField = {coords = vector3(817.46, -3192.84, 5.9)},
	ChemicalsConvertionMenu = {coords = vector3(3718.8, 4533.45, 21.67)},
	
	--Coke
	CokeField = {coords = vector3(-310.43, 2496.34, 76.60)},
	CokeProcessing = {coords = vector3(1090.00, -3194.93, -38.99)},
	
	--LSD
	lsdProcessing = {coords = vector3(91.26, 3749.31, 40.77)},
	thionylchlorideProcessing = {coords = vector3(1903.98, 4922.70, 48.16)},
	
	--Heroin
	HeroinField = {coords = vector3(16.34, 6875.94, 12.64)},
	HeroinProcessing = {coords = vector3(-62.15, 6391.40, 31.49)},

	--DrugDealer
	DrugDealer = {coords = vector3(-1172.02, -1571.98, 4.66)},
}
