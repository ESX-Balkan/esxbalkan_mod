Config = {}
Config.Locale = 'en'


Config.Webhook = ""
Config.DrawDistance = 100
Config.Pljackanjepolicija = 3 -- koliko treba policajca za pljacku
Config.Policijazaprodaju = 0 -- koliko treba policajaca za prodaju
Config.MinJewels = 5 -- najmanje koliko moze da se dobije
Config.MaxJewels = 20 -- najvise koliko moze da se dobije
Config.MaxWindows = 20
Config.SecBetwNextRob = 3600 --1 hour
Config.MaxJewelsSell = 20 -- najvise koliko moze da proda jewlesa
Config.PriceForOneJewel = 500 -- cena za 1 jewles
Config.EnableMarker = true -- da enableta marker(true/false)
Config.NeedBag = true -- da li hocete da mora da se koristi torba kako bi se moglo pljackati

Config.Borsoni = {40, 41, 44, 45}

Stores = {
	["jewelry"] = {
		position = { ['x'] = -629.99, ['y'] = -236.542, ['z'] = 38.05 },       
		nameofstore = "jewelry",
		lastrobbed = 0
	}
}