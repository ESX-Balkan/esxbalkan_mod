ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('vb-banking:server:GetPlayerName', function(source, cb)
	local _char = ESX.GetPlayerFromId(source)
	local _charname = _char.getName()
	cb(_charname)
end)

RegisterServerEvent('vb-banking:server:depositvb')
AddEventHandler('vb-banking:server:depositvb', function(amount, inMenu)
	local _src = source
	local _char = ESX.GetPlayerFromId(_src)
	amount = tonumber(amount)
	Wait(50)
	if amount == nil or amount <= 0 or amount > _char.getMoney() then
		TriggerClientEvent('chatMessage', _src, "^*^_Nemas toliko novca ili nisi lepo napisao iznos!")
	else
		_char.removeMoney(amount)
		_char.addAccountMoney('bank', tonumber(amount))
		_char.showNotification("Uplatio si $"..amount)
		bankalogovi("Banka Ostavljanje  💵", " Igrač  **" ..GetPlayerName(_src).. '** je ostavio **' ..amount..  '€**' )

	end
end)

RegisterServerEvent('vb-banking:server:withdrawvb')
AddEventHandler('vb-banking:server:withdrawvb', function(amount, inMenu)
	local _src = source
	local _char = ESX.GetPlayerFromId(_src)
	local _base = 0
	amount = tonumber(amount)
	_base = _char.getAccount('bank').money
	Wait(100)
	if amount == nil or amount <= 0 or amount > _base then
		TriggerClientEvent('chatMessage', _src, "Netacna cifra")
	else
		_char.removeAccountMoney('bank', amount)
		_char.addMoney(amount)
		_char.showNotification("Podigao si sa racuna $"..amount)
		bankalogovi("Banka Podizanje  💵", " Igrač  **" ..GetPlayerName(_src).. '** je podigao **' ..amount..  '€**' )
	end
end)

RegisterServerEvent('vb-banking:server:balance')
AddEventHandler('vb-banking:server:balance', function(inMenu)
	local _src = source
	local _char = ESX.GetPlayerFromId(_src)
	local balance = _char.getAccount('bank').money
	TriggerClientEvent('vb-banking:client:refreshbalance', _src, balance)
end)

RegisterServerEvent('vb-banking:server:transfervb')
AddEventHandler('vb-banking:server:transfervb', function(to, amountt, inMenu)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(tonumber(to))
	local balance = 0
	if zPlayer ~= nil then
		balance = xPlayer.getAccount('bank').money
		if tonumber(_source) == tonumber(to) then
			TriggerClientEvent('chatMessage', _source, "Ne mozes da saljes sam sebi!")
		else
			if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
				TriggerClientEvent('chatMessage', _source, "Nemas dovoljno novca na računu!")
			else
				xPlayer.removeAccountMoney('bank', tonumber(amountt))
				zPlayer.addAccountMoney('bank', tonumber(amountt))
				
				zPlayer.showNotification("Primili ste novac "..amountt.."$ sa racuna: ".._source)
				xPlayer.showNotification("Poslali ste novac "..amountt.."$ na račun ID: "..to)
				bankalogovi("Banka Transfer  💵", " Igrač  **" ..GetPlayerName(_source).. '** je poslao  **' ..  tonumber(amountt)  ..   "€**   igraču**  "     ..   GetPlayerName(to)  .. "   ".."**")

			end
		end
	else
		TriggerClientEvent('chatMessage', _source, "Neispravan broj racuna")
	end
end)

function bankalogovi(name, message)
    local vrijeme = os.date('*t')
    local poruka = {
        {
            ["color"] = 56108,
            ["title"] = "".. name .."",
            ["description"] = message,
			["footer"]=  {
				["text"]= "ESX Balkan",
			}
        }
      }
    PerformHttpRequest(Config.Logovi, function(err, text, headers) end, 'POST', json.encode({username = "Logovi", embeds = poruka, avatar_url = ""}), { ['Content-Type'] = 'application/json' })
end
