ESX = nil

local cachedData = {}

TriggerEvent("esx:getSharedObject", function(library) 
	ESX = library 
end)

ESX.RegisterServerCallback("garage:fetchPlayerVehicles", function(source, callback, garage)
	local player = ESX.GetPlayerFromId(source)

	if player then
		local sqlQuery = [[
			SELECT
				plate, vehicle
			FROM
				owned_vehicles
			WHERE
				owner = @cid
		]]

		if garage then
			sqlQuery = [[
				SELECT
					plate, vehicle
				FROM
					owned_vehicles
				WHERE
					owner = @cid and garage = @garage
			]]
		end

		MySQL.Async.fetchAll(sqlQuery, {
			["@cid"] = player["identifier"],
			["@garage"] = garage
		}, function(responses)
			local playerVehicles = {}

			for key, vehicleData in ipairs(responses) do
				table.insert(playerVehicles, {
					["plate"] = vehicleData["plate"],
					["props"] = json.decode(vehicleData["vehicle"])
				})
			end

			callback(playerVehicles)
		end)
	else
		callback(false)
	end
end)

ESX.RegisterServerCallback("garage:validateVehicle", function(source, callback, vehicleProps, garage)
	local player = ESX.GetPlayerFromId(source)

	if player then
		local sqlQuery = [[
			SELECT
				owner
			FROM
				owned_vehicles
			WHERE
				plate = @plate
		]]

		MySQL.Async.fetchAll(sqlQuery, {
			["@plate"] = vehicleProps["plate"]
		}, function(responses)
			if responses[1] then
				UpdateGarage(vehicleProps, garage)

				callback(true)
			else
				callback(false)
			end
		end)
	else
		callback(false)
	end
end)