CreateThread(function()
	Wait(1000)
	local d = 1000
	while true do
		Wait(d)
			d = 800
			local spavaj = true
      local distance = #(GetEntityCoords(PlayerPedId()) - Config.Kupovinadozvole)
      if distance < 10.0 then
        spavaj = false 
        d = 5
        DrawMarker(29, Config.Kupovinadozvole, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 250, 250, 250, 100, false, true, 2, true, false, false, false)
      end
       if distance < 2.0 then 
        spavaj = false 
         d = 5
         pokazi3dtinky(Config.Kupovinadozvole, 'Klikni E da bi pristupio meniju', 250)
         if IsControlPressed(0, 38) then
          ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
            if hasWeaponLicense then
              DisableControlAction(0, 38)
              ESX.ShowNotification('Imas dozvolu za oruzije, ne mozes da je kupujes 2 puta')
            else
              OtvoriLicence()
            end
          end, GetPlayerServerId(PlayerId()), 'weapon')
         end
       end
      if spavaj then d = 3000 end 
    end
end)

function OtvoriLicence()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_license', {
    title = 'Kupovina Dozvole',
		align = 'top-left',
		elements = {
			{label = 'Kupi dozvolu', value = 'da'},
			{label = 'Izadji', value = 'ne'},
		}
	}, function(data, menu)
		if data.current.value == 'da' then
    ESX.TriggerServerCallback('esxbalkan_kupovina:Kupovinalicence', function(kupio)
			if kupio then
      ESX.ShowNotification('Kupio si dozvolu')
			menu.close()
        end
     end)
  end
  if data.current.value == 'ne' then
    ESX.ShowNotification('Odustao si od kupovine dozvole za oruzije')
    ESX.UI.Menu.CloseAll()
  end
	end, function(data, menu)
		menu.close()
	end)
end

pokazi3dtinky = function(pos, text)
	local pocni = text
    local pocetak, kraj = string.find(text, '~([^~]+)~')
    if pocetak then
        pocetak = pocetak - 2
        kraj = kraj + 2
        pocni = ''
        pocni = pocni .. string.sub(text, 0, pocetak) .. '   '.. string.sub(text, pocetak+2, kraj-2) .. string.sub(text, kraj, #text)
    end
    AddTextEntry(GetCurrentResourceName(), pocni)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(2, false, false, -1)
    SetFloatingHelpTextWorldPosition(1, pos + vector3(0.0, 0.0, 1.0))
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
end