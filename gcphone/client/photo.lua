phone = false
phoneId = 0

RegisterNetEvent('camera:open')
AddEventHandler('camera:open', function()
    CreateMobilePhone(0)
	CellCamActivate(true, true)
	phone = true
    PhonePlayOut()
end)

frontCam = false

function CellFrontCamActivate(activate)
	return Citizen.InvokeNative(0x2491A93618B7D838, activate)
end

RegisterKeyMapping('+telefonzatvori', 'GCPHONE', 'keyboard', 'BACK')
-- Main thread
RegisterCommand('-telefonzatvori', function()
    ---prazno mora biti
end, false)
RegisterCommand('+telefonzatvori', function()
	if  phone == true then -- CLOSE PHONE
		DestroyMobilePhone()
		phone = false
		CellCamActivate(false, false)
		if firstTime == true then 
			firstTime = false 
			Citizen.Wait(2500)
			displayDoneMission = true
		end
	end
end, false)

RegisterKeyMapping('+kameraselfie3', 'GCPHONE', 'MOUSE_BUTTON', 'MOUSE_MIDDLE')
-- Main thread
RegisterCommand('-kameraselfie3', function()
    ---prazno mora biti
end, false)
RegisterCommand('+kameraselfie3', function()
	if phone == true then -- SELFIE MODE
		frontCam = not frontCam
		CellFrontCamActivate(frontCam)
	end
		
	if phone == true then
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(9)
		HideHudComponentThisFrame(6)
		HideHudComponentThisFrame(19)
		HideHudAndRadarThisFrame()
	end
		
	ren = GetMobilePhoneRenderId()
	SetTextRenderId(ren)
	
	-- Everything rendered inside here will appear on your phone.
	
	SetTextRenderId(1) -- NOTE: 1 is default
end, false)
