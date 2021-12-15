
-- ANTI MEELE TJ KUNDAK

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
          DisableControlAction(1, 140, true)
          DisableControlAction(1, 141, true)
          DisableControlAction(1, 142, true)
        else
          Citizen.Wait(800)
        end
    end
end)

-----ANTI-AFK

-- vreme = 560 -- sekunde do kicka 
-- upozorenje = true
-- local akojetrue = true

-- Citizen.CreateThread(function()
--   while akojetrue do
--     Wait(1000)

--    local playerPed = PlayerPedId()
--     if playerPed then
--       currentPos = GetEntityCoords(playerPed, true)

--       if currentPos == prevPos then
--         if time > 0 then
--           if upozorenje and time == math.ceil(vreme / 4) then
--             TriggerEvent("chatMessage", "UPOZORENJE ", {66, 135, 245}, "^1Bićete izbačeni za " .. time .. "s zato što se ne pomerate.")
--           end

--           time = time - 1
--         else
--           TriggerServerEvent("mina_glavna:afk")
--         end
--       else
--         time = vreme
--       end

--       prevPos = currentPos
--     end
--   end
-- end)








