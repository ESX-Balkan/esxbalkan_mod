ESX                         = nil
PlayerData = {}

CreateThread(function()

  while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(0)
	end
end)

-- BOJA ZONE SE PRAVI OVAKO 0X + HEX BOJA + 99.
-- PRIMER 0X + ffffff (bela boja)+ 99 = 0Xffffff99
local zoneboje ={
	["unemployed"] = 0xffffff99,
    ["albanci"] = 0x471d1d99,
    ["automafija"] = 0xed7f1f99,
}

local korde = {}
local width = 100.0
local height = 50.0
local debug = false
local ukloni = false
local bojica = {}
local blip = {}
local blipovi = {}
RegisterNetEvent('zone-update:c')
AddEventHandler('zone-update:c', function(Blipovi)
blipovi = Blipovi
for k, v in pairs(blipovi) do
    bojica[v.ime] = tonumber(v.boja)
end
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)


CreateThread(function()
    while true do
        Wait(60000)
        TriggerServerEvent('zona-update:s')
        for k,v in pairs(blipovi) do
        if  not DoesBlipExist(blip[v.ime]) then
         blip[v.ime] = AddBlipForArea(v.koordinate.x, v.koordinate.y, v.koordinate.z, tonumber(v.width.. '.0'), tonumber(v.height.. '.0'))
        end
    end
    for k,v in pairs(blipovi) do
    SetBlipColour(blip[v.ime], bojica[v.ime] )
    SetBlipRotation(blip[v.ime], 0)
    SetBlipAsShortRange(blip[v.ime], true)
    SetBlipDisplay(blip[v.ime], 3)
    SetBlipHighDetail(blip[v.ime], true)
    end
    end
end)

local mesto = {}
local potrebno = nil
local vlasnik = nil
local provera = false
local moze = true
local kordi = {}
CreateThread(function()
    while true do
        Wait(1)
        local ped = PlayerPedId()
        for k,v in pairs(blipovi) do
            if Vdist(GetEntityCoords(ped), v.mestozauzimanja.x,v.mestozauzimanja.y, v.mestozauzimanja.z ) < 100 then
                DrawMarker(42, v.mestozauzimanja.x,v.mestozauzimanja.y, v.mestozauzimanja.z, 0, 0, 0, 0, 90, 180, 1.0, 1.0, 1.0, 255, 0, 0, 155, 0, 0, 2, 1, 0, 0, 0)

            if Vdist(GetEntityCoords(ped), v.mestozauzimanja.x,v.mestozauzimanja.y, v.mestozauzimanja.z ) < 5 then
                pokazi3d(v.mestozauzimanja, 'Pritisni ~INPUT_REPLAY_SHOWHOTKEY~ da krenes zauzimanje zone ~g~('.. v.ime.. ')')
            end
            if Vdist(GetEntityCoords(ped), v.mestozauzimanja.x,v.mestozauzimanja.y, v.mestozauzimanja.z ) < 2 then
                if IsControlJustReleased(1, 311) then
                     potrebno = v.ime
                     kordi = v.mestozauzimanja
                     vlasnik = v.vlasnik
                    mesto = v.mestozauzimanja
                    moze = true
                    pokrenizauzimanje()
                    end
                end
            end
        end
    end
end)
local isDead = false
AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)


AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

CreateThread(function()
    while true do
        Wait(100)
        local ped = PlayerPedId()
        if provera then
            if Vdist(GetEntityCoords(ped), mesto.x,mesto.y, mesto.z ) > 10 then
                moze = false
            end
        else
            Wait(1100)
        end
    end
end)

-- DA BI NAPRAVILI ZONU PRVO UPISITE /debugmode on
-- NAKON TOGA POMERATE ZONU STRELICAMA, SIRINU  ZONE MENJATE NA N i M,DUZINU ZONE MENJATE NA  X i C
-- KADA STE POZICIONIRALI ZONU UPISITE "/cena cenazone"(primer /cena 500) DA BI ODREDILI KOLIKO CE SE PARA DOBIJATI OD ZONE
-- NAKON TOGA UPISITE "/napravizonu ime zone"(primer /napravizonu ESX Balkan !) DA BI ODREDILI IME ZONE I MESTO ZAUZIMANJA(MESTO ZAUZIMANJA CE BITI VASA TRENUTNA LOKACIJA)
 
RegisterCommand('debugmode', function(source, args)
    if args[1] == 'on' then
    	local k = GetEntityCoords(PlayerPedId())
    		korde = {x=k.x,y=k.y,z=k.z}
    debug = true
    ESX.ShowNotification("Debugmode ukljucen")
    else
        debug = false
    end
end, false)

local boja
local cena = 0

RegisterCommand('cena', function(source, args)
    cena = tonumber(args[1])
end, false)
    

RegisterCommand('napravizonu', function(source, args)
TriggerServerEvent('napravizonu', table.concat(args, ' '), json.encode(korde), width, height, zoneboje[ESX.PlayerData.job.name] or 0xffffff99, cena)
end, false)


CreateThread(function()
    while true do 
        Wait(1)
        if debug then
        local blipa = AddBlipForArea(korde.x, korde.y, korde.z, width, height)
        SetBlipRotation(blipa, 0)
        SetBlipAsShortRange(blipa, true)
        SetBlipColour(blipa, 3958509952)
        Wait(100)
            RemoveBlip(blipa)
        else
            Wait(1000)
        end
    end
end)
CreateThread(function() -- strelice promeni korde
    while true do
        Wait(0)
        if debug then
        if IsControlPressed(0, 172)  then
			korde.y = korde.y + 0.75
        end
        if IsControlPressed(0, 173)  then 
			korde.y = korde.y - 0.75
		end
		if IsControlPressed(0, 175) then
			korde.x = korde.x + 0.75
        end
        if IsControlPressed(0, 174) then
			korde.x = korde.x - 0.75
        end
        if IsControlPressed(0, 301)  then --m
			width = width + 1
        end
        if IsControlPressed(0, 306)  then --n
			width = width - 1
		end
		if IsControlPressed(0, 323) then -- x
			height = height + 1
        end
        if IsControlPressed(0, 324) then -- c
            height = height - 1
        end
    else
        Wait(1000)
    end
    end
end)    


RegisterNetEvent('setajwpzone')
AddEventHandler('setajwpzone', function(k)
    SetNewWaypoint(k.x, k.y)
end)


RegisterNetEvent('resetuj:c')
AddEventHandler('resetuj:c', function()

Wait(10000)
TriggerServerEvent('resetuj:s')

end)

pokrenizauzimanje = function()
    if ESX.GetPlayerData().job.name ~= 'unemployed' then
    ESX.TriggerServerCallback('checkorgz', function(imaliz)
        if imaliz >= 3 then -- Koliko clanova organizacije koje zauzima treba da bude  na serveru?
    ESX.TriggerServerCallback('checkorgt', function(jelbila)
        if jelbila then
    ESX.TriggerServerCallback('checkorg', function(imali)
        if imali >= 0 then -- Koliko clanova organizacije koja brani zonu treba da bude na serveru?
    if ESX.GetPlayerData().job.name    ~= vlasnik then
    TriggerServerEvent('zonauzbuna', vlasnik, kordi, potrebno)
    --TriggerServerEvent('vreme:u', potrebno)
    provera = true
    exports['progressBars']:startUI(300000, "Zauzimanje je u toku nemojte se pomerati vise od 10 metara!")
    Wait(300000)
    if isDead == false then
    if moze then
        ESX.ShowNotification('Uspesno ste zauzeli teritoriju '.. potrebno)
        local player = PlayerId()
        local ime = GetPlayerName(player)
		local msg = ''..ime..  ' je zauzeo zonu pod imenom '.. potrebno
        local bot = "Zauzimanje Zone"
		TriggerServerEvent('logovi:client', bot, msg)
        TriggerServerEvent('zauzmizonu', potrebno, zoneboje[ESX.GetPlayerData().job.name], vlasnik)
    else
        ESX.ShowNotification('Odaljili ste se vise od 10 metra, zauzimanje nije uspelo!')
    end
else
    ESX.ShowNotification('Zauzimanje neuspesno!')
end
else
    ESX.ShowNotification('Ne mozete zauzimati  vasu zonu!')
    end
else
    ESX.ShowNotification('Nema dovoljno clanova ove organizacije za zauzimanje!')
end
end, vlasnik)

else
    ESX.ShowNotification('Ova zona je zauzimana u zadnjih 4 sata!')
end
end, potrebno)
else
    ESX.ShowNotification('Nema dovoljno clanova vase organizacije za zauzimanje!')
end
end, vlasnik)
end
end

pokazi3d = function(kordinate, tekst)
    local str = tekst
    local pocetak, kraj = string.find(tekst, '~([^~]+)~')
    if pocetak then
        pocetak = pocetak - 2
        kraj = kraj + 2
        str = ''
        str = str .. string.sub(tekst, 0, pocetak) .. '   '.. string.sub(tekst, pocetak+2, kraj-2) .. string.sub(tekst, kraj, #tekst)
    end
    AddTextEntry(GetCurrentResourceName(), str)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(2, false, false, -1)
    if type(kordinate) == 'table' then
        kordinate = vector3(kordinate.x, kordinate.y, kordinate.z)
    end
    SetFloatingHelpTextWorldPosition(1, kordinate)
    SetFloatingHelpTextStyle(1, 2, 2, -1, 3, 0)
end
