local PlayerData = {}
local wait = 1000
local newsMenu = Config.newsBlip

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

CreateThread(function()

    local blip = AddBlipForCoord(newsMenu)
    SetBlipSprite (blip, 135)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.6)
    SetBlipColour (blip, 3)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Radio televizija")
    EndTextCommandSetBlipName(blip)
	
end)



CreateThread(function()
    while true do
        Wait(wait)
        PlayerData = ESX.GetPlayerData()
        if PlayerData.job.name == Config.newsJobName then 
            local playerPed = PlayerPedId()
            local playerPedCords = GetEntityCoords(playerPed)
            local distance = #(playerPedCords - newsMenu)
            if distance < 5.0 then
                wait = 10
                DrawMarker(1, newsMenu, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0,0, 100, false, true, 2, false, false, false, false)
                if distance < 2.0 then
                    DrawText3D(newsMenu.x, newsMenu.y, newsMenu.z+0.60, "[E] RTS", 0.45)
                    if IsControlJustPressed(1, 38) then
                        
                        local elements = {}
                        table.insert(elements, {label = _U('publish_news'), value = "new_news"})	
                        table.insert(elements, {label = _U('delete_news'), value = "news_delete"})	
                        if PlayerData.job.grade == 1 then
                            table.insert(elements, {label = _U('news_boss_action'), value = "boss"})	
                        end
                        ESX.UI.Menu.CloseAll()
                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'news_menu',
                        {
                            title    = 'RTS Novosti',
                            align    = 'top-right',
                            elements = elements,
                        }, function(data, menu)
                            menu.close()
                            if data.current.value == "new_news" then
                               newNews()
                            elseif data.current.value == "news_delete" then
                                newsDelete()
                            elseif data.current.value == "boss" then
                                TriggerEvent('esx_society:openBossMenu', 'news', function(data, menu)
                                    menu.close()
                                    CurrentAction     = 'menu_boss_actions'
                                    CurrentActionMsg  = _U('open_bossmenu')
                                    CurrentActionData = {}
                                end, { wash = false })
                            end
                            
                        end, function(data, menu)
                            menu.close()
                        end)

                    end
                end
            else
                wait = 1000
            end
        end
    end
end)

function newNews()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'news_name',
    {
        title = _U('news_title')
    },
    function(data, menu)
        menu.close()
        if data.value then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'news_content',
            {
                title = _U('news_content')
            },
            function(data2, menu2)
                menu2.close()
                if data2.value then
                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'news_img',
                    {
                        title = _U('news_img')
                    },
                    function(data3, menu3)
                        menu3.close()
                        if data3.value then
                            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'news_video',
                            {
                                title = _U('news_video')
                            },
                            function(data4, menu4)
                                menu4.close()
                                if data4.value then
                                    TriggerServerEvent("crew-phone:new-news", data.value, data2.value, data3.value, data4.value)
                                else
                                    TriggerServerEvent("crew-phone:new-news", data.value, data2.value, data3.value, "")
                                end
                            end, function(data4, menu4)
                                menu4.close()
                            end)   
                        else
                            ESX.ShowNotification(_U('news_no_image')) 
                        end
                    end, function(data3, menu3)
                        menu3.close()
                    end)
                else
                    ESX.ShowNotification(_U('news_no_content'))
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        else
            ESX.ShowNotification(_U('news_no_title'))
        end
    end, function(data, menu)
        menu.close()
    end)
end

function newsDelete()
    ESX.TriggerServerCallback('crew-phone:get-news', function(news)
        local elements = {}
        for i=1, #news, 1 do
            table.insert(elements, {label = json.decode(news[i].alldata).name, value = json.decode(news[i].id)})
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'get_news', {
            title    = "Seçilen Haberi Sil",
            align    = 'top-left',
            elements = elements,
        }, function(data, menu)
            menu.close()
            if data.current.value then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'news_video',
                {
                    title = _U('news_delete_message') .. data.current.value
                },
                function(data2, menu2)
                    menu2.close()
                    if data.current.value == tonumber(data2.value) then
                        ESX.ShowNotification(_U('news_deleted'))
                        TriggerServerEvent("crew-phone:delete-news", data.current.value)
                    else
                        ESX.ShowNotification(_U('news_not_deleted'))
                    end
                end, function(data2, menu2)
                    menu2.close()
                end)    
            end
        end, function(data, menu)
            menu.close()
        end)
    end)
end

function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

	SetTextScale(scale, scale)
	SetTextFont(4)

	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 215)

	AddTextComponentString(text)
	DrawText(_x, _y)

	local factor = (string.len(text)) / 180
	DrawRect(_x, _y + 0.0150, 0.0 + factor, 0.035, 41, 11, 41, 100)
end

RegisterNUICallback('crew-phone:getNews', function(data, cb)
    ESX.TriggerServerCallback('crew-phone:get-news', function(news)
        SendNUIMessage({event = 'news_updateNews', news = news})
    end)
end)

RegisterNUICallback('crewPhone:getWanted', function(data, cb)
    ESX.TriggerServerCallback('crewPhone:getWanted', function(wanted)
        SendNUIMessage({event = 'updateWanted', wanted = wanted})
    end)
end)