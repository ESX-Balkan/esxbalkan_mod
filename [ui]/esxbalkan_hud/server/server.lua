ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('trew_hud_ui:getServerInfo')
AddEventHandler('trew_hud_ui:getServerInfo', function()

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer ~= nil then
		local info = {
			money = xPlayer.getMoney(),
			bankMoney = xPlayer.getAccount('bank').money,
			blackMoney = xPlayer.getAccount('black_money').money
		}

		TriggerClientEvent('trew_hud_ui:setInfo', source, info)
	end
end)

RegisterServerEvent('trew_hud_ui:syncCarLights')
AddEventHandler('trew_hud_ui:syncCarLights', function(status)
	TriggerClientEvent('trew_hud_ui:syncCarLights', -1, source, status)
end)

