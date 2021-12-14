Citizen.CreateThread(function()
	local ESX = exports['es_extended']:getSharedObject()
	local GUI, MenuType = {}, 'default'
	GUI.Time = 0

	local openMenu = function(namespace, name, data)
		SendNUIMessage({
			action = 'openMenu',
			namespace = namespace,
			name = name,
			data = data
		})
	end

	local closeMenu = function(namespace, name)
		SendNUIMessage({
			action = 'closeMenu',
			namespace = namespace,
			name = name,
			data = data
		})
	end

	ESX.UI.Menu.RegisterType(MenuType, openMenu, closeMenu)

	RegisterNUICallback('menu_submit', function(data, cb)
		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		if menu.submit ~= nil then
			menu.submit(data, menu)
		end
		cb('OK')
	end)

	RegisterNUICallback('menu_cancel', function(data, cb)
		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)

		if menu.cancel ~= nil then
			menu.cancel(data, menu)
		end
		cb('OK')
	end)

	RegisterNUICallback('menu_change', function(data, cb)
		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)

		for i=1, #data.elements, 1 do
			menu.setElement(i, 'value', data.elements[i].value)

			if data.elements[i].selected then
				menu.setElement(i, 'selected', true)
			else
				menu.setElement(i, 'selected', false)
			end
		end

		if menu.change ~= nil then
			menu.change(data, menu)
		end
		cb('OK')
	end)

	RegisterKeyMapping('+1esxmenudefault', 'ESXMENU', 'keyboard', 'RETURN')
	-- Main thread
	RegisterCommand('-1esxmenudefault', function()
		---prazno mora biti
	end, false)
	RegisterCommand('+1esxmenudefault', function()
		if IsInputDisabled(0) and (GetGameTimer() - GUI.Time) > 150 then
			SendNUIMessage({
				action  = 'controlPressed',
				control = 'ENTER'
			})

			GUI.Time = GetGameTimer()
		end

	end, false)


	RegisterKeyMapping('+esxmenudefault2', 'ESXMENU', 'keyboard', 'BACK')
	-- Main thread
	RegisterCommand('-esxmenudefault2', function()
		---prazno mora biti
	end, false)
	RegisterCommand('+esxmenudefault2', function()
		if IsInputDisabled(0) and (GetGameTimer() - GUI.Time) > 150 then
			SendNUIMessage({
				action  = 'controlPressed',
				control = 'BACKSPACE'
			})

			GUI.Time = GetGameTimer()
		end

	end, false)



	RegisterKeyMapping('+esxmenudefault3', 'ESXMENU', 'keyboard', 'UP')
	-- Main thread
	RegisterCommand('-esxmenudefault3', function()
		---prazno mora biti
	end, false)
	RegisterCommand('+esxmenudefault3', function()
		if IsInputDisabled(0) and (GetGameTimer() - GUI.Time) > 150 then
			SendNUIMessage({
				action  = 'controlPressed',
				control = 'TOP'
			})

			GUI.Time = GetGameTimer()
		end

	end, false)


	RegisterKeyMapping('+esxmenudefault4', 'ESXMENU', 'keyboard', 'DOWN')
	-- Main thread
	RegisterCommand('-esxmenudefault4', function()
		---prazno mora biti
	end, false)
	RegisterCommand('+esxmenudefault4', function()
		if IsInputDisabled(0) and (GetGameTimer() - GUI.Time) > 150 then
			SendNUIMessage({
				action  = 'controlPressed',
				control = 'DOWN'
			})

			GUI.Time = GetGameTimer()
		end

	end, false)
	
	RegisterKeyMapping('+esxmenudefault5', 'ESXMENU', 'keyboard', 'LEFT')
	-- Main thread
	RegisterCommand('-esxmenudefault5', function()
		---prazno mora biti
	end, false)
	RegisterCommand('+esxmenudefault5', function()
		if IsInputDisabled(0) and (GetGameTimer() - GUI.Time) > 150 then
			SendNUIMessage({
				action  = 'controlPressed',
				control = 'LEFT'
			})

			GUI.Time = GetGameTimer()
		end

	end, false)

	RegisterKeyMapping('+esxmenudefault6', 'ESXMENU', 'keyboard', 'RIGHT')
	-- Main thread
	RegisterCommand('-esxmenudefault6', function()
		---prazno mora biti
	end, false)
	RegisterCommand('+esxmenudefault6', function()
		if IsInputDisabled(0) and (GetGameTimer() - GUI.Time) > 150 then
			SendNUIMessage({
				action  = 'controlPressed',
				control = 'RIGHT'
			})

			GUI.Time = GetGameTimer()
		end

	end, false)
end)
