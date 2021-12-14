Config = {}
Config.Locale = 'en'

Config.Accounts = {
	bank = _U('account_bank'),
	black_money = _U('account_black_money'),
	money = _U('account_money')
}

Config.StartingAccountMoney 	= {bank = 50000} ---početni novac

Config.EnableSocietyPayouts 	= true -- platiti sa računa društva na kojem je igrač zaposlen? Zahtev: esx_society
Config.EnableHud            	= false -- Ako je true imate default hud (black, bank & cash)
Config.MaxWeight            	= 24   -- maksimalna težina inventara bez ranca
Config.PaycheckInterval         = 7 * 60000 -- koliko često primati čekove za plaćanje u milisekundama
Config.EnableDebug              = false -- Da li hocete da koristite debug opciju?
Config.EnableDefaultInventory   = false -- Default inventory ( F2 )
Config.EnableWantedLevel    	= false -- Ako je true onda ce postojati wanted level
Config.EnablePVP                = true -- Da dozvolis pvp izmedju igraca

Config.Multichar                = false --Omogući support za esx_multicharacter
Config.Identity                 = true --Izaberite podatke o identitetu znakova pre nego što se učitaju (ovo se podrazumevano dešava sa multichar)
