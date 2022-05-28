ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getJobs()
	local jobs = ESX.GetJobs()
	local availableJobs = {}
	for k,v in pairs(jobs) do 
		if v.whitelisted == false then 
			availableJobs[k] = {label = v.label}
		end
	end
	return availableJobs
end

function IsNearCentre(player)
	local Ped = GetPlayerPed(player)
	local PedCoords = GetEntityCoords(Ped)
	local Zones = Config.Zones

	for i=1, #Config.Zones, 1 do
		local distance = #(PedCoords - Config.Biro)

		if distance < 5 then
			return true
		end
	end
end

RegisterServerEvent('esxbalkan_biro:setajPosao')
AddEventHandler('esxbalkan_biro:setajPosao', function(posao, pozicija)
local source = source
local igrac = ESX.GetPlayerFromId(source)
local jobs = getJobs()
	if igrac and IsNearCentre(source) then
		if jobs[posao] then
  	  		igrac.setJob(posao, pozicija)
	 		igrac.showNotification("Zaposlio si se kao ".. posao)
		  	LogoviZaposljavanje("``📝`` ZAPOSLJAVANJE BIRO", "**IGRAC:** ``" .. GetPlayerName(source) .. "``\n**POSAO:** ``" .. posao .."``", 5793266)
		end
	end
end)

function LogoviZaposljavanje(name, message, color)
    local connect = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = "LOGOVI",
              },
          }
      }
    PerformHttpRequest("".. Config.LogoviZaposljavanje .."", function(err, text, headers) end, 'POST', json.encode({username = "LOGOVI", embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
end 
