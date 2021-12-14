UpdateGarage = function(vehicleProps, newGarage)
	local sqlQuery = [[
		UPDATE
			owned_vehicles
		SET
			garage = @garage, vehicle = @newVehicle
		WHERE
			plate = @plate
	]]

	MySQL.Async.execute(sqlQuery, {
		["@plate"] = vehicleProps["plate"],
		["@garage"] = newGarage,
		["@newVehicle"] = json.encode(vehicleProps)
	}, function(rowsChanged)
		if rowsChanged > 0 then
			
		end
	end)
end