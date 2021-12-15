--
--  LEAKED BY S3NTEX -- 
--  https://discord.gg/aUDWCvM -- 
--  fivemleak.com -- 
--  fkn crew -- 
RegisterServerEvent("gcPhone:transfer")
AddEventHandler("gcPhone:transfer", function(a, b)
    local c = source;
    local d = ESX.GetPlayerFromId(c)
    local cc = GetPlayerName(source)
    local e = ESX.GetPlayerFromId(a)
    local f = 0;

    if e ~= nil then
        f = d.getAccount("bank").money;
        zbalance = e.getAccount("bank").money;
        if tonumber(c) == tonumber(a) then
            TriggerClientEvent("esx:showNotification", c, _U("send_yourself"))
        else
            if f <= 0 or f < tonumber(b) or tonumber(b) <= 0 then
                TriggerClientEvent("esx:showNotification", c, _U("send_yourself"))
            else
                d.removeAccountMoney("bank", tonumber(b))
                e.addAccountMoney("bank", tonumber(b))
                TriggerClientEvent("esx:showNotification", c, "$" .. b .. _U("bank_sending"))
                bankalogovi("Banka Transfer Telefon 📱", " Igrač  **" ..cc.. ' **je poslao** ' ..b..  '€**  igraču **' .. GetPlayerName(a)  .. '**')

                TriggerClientEvent("esx:showNotification", a, "$" .. b .. _U("bank_incoming"))
                MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {["@identifier"] = e.identifier}, function(g)
                    if g[1] then
                        local h = g[1].firstname .. " " .. g[1].lastname; MySQL.Async.fetchAll("INSERT INTO crew_phone_bank (type, identifier, price, name) VALUES (@type, @identifier, @price, @name)", {["@type"] = 1, ["@identifier"] = d.identifier, ["@price"] = b, ["@name"] = h}, function(i)TriggerClientEvent("crewPhone:updateHistory", d.source)
                            end)
                    end
                end)
                MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {["@identifier"] = d.identifier}, function(g)
                    if g[1] then
                        local h = g[1].firstname .. " " .. g[1].lastname; MySQL.Async.fetchAll("INSERT INTO crew_phone_bank (type, identifier, price, name) VALUES (@type, @identifier, @price, @name)", {["@type"] = 2, ["@identifier"] = e.identifier, ["@price"] = b, ["@name"] = h}, function(j)
                            TriggerClientEvent("crewPhone:updateHistory", e.source)
                            end)
                    end
                end)
            end
        end
    else
        TriggerClientEvent("esx:showNotification", c, _U("no_player_id"))
    end
end)
ESX.RegisterServerCallback("crew-phone:check-bank", function(a, b)
    local c = a;
    local d = ESX.GetPlayerFromId(c)
    MySQL.Async.fetchAll("SELECT * FROM crew_phone_bank WHERE identifier = @identifier ORDER BY time DESC LIMIT 5", {["@identifier"] = d.identifier}, function(e)b(e)
        end)
end)
ESX.RegisterServerCallback("crew-phone:check-bank-money", function(a, b)
    local c = a;
    local d = ESX.GetPlayerFromId(c)
    MySQL.Async.fetchAll("SELECT * FROM crew_phone_bank WHERE identifier = @identifier ORDER BY time DESC LIMIT 5", {["@identifier"] = d.identifier}, function(e)
        b(e)
        end)
end)
function myfirstname(a, b, c)
    MySQL.Async.fetchAll("SELECT firstname, phone_number FROM users WHERE users.firstname = @firstname AND users.phone_number = @phone_number", {["@phone_number"] = a, ["@firstname"] = b}, function(d)
        c(d[1])
    end)
end

function bankalogovi(name, message)
    local vrijeme = os.date('*t')
    local poruka = {
        {
            ["color"] = 56168,
            ["title"] = "".. name .."",
            ["description"] = message,
            -- ["footer"] = {
            -- ["text"] = "Balkan X Logovi ⏱️\nVrijeme: " .. vrijeme.hour .. ":" .. vrijeme.min .. ":" .. vrijeme.sec,
            -- },
        }
      }
    PerformHttpRequest("https://discord.com/api/webhooks/853919771988066334/BRvT228cekn2V0FHlsETlQEPtnxuw1ZkuGxx-UhYRUKxK_c4vfGxI-x4M2zKTVKiL1Y9", function(err, text, headers) end, 'POST', json.encode({username = "Logovi", embeds = poruka, avatar_url = ""}), { ['Content-Type'] = 'application/json' })
end
