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
	WeedField = {coords = vector3(2224.64, 5577.03, 53.85), blimpcoords = vector3(2224.64, 5577.03, 53.85), name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 0, enabled = true},
	WeedProcessing = {coords = vector3(1035.86, -3205.20, -38.17), blimpcoords = vector3(-1127.86, 2708.03, 18.8), name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 0.0, enabled = true},
	
	--meth
	MethProcessing = {coords = vector3(1007.27, -3197.93, -38.99), blimpcoords = vector3(1454.78, -1651.42, 66.99), name = _U('blip_methprocessing'), color = 5, sprite = 51, radius = 0.0, enabled = true},
	HydrochloricAcidFarm = {coords = vector3(2724.12, 1583.03, 24.5), blimpcoords = vector3(2724.12, 1583.03, 24.5), name = _U('blip_HydrochloricAcidFarm'), color = 5, sprite = 51, radius = 0.0, enabled = true},
	SulfuricAcidFarm = {coords = vector3(3333.34, 5160.22, 18.31), blimpcoords = vector3(3333.34, 5160.22, 18.31), name = _U('blip_SulfuricAcidFarm'), color = 5, sprite = 51, radius = 0.0, enabled = true},
	SodiumHydroxideFarm = {coords = vector3(3617.04, 3738.73, 28.69), blimpcoords = vector3(3617.04, 3738.73, 28.69), name = _U('blip_SodiumHydroxideFarm'), color = 5, sprite = 51, radius = 0.0, enabled = true},
	
	--Chemicals
	ChemicalsField = {coords = vector3(817.46, -3192.84, 5.9), blimpcoords = vector3(817.46, -3192.84, 5.9), name = _U('blip_ChemicalsFarm'), color = 3, sprite = 499, radius = 0.0, enabled = true},
	ChemicalsConvertionMenu = {coords = vector3(3718.8, 4533.45, 21.67), blimpcoords = vector3(3718.8, 4533.45, 21.67), name = _U('blip_ChemicalsProcessing'), color = 3, sprite = 499, radius = 0.0, enabled = true},
	
	--Coke
	CokeField = {coords = vector3(-310.43, 2496.34, 76.60), blimpcoords = vector3(-310.43, 2496.34, 76.60), name = _U('blip_CokeFarm'), color = 4, sprite = 501, radius = 0.0, enabled = true},
	CokeProcessing = {coords = vector3(1090.00, -3194.93, -38.99), blimpcoords = vector3(143.66, -1656.21, 29.33), name = _U('blip_Cokeprocessing'),color = 4, sprite = 501, radius = 0.0, enabled = true},
	
	--LSD
	lsdProcessing = {coords = vector3(91.26, 3749.31, 40.77), blimpcoords = vector3(91.26, 3749.31, 40.77), name = _U('blip_lsdprocessing'),color = 12, sprite = 364, radius = 0.0, enabled = true},
	thionylchlorideProcessing = {coords = vector3(1903.98, 4922.70, 48.16), blimpcoords = vector3(1903.98, 4922.70, 48.16), name = _U('blip_thionylchlorideprocessing'),color = 12, sprite = 364, radius = 0.0, enabled = true},
	
	--Heroin
	HeroinField = {coords = vector3(16.34, 6875.94, 12.64), blimpcoords = vector3(16.34, 6875.94, 12.64), name = _U('blip_heroinfield'), color = 7, sprite = 497, radius = 0, enabled = true},
	HeroinProcessing = {coords = vector3(-62.15, 6391.40, 31.49), blimpcoords = vector3(-62.15, 6391.40, 31.49), name = _U('blip_heroinprocessing'), color = 7, sprite = 497, radius = 0.0, enabled = true},

	--DrugDealer
	DrugDealer = {coords = vector3(-1172.02, -1571.98, 4.66), blimpcoords = vector3(-1172.02, -1571.98, 4.66), name = _U('blip_drugdealer'), color = 6, sprite = 378, radius = 0.0, enabled = true},
}
