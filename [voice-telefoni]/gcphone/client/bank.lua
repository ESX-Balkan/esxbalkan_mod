local bank = 0
function setBankBalance (value)
      bank = value
      SendNUIMessage({event = 'updateBankbalance', banking = bank})
end

local societyMoney = 0
function setSocietyBalance (value)
      societyMoney = value
      SendNUIMessage({event = 'updateSocietyBalance', society = societyMoney})
end

local name = ""
function setPlayerName (value)
      name = value
      SendNUIMessage({event = 'updatePlayerName', name = name})
end

RegisterNetEvent('crew:getPlayerBank')
AddEventHandler('crew:getPlayerBank', function(playerData, playerName)
    setPlayerName(playerName)
    local accounts = playerData.accounts or {}
    for index, account in ipairs(accounts) do 
        if account.name == 'bank' then
                setBankBalance(account.money)
                break
        end
    end
    if playerData.job.grade_name == "boss" or playerData.job.grade_name == "mudur" or playerData.job.grade_name == "muduryar" then
        ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
            if money then
                setSocietyBalance(money)
            end
        end, playerData.job.name)
    end
end)


RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
    if account.name == 'bank' then
        setBankBalance(account.money)
    end
end)

RegisterNetEvent("es:addedBank")
AddEventHandler("es:addedBank", function(m)
    setBankBalance(bank + m)
end)

RegisterNetEvent("es:removedBank")
AddEventHandler("es:removedBank", function(m)
    setBankBalance(bank - m)
end)

RegisterNetEvent('es:displayBank')
AddEventHandler('es:displayBank', function(bank)
    setBankBalance(bank)
end)

RegisterNetEvent('crew-phone:updata-transfer')
AddEventHandler('crew-phone:updata-transfer', function()
    SendNUIMessage({event = 'updateBankbalance', banking = bank})
end)

RegisterNUICallback('transfer', function(data)
    TriggerServerEvent('gcPhone:transfer', data.to, data.amount)
end)

RegisterNUICallback('checkBank', function()
    ESX.TriggerServerCallback('crew-phone:check-bank', function(cb)
        SendNUIMessage({event = 'updateBankHistory', history = cb})
    end)
end)

function setBankBalance (value)
    bank = value
    SendNUIMessage({event = 'updateBankbalance', banking = bank})
end