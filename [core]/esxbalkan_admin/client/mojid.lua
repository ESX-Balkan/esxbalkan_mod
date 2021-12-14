RegisterKeyMapping('mojid', 'ID Igrača', 'keyboard', 'END')
-- Main thread

RegisterCommand('mojid', function()
    ESX.ShowNotification('Tvoj ID je:' .. GetPlayerServerId(PlayerId()))
end, false)






