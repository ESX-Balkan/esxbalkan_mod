ESX = nil 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


AddEventHandler('entityCreating', function(entity)
    local src = NetworkGetEntityOwner(entity)
    local model = GetEntityModel(entity)
    for _,blacklistedentity in ipairs(Config.Entity) do
        if model == GetHashKey(blacklistedentity) then
            blacklistalog("Spawnanje Objekata 📦", " Igrač  **" ..GetPlayerName(src).. '** je stvorio objekat **'..blacklistedentity.. '**')
            TriggerEvent("bx_ban:banujHackeramrtvog", src)
            CancelEvent()
            break
        end
    end
end)

AddEventHandler("explosionEvent", function(ev)
    if Config.Eksplozije[ev.explosionType] then 
        local a = Config.Eksplozije[ev.explosionType]
        CancelEvent()
        blacklistalog("Eksplozije🔥", " Igrač  **" ..GetPlayerName(source).. '** je napravio ekspolziju **'..a.ime.. '**')
        -- print('pericoooo')
    end
end)

function blacklistalog(name, message)
    local vrijeme = os.date('*t')
    local poruka = {
        {
            ["color"] = 0,--
            ["title"] = "".. name .."",
            ["description"] = message,
        }
      }
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = "Logovi", embeds = poruka, avatar_url = ""}), { ['Content-Type'] = 'application/json' })
  end
  
