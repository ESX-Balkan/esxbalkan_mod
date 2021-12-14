--Ruke u vis

handsup = false

RegisterKeyMapping('handsup', 'Hands Up', 'keyboard', 'x')

RegisterCommand('handsup', function()
  local dict = "missminuteman_1ig_2"
  local igrac = PlayerPedId()
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
    Citizen.Wait(100)
  end
  
  if not IsEntityDead(igrac) and not handsup then
    TaskPlayAnim(igrac, dict, "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false)
    handsup = true
  elseif handsup then
    ClearPedTasks(igrac)
    handsup = false
  end 
end, false)


--Crouch
RegisterKeyMapping('+cucanje', 'Cucanje', 'keyboard', 'C')

CreateThread(function()
    RequestAnimSet("move_ped_crouched")
    while (not HasAnimSetLoaded("move_ped_crouched")) do Wait(100) end -- requestuj samo jednom animaciju a ne 100x puta...
end)

local cucnuo = false
RegisterCommand('+cucanje', function()
    local igraciliosobaxd = PlayerPedId()
    if not cucnuo and not IsPedFalling(igraciliosobaxd) and not IsEntityDead(igraciliosobaxd) and not IsPedUsingAnyScenario(igraciliosobaxd) and not IsEntityPlayingAnim(igraciliosobaxd,'random@mugging3', 'handsup_standing_base', 3) and DoesEntityExist(igraciliosobaxd) and not IsPedInAnyVehicle(igraciliosobaxd) and not IsPauseMenuActive() then
        cucnuo = true
        SetPedMovementClipset(igraciliosobaxd, "move_ped_crouched", 0.85)
    else
        cucnuo = false
        ResetPedMovementClipset(igraciliosobaxd, 0)
    end
end, false)

RegisterCommand('-cucanje', function()
    ---prazno mora biti jebemu boga i registerkeymappingu
end, false)


----FINGER

local mp_pointing, keyPressed = false, false

local function startPointing()
    local ped = PlayerPedId()
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do Wait(0) end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = PlayerPedId()
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(ped)
end
local once, oldval, oldvalped = true, false, false
RegisterCommand('+pokazi', function()
    if not mp_pointing then
		startPointing()
		mp_pointing = true
	else
		stopPointing()
		mp_pointing = false
	end
end, false)
RegisterCommand('-pokazi', function()
  ---prazno mora biti
end, false)
RegisterKeyMapping('+pokazi', 'Pokazi prstom', 'keyboard', 'b')
local ukljucipokazivanjeprsta = true
Citizen.CreateThread(function()
    Wait(800) -- cekaj malo :)
    while ukljucipokazivanjeprsta do -- bolje :) nego while true do
        Wait(15)
        local igrac = PlayerPedId()
        if mp_pointing then
            if Citizen.InvokeNative(0x921CE12C489C4C41, igrac) and not mp_pointing then
                stopPointing()
            end
            if Citizen.InvokeNative(0x921CE12C489C4C41, igrac) then
                if not IsPedOnFoot(igrac) then
                    stopPointing()
                else
                    local ped = PlayerPedId()
                    local camPitch = GetGameplayCamRelativePitch()
                    if camPitch < -70.0 then
                        camPitch = -70.0
                    elseif camPitch > 42.0 then
                        camPitch = 42.0
                    end
                    camPitch = (camPitch + 70.0) / 112.0

                    local camHeading = GetGameplayCamRelativeHeading()
                    local cosCamHeading = Cos(camHeading)
                    local sinCamHeading = Sin(camHeading)
                    if camHeading < -180.0 then
                        camHeading = -180.0
                    elseif camHeading > 180.0 then
                        camHeading = 180.0
                    end
                    camHeading = (camHeading + 180.0) / 360.0

                    local blocked = 0
                    local nn = 0

                    local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                    local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                    nn,blocked,coords,coords = GetRaycastResult(ray)
                    Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                    Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                    Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                    Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)
                end
            end
        else
            Wait(800)
        end
    end
end)