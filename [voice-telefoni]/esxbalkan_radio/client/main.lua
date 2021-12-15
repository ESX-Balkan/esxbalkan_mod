Scully = {
    source = nil,
    volume = 0.5,
    radioProp = nil,
    radioModel = "prop_cs_hand_radio",
    animDict = "cellphone@",
    animName = "cellphone_text_read_base"
}

RegisterCommand("radio", function()
    Scully.ToggleRadio(true)
end)

RegisterNUICallback('radioOn', function(data, cb)
    exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    cb('ok')
end)

RegisterNUICallback('joinChannel', function(data, cb)
    exports["pma-voice"]:setRadioChannel(tonumber(data.channel))
    cb('ok')
end)

RegisterNUICallback('leaveChannel', function(data, cb)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    exports["pma-voice"]:removePlayerFromRadio()
    cb('ok')
end)

RegisterNUICallback('VolUp', function(data, cb)
    if Scully.volume < 1.0 then
        PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
        Scully.volume = Scully.volume + 0.1
        exports["pma-voice"]:setVolume(Scully.volume, "radio")
    end
    cb('ok')
end)

RegisterNUICallback('VolDown', function(data, cb)
    if Scully.volume > 0.0 then
        PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
        Scully.volume = Scully.volume - 0.1
        exports["pma-voice"]:setVolume(Scully.volume, "radio")
    end
    cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
    Scully.ToggleRadio(false)
    cb('ok')
end)

Scully.RadioAnim = function(enable)
    Scully.source = PlayerPedId()
    if enable then
        RequestAnimDict(Scully.animDict)
        while not HasAnimDictLoaded(Scully.animDict) do
            Citizen.Wait(0)
        end
        radioProp = CreateObject(GetHashKey("prop_cs_hand_radio"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(radioProp, Scully.source, GetPedBoneIndex(Scully.source, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
        TaskPlayAnim(Scully.source, Scully.animDict, Scully.animName, 8.0, -8.0, -1, 50, 0, 0, 0, 0)
    else
        StopAnimTask(Scully.source, Scully.animDict, Scully.animName, 8.0, -8.0, -1, 50, 0, 0, 0, 0)
        RemoveAnimDict(Scully.animDict)
        DeleteEntity(radioProp)
    end
end

Scully.ToggleRadio = function(enable)
    SetNuiFocus(enable, enable)
    Scully.RadioAnim(enable)
    SendNUIMessage({
        type = "openradio",
        enable = enable
    })
end