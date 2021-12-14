-- Automatske poruke

local mina = {}

mina.delay = 7

mina.prefix = ''

mina.messages = {
'^*^0🧩 ^5Discord^7^r » Posjetite naš discord^0 - ^5^*discord.gg/7SK3fGDeHN^r!',
}

local timeout = mina.delay * 1000 * 60

Citizen.CreateThread(function()
    while true do
    for i in pairs(mina.messages) do
        chat(i)
        Citizen.Wait(timeout)
    end
    Citizen.Wait(3000)
end
end)

function chat(i)
    TriggerEvent('chatMessage', '', {255,255,255}, mina.prefix .. mina.messages[i])
end

-- BLIPOVI 
--[Ovdje dodajte blipove gdje želite na mapi,unesete kordinate i odaberete boju i sprite blipa.]
local blips = {
    -- {title="Opština", colour=27, id=475, x = -1082.65, y = -247.84, z = 37.76 }, --primjer  
  }
  
  Citizen.CreateThread(function()
      for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
          BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
      end
  end)
  
-- PAUSE MENU
function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
  AddTextEntry('PM_PANE_LEAVE', '~b~IZADJI SA SERVERA')
  AddTextEntry('PM_PANE_QUIT', '~b~NAPUSTI IGRICU')
  AddTextEntry('PM_SCR_MAP', '~b~MAPA')
  AddTextEntry('PM_SCR_GAM', '~b~IGRICA')
  AddTextEntry('PM_SCR_INF', '~b~INFORMACIJE')
  AddTextEntry('PM_SCR_SET', '~b~PODESAVANJA')
  AddTextEntry('PM_SCR_STA', '~b~STATISTIKE')
  AddTextEntry('PM_SCR_GAL', '~b~GALERIJA')
  AddTextEntry('PM_SCR_RPL', '~b~ROCKSTAR PODESVANJA ∑')
end)

function SetData()
	local name = GetPlayerName(PlayerId())
	local id = GetPlayerServerId(PlayerId())
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', '~b~ESX BALKAN~w~ LEGACY MOD ~t~| ~b~Discord : ~w~ discord.gg/7SK3fGDeHN  ~t~ | ~b~ID: ~w~' .. id)
end

CreateThread(function()
	while true do
		Wait(2000)
		SetData()
	end
end)

