ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esxbalkan_biro:setajPosao')
AddEventHandler('esxbalkan_biro:setajPosao', function(posao, pozicija)
  	  local igrac = ESX.GetPlayerFromId(source)
  	  igrac.setJob(posao, pozicija)
	 igrac.showNotification("Zaposlio si se kao ".. posao)
	  LogoviZaposljavanje("``📝`` ZAPOSLJAVANJE BIRO", "**IGRAC:** ``" .. GetPlayerName(source) .. "``\n**POSAO:** ``" .. posao .."``", 5793266)
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