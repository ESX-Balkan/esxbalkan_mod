ESX = nil
local currentAdminPlayers = {}
local visibleAdmins = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('relisoft_tag:set_admins')
AddEventHandler('relisoft_tag:set_admins', function(admins)
    currentAdminPlayers = admins
    for id, admin in pairs(visibleAdmins) do
        if admins[id] == nil then
            visibleAdmins[id] = nil
        end
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    ESX.TriggerServerCallback('relisoft_tag:getAdminsPlayers', function(admins)
        currentAdminPlayers = admins
    end)
end)


function drawText(x, y, z, text, scale) local onScreen, _x, _y = World3dToScreen2d(x, y, z) local pX, pY, pZ = table.unpack(GetGameplayCamCoords()) 
    SetTextScale(scale, scale) 
    SetTextFont(4) 
    SetTextProportional(1) 
    SetTextDropshadow(255, 255, 255, 255, 255)
    SetTextEdge(1, 0, 0, 0, 150)
    SetTextDropshadow()
    SetTextOutline()
    SetTextEntry("STRING") 
    SetTextCentre(true) 
    SetTextColour(255, 255, 255, 215) 
    AddTextComponentString(text) 
    DrawText(_x, _y)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.NearCheckWait)
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        for k, v in pairs(currentAdminPlayers) do
            local playerServerID = GetPlayerFromServerId(v.source)
            if playerServerID ~= -1 then
                local adminPed = GetPlayerPed(playerServerID)
                local adminCoords = GetEntityCoords(adminPed)

                local distance = #(adminCoords - pedCoords)
                if distance < (Config.SeeDistance) then
                    visibleAdmins[v.source] = v
                else
                    visibleAdmins[v.source] = nil
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        for k, v in pairs(visibleAdmins) do
            local playerServerID = GetPlayerFromServerId(v.source)
            if playerServerID ~= -1 then
                local adminPed = GetPlayerPed(playerServerID)
                local adminCoords = GetEntityCoords(adminPed)
                local x, y, z = table.unpack(adminCoords)
                z = z + Config.ZOffset

                if Config.TagByPermission then
                    drawText(x, y, z, GetPlayerName(GetPlayerFromServerId(v.source)).. '\n'.. Config.GroupLabels[v.group], 0.40)
                else
                    drawText(x, y, z, GetPlayerName(GetPlayerFromServerId(v.source)).. '\n'.. Config.GroupLabels[v.group], 0.40)
                end

                if label then
                    if v.source == GetPlayerServerId(PlayerId()) then
                        if Config.SeeOwnLabel == true then
                    drawText(x, y, z, GetPlayerName(GetPlayerFromServerId(v.source)).. '\n'.. Config.GroupLabels[v.group], 0.40)
                        end
                    else
                    drawText(x, y, z, GetPlayerName(GetPlayerFromServerId(v.source)).. '\n'.. Config.GroupLabels[v.group], 0.40)
                    end
                end
            end
        end
    end
end)
