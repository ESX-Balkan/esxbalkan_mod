--[[EEEEEEEEEEEEEEEEEEEEEE   SSSSSSSSSSSSSSS XXXXXXX       XXXXXXX     BBBBBBBBBBBBBBBBB           AAA               LLLLLLLLLLL             KKKKKKKKK    KKKKKKK               AAA               NNNNNNNN        NNNNNNNN
E::::::::::::::::::::E SS:::::::::::::::SX:::::X       X:::::X     B::::::::::::::::B             A:::A              L:::::::::L             K:::::::K    K:::::K              A:::A              N:::::::N       N::::::N
E::::::::::::::::::::ES:::::SSSSSS::::::SX:::::X       X:::::X     B::::::BBBBBB:::::B           A:::::A             L:::::::::L             K:::::::K    K:::::K             A:::::A             N::::::::N      N::::::N
EE::::::EEEEEEEEE::::ES:::::S     SSSSSSSX::::::X     X::::::X     BB:::::B     B:::::B         A:::::::A            LL:::::::LL             K:::::::K   K::::::K            A:::::::A            N:::::::::N     N::::::N
  E:::::E       EEEEEES:::::S            XXX:::::X   X:::::XXX       B::::B     B:::::B        A:::::::::A             L:::::L               KK::::::K  K:::::KKK           A:::::::::A           N::::::::::N    N::::::N
  E:::::E             S:::::S               X:::::X X:::::X          B::::B     B:::::B       A:::::A:::::A            L:::::L                 K:::::K K:::::K             A:::::A:::::A          N:::::::::::N   N::::::N
  E::::::EEEEEEEEEE    S::::SSSS             X:::::X:::::X           B::::BBBBBB:::::B       A:::::A A:::::A           L:::::L                 K::::::K:::::K             A:::::A A:::::A         N:::::::N::::N  N::::::N
  E:::::::::::::::E     SS::::::SSSSS         X:::::::::X            B:::::::::::::BB       A:::::A   A:::::A          L:::::L                 K:::::::::::K             A:::::A   A:::::A        N::::::N N::::N N::::::N
  E:::::::::::::::E       SSS::::::::SS       X:::::::::X            B::::BBBBBB:::::B     A:::::A     A:::::A         L:::::L                 K:::::::::::K            A:::::A     A:::::A       N::::::N  N::::N:::::::N
  E::::::EEEEEEEEEE          SSSSSS::::S     X:::::X:::::X           B::::B     B:::::B   A:::::AAAAAAAAA:::::A        L:::::L                 K::::::K:::::K          A:::::AAAAAAAAA:::::A      N::::::N   N:::::::::::N
  E:::::E                         S:::::S   X:::::X X:::::X          B::::B     B:::::B  A:::::::::::::::::::::A       L:::::L                 K:::::K K:::::K        A:::::::::::::::::::::A     N::::::N    N::::::::::N
  E:::::E       EEEEEE            S:::::SXXX:::::X   X:::::XXX       B::::B     B:::::B A:::::AAAAAAAAAAAAA:::::A      L:::::L         LLLLLLKK::::::K  K:::::KKK    A:::::AAAAAAAAAAAAA:::::A    N::::::N     N:::::::::N
EE::::::EEEEEEEE:::::ESSSSSSS     S:::::SX::::::X     X::::::X     BB:::::BBBBBB::::::BA:::::A             A:::::A   LL:::::::LLLLLLLLL:::::LK:::::::K   K::::::K   A:::::A             A:::::A   N::::::N      N::::::::N
E::::::::::::::::::::ES::::::SSSSSS:::::SX:::::X       X:::::X     B:::::::::::::::::BA:::::A               A:::::A  L::::::::::::::::::::::LK:::::::K    K:::::K  A:::::A               A:::::A  N::::::N       N:::::::N
E::::::::::::::::::::ES:::::::::::::::SS X:::::X       X:::::X     B::::::::::::::::BA:::::A                 A:::::A L::::::::::::::::::::::LK:::::::K    K:::::K A:::::A                 A:::::A N::::::N        N::::::N
EEEEEEEEEEEEEEEEEEEEEE SSSSSSSSSSSSSSS   XXXXXXX       XXXXXXX     BBBBBBBBBBBBBBBBBAAAAAAA                   AAAAAAALLLLLLLLLLLLLLLLLLLLLLLLKKKKKKKKK    KKKKKKKAAAAAAA                   AAAAAAANNNNNNNN         NNNNNNN
]]

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(0) end
end)


local pozoviServer = TriggerServerEvent
local pozoviClient = TriggerEvent
    
local RNE = RegisterNetEvent
local AEH = AddEventHandler

local pljacka = false
local hakovanjeZavrseno = false
local brojPanela = 0

local izbusioJednu = false
local izbusioDrugu = false
local izbusioTrecu = false

local randomKljuc = 0
local keyPadKod = 0

local lootaUpperVault = 0
local timer = 0
local laseriUpaljeni = true
local mozeRaznijeti = false

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end

    -- vratiti sve na default postavke
    pozoviClient('esxGlavna:vaultReset')
    pozoviClient('sierra-doorlock:client:setState', 32, true)
	pozoviClient('sierra-doorlock:client:setState', 29, true)
    pozoviClient('sierra-doorlock:client:setState', 33, true) 
    pozoviClient('sierra-doorlock:client:setState', 34, true) 

    SetResourceKvp('ormaric1', 'nijeIzbusen')
    SetResourceKvp('sefoviLootani', 'nisu')
    SetResourceKvp('pljackaStartana', 'nije')

    pozoviClient('esxGlavna:spawnajTrollye')
end)

function notifikacija(poruka)
    ESX.ShowNotification(poruka)
end

-- LASERI GLAVNA STVAR

local laser1 = Laser.new(
  vector3(261.23, 227.212, 104.018),
  {vector3(256.876, 223.282, 102.052), vector3(251.968, 225.122, 101.688), vector3(261.936, 222.338, 102.064)},
  {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = "kico1"}
)

local laser2 = Laser.new(
  vector3(262.148, 222.26, 102.534),
  {vector3(260.66, 227.42, 101.79), vector3(263.218, 226.128, 101.774), vector3(256.996, 228.754, 101.744)},
  {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = "kico2"}
)

local laser3 = Laser.new(
  vector3(259.256, 227.93, 103.818),
  {vector3(264.086, 220.718, 101.472)},
  {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = "kico3"}
)

local laser4 = Laser.new(
  vector3(251.658, 225.458, 104.178),
  {vector3(262.906, 226.242, 101.89)},
  {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = "kico4"}
)

local laser5 = Laser.new(
  vector3(253.878, 229.888, 104.282),
  {vector3(255.66, 223.726, 101.878), vector3(259.708, 223.148, 101.744), vector3(262.238, 222.228, 101.852), vector3(266.482, 220.912, 101.664)},
  {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = "kicob"}
)

function upaliLasere() 
    laser1.setActive(true)
    laser2.setActive(true)
    laser3.setActive(true)
    laser4.setActive(true)
    laser5.setActive(true)

    laseriUpaljeni = true
end

RNE('esxGlavna:ugasiBlip')
AEH('esxGlavna:ugasiBlip', function()
	RemoveBlip(pljackaBlip)
end)

RegisterNetEvent('esxGlavna:upaliBlip')
AddEventHandler('esxGlavna:upaliBlip', function(position)
	pljackaBlip = AddBlipForCoord(position)
	SetBlipSprite(pljackaBlip, 161)
	SetBlipScale(pljackaBlip, 2.0)
	SetBlipColour(pljackaBlip, 3)
	PulseBlip(pljackaBlip)
end)

RNE('esxGlavna:ugasiLasere')
AEH('esxGlavna:ugasiLasere', function() 

    local elements = {{label = 'Unesite Kod | 🔢', value = 'laseri_otkljucavanje'}}
		
    ESX.UI.Menu.CloseAll()
    
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wash', {
        title		= 'Laseri Opcije',
        align		= 'top-left',
        elements	= elements
    }, function(data, menu)
        if data.current.value == 'laseri_otkljucavanje' then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'laseri_otkljucavanje_kod_', {
                title = 'SIFRA/KOD'
            }, function(data, menu)
            
                local rezultat = tonumber(data.value)
                
                if rezultat == randomKljuc then
                    laser1.setActive(false)
                    laser2.setActive(false)
                    laser3.setActive(false)
                    laser4.setActive(false)
                    laser5.setActive(false)
                    laseriUpaljeni = false
                    notifikacija('Uspjesno, laseri su ugaseni na 5 minuta!')
                    Wait(300000)
                    notifikacija('UPOZORENJE, laseri su se ponovno upalili!')

                    laser1.setActive(true)
                    laser2.setActive(true)
                    laser3.setActive(true)
                    laser4.setActive(true)
                else
                    menu.close()
                    notifikacija('Neuspjesno, kod nije tacan!')

                end
            end, function(data, menu)
                menu.close()
            end)
        end
        end, function(data, menu)
        menu.close()
    end)
end)

Citizen.CreateThread(function()
    Citizen.Wait(1)

    while laseriUpaljeni do
        Citizen.Wait(1)

        laser1.onPlayerHit(function(playerBeingHit, hitPos)
            if playerBeingHit then
                pozoviServer('esxGlavna:pukaoGaLaser')
            end
        end)

        laser2.onPlayerHit(function(playerBeingHit, hitPos)
            if playerBeingHit then
                pozoviServer('esxGlavna:pukaoGaLaser')
                Wait(500)
            end
        end)

        laser3.onPlayerHit(function(playerBeingHit, hitPos)
            if playerBeingHit then
                pozoviServer('esxGlavna:pukaoGaLaser')
                Wait(500)
            end
        end)

        laser4.onPlayerHit(function(playerBeingHit, hitPos)
            if playerBeingHit then
                pozoviServer('esxGlavna:pukaoGaLaser')
                Wait(500)
            end
        end)

        laser5.onPlayerHit(function(playerBeingHit, hitPos)
            if playerBeingHit then
                pozoviServer('esxGlavna:pukaoGaLaser')
                Wait(500)
            end
        end)
    end
end)


RNE('esxGlavna:mrtvoHakovanje')
AEH('esxGlavna:mrtvoHakovanje', function()
    ESX.TriggerServerCallback('esxGlavna:itemCallback', function(imaItem)
        if imaItem then
            local lokacija = {x,y,z,h}

            lokacija.x = 262.65
            lokacija.y = 222.75
            lokacija.z = 105.90
            lokacija.h = 244.19
        
            brojPanela = 1
            hakovanje(lokacija)

            pozoviServer('esxGlavna:pushajLog', '💵 esxGlavna | Pacific Heist' .. GetPlayerName(source) .. ' je zapoceo hakovanje 1. panela!\nLokacija Panela: (' .. lokacija.x, lokacija.y, lokacija.z ..')\nLokacija Igraca (' .. GetEntityCoords(PlayerPedId()) .. ')', ESXBalkan.Zelena)
        else
            notifikacija('Potreban vam je laptop za hakovanje!')
        end
    end, 'laptop_h')
end)

RNE('esxGlavna:mrtvoHakovanje2')
AEH('esxGlavna:mrtvoHakovanje2', function()
    ESX.TriggerServerCallback('esxGlavna:itemCallback', function(imaItem)
        if imaItem then
            local lokacija2 = {x,y,z,h}
        
            lokacija2.x = 253.34
            lokacija2.y = 228.25
            lokacija2.z = 101.39
            lokacija2.h = 63.60
        
            brojPanela = 2
            hakovanje(lokacija2)

            pozoviServer('esxGlavna:pushajLog', '💵 esxGlavna | Pacific Heist' .. GetPlayerName(source) .. ' je zapoceo hakovanje 2. panela!\nLokacija Panela: (' .. lokacija2.x, lokacija2.y, lokacija2.z ..')\nLokacija Igraca (' .. GetEntityCoords(PlayerPedId()) .. ')', ESXBalkan.Zelena)

        else
            notifikacija('Potreban vam je laptop za hakovanje!')
        end
    end, 'laptop_h')
end)

RegisterNetEvent('esxGlavna:pokreniPrikazivanjeTimera')
AddEventHandler('esxGlavna:pokreniPrikazivanjeTimera', function()
    Citizen.Wait(1)

    while lootaUpperVault do
        Citizen.Wait(1)

		crtaj2dtekst(0.95, 1.44, 1.0,1.0,0.35, 'Preostalo vrijeme: ' .. timer .. ' ~w~sekundi', 255, 255, 255, 255)
    end
end)

RNE('esxGlavna:pokreni:gornjiVaultTimer')
AEH('esxGlavna:pokreni:gornjiVaultTimer', function(kolicina)
    Citizen.Wait(1)

    timer = math.ceil(150)
    if timer <= 150 then
        timer = 150
    end

    pozoviClient('esxGlavna:pokreniPrikazivanjeTimera')
    Citizen.Wait(1)

        while lootaUpperVault do
            Citizen.Wait(1)

            timer = timer - 1
			sansa = math.random(100)

            if timer <= 0 then
                lootaUpperVault = false

				if sansa > 60 then
					pozoviClient('esxGlavna:vaultReset')
				else
                    notifikacija('Mehanizam za vrata je crko batko, izgleda da se nece zatvoriti :)') 
				end

            end
            Citizen.Wait(1000)
        end
end)

RNE('esxGlavna:mrtvoHakovanje3')
AEH('esxGlavna:mrtvoHakovanje3', function()
    ESX.TriggerServerCallback('esxGlavna:itemCallback', function(imaItem)
        if imaItem then
            local lokacija3 = {x,y,z,h}
            brojPanela = 3
        
            lokacija3.x = 272.19503
            lokacija3.y = 231.56225
            lokacija3.z = 97.59172
            lokacija3.h = 335.43719
        
            hakovanje(lokacija3)
            pozoviServer('esxGlavna:pushajLog', '💵 esxGlavna | Pacific Heist' .. GetPlayerName(source) .. ' je zapoceo hakovanje 3. panela!\nLokacija Panela: (' .. lokacija3.x, lokacija3.y, lokacija3.z ..')\nLokacija Igraca (' .. GetEntityCoords(PlayerPedId()) .. ')', ESXBalkan.Zelena)

        else
            notifikacija('Potreban vam je laptop za hakovanje!')
        end
    end, 'laptop_h')
end)


RNE('esxGlavna:thermal')
AEH('esxGlavna:thermal', function()
    ESX.TriggerServerCallback('esxGlavna:povuciPolicajce', function(mikicajci)
        if mikicajci >= ESXBalkan.BrojPolicije then
            if GetResourceKvpString('pljackaStartana') == 'nije' then
                ESX.TriggerServerCallback('esxGlavna:itemCallback', function(imaItem)
                    if imaItem then
                        local pljacka = true -- stavlja value pljacka da je true jer je igrac poceo pljackat
                        local korde = GetEntityCoords(PlayerPedId())
            
                        pozoviServer('esxGlavna:pushajLog', '💵 esxGlavna | Pacific Heist' .. GetPlayerName(source) .. ' je zapoceo pljacku glavne banke!\nLokacija Igraca (' .. GetEntityCoords(PlayerPedId()) .. ')', ESXBalkan.Zelena)
            
                        pozoviServer('esxGlavna:oduzmiItem', 'thermal_charge', 1)
                        pozoviServer('esxGlavna:pljackaZapoceta', GetEntityCoords(PlayerPedId()))
                        SetResourceKvp('pljackaStartana', 'jeste')
                    
                        exports["memorygame"]:thermiteminigame(10, 3, 3, 10,
                        function()
                            plantajThermal() -- poziva funkciju za stavljanje termalne boombe
                        end,
                        function() 
                            plantajThermal() -- poziva funkciju za stavljanje termalne boombe
                        end)
                    else
                        notifikacija('Potrebne su vam termitne bombe!')
                    end
                end, 'thermal_charge')
            else
                ESX.ShowNotification('Ova banka se vec pljacka!')
            end
        else
            ESX.ShowNotification('Nema dovoljno policije! Broj potrebne policije: ' .. ESXBalkan.BrojPolicije)
        end
    end)
end)

RNE('esxGlavna:thermal2')
AEH('esxGlavna:thermal2', function()
    ESX.TriggerServerCallback('esxGlavna:itemCallback', function(imaItem)
        if imaItem then
            local pljacka = true -- stavlja value pljacka da je true jer je igrac poceo pljackat
            local korde = GetEntityCoords(PlayerPedId())

            pozoviServer('esxGlavna:oduzmiItem', 'thermal_charge', 1)

            exports["memorygame"]:thermiteminigame(10, 3, 3, 10,
            function()
                plantajThermalDva() -- poziva funkciju za stavljanje termalne boombe
                pozoviServer('esxGlavna:pushajLog', '💵 esxGlavna | Pacific Heist' .. GetPlayerName(source) .. ' je postavio termitnu bombu da bi usao u upper vault!\nLokacija Igraca (' .. GetEntityCoords(PlayerPedId()) .. ')', ESXBalkan.Zelena)
            end,
            function() 
                plantajThermalDva() -- poziva funkciju za stavljanje termalne boombe
                pozoviServer('esxGlavna:pushajLog', '💵 esxGlavna | Pacific Heist' .. GetPlayerName(source) .. ' je postavio termitnu bombu da bi usao u upper vault!\nLokacija Igraca (' .. GetEntityCoords(PlayerPedId()) .. ')', ESXBalkan.Zelena)
            end)
        else
            notifikacija('Potrebne su vam termitne bombe!')
        end
    end, 'thermal_charge')
end)

RNE('esxGlavna:ormaricUpperVault')
AEH('esxGlavna:ormaricUpperVault', function()
    ESX.TriggerServerCallback('esxGlavna:itemCallback', function(imaItem)
        if imaItem then
            if GetResourceKvpString('ormaric1') == 'izbusen' then 
                notifikacija('Ovaj ormaric je vec opljackan!')
                return 
            end
        
            local minigejmUspjesan = exports['cd_keymaster']:StartKeyMaster()
        
            if minigejmUspjesan then
                pozoviServer('esxGlavna:ormaric:nagrada', source)
                SetResourceKvp('ormaric1', 'izbusen')
            else
                notifikacija('Niste uspjeli, pokusajte ponovno!')
                SetResourceKvp('ormaric1', 'nijeIzbusen')
            end
        else
            notifikacija('Potrebna vam je busilica!')
        end
    end, 'drill')
end)

RNE('esxGlavna:preuzmiIsusovBlagoslav')
AEH('esxGlavna:preuzmiIsusovBlagoslav', function()
    randomKljuc = math.random(1000, 9000) -- pravi random integer

    exports.rprogress:Custom({
        Duration = 10000,
        Label = "Generisanje koda...",
        DisableControls = {
            Mouse = false,
            Player = true,
            Vehicle = true
        }
    })

    Wait(10000)
    notifikacija('Dobili ste sigurnosni kljuc: ' .. randomKljuc)
    pozoviServer('esxGlavna:pushajLog', '💵 esxGlavna | Pacific Heist' .. GetPlayerName(source) .. ' je preuzeo sigurnosni kljuc!\nLokacija Za Uzimanje Kljuca: (240.75105, 210.68231, 110.18274)\nLokacija Igraca (' .. GetEntityCoords(PlayerPedId()) .. ')', ESXBalkan.Zelena)

end)

RNE('esxGlavna:generisiKodLowerVault')
AEH('esxGlavna:generisiKodLowerVault', function()
    randomkeyPadKod = math.random(10000, 150000) -- pravi random integer

    exports.rprogress:Custom({
        Duration = 10000,
        Label = "Generisanje koda...",
        DisableControls = {
            Mouse = false,
            Player = true,
            Vehicle = true
        }
    })

    Wait(10000)
    notifikacija('Uspjesno, keypad kod: ' .. randomkeyPadKod)
    pozoviServer('esxGlavna:pushajLog', '💵 esxGlavna | Pacific Heist' .. GetPlayerName(source) .. ' je preuzeo sigurnosni lower vaulta!\nLokacija Za Uzimanje Kljuca: (TODO bilo mrsko)\nLokacija Igraca (' .. GetEntityCoords(PlayerPedId()) .. ')', ESXBalkan.Zelena)

end)

RNE('esxGlavna:hakujKeypad')
AEH('esxGlavna:hakujKeypad', function() 

    local elements = {{label = 'Unesite Kod | 🔢', value = 'keypad_otkljucavanje'}}
		
    ESX.UI.Menu.CloseAll()
    
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wash', {
        title		= 'Laseri Opcije',
        align		= 'top-left',
        elements	= elements
    }, function(data, menu)
        if data.current.value == 'keypad_otkljucavanje' then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'keypad_otkljucavanje_kod_', {
                title = 'SIFRA/KOD'
            }, function(data, menu)
            
                local rezultat = tonumber(data.value)
                
                if rezultat == randomkeyPadKod then
                    pozoviClient('sierra-doorlock:client:setState', 36, false)
                    notifikacija('Vrata su sada otvorena!')
                else
                    menu.close()
                    notifikacija('Neuspjesno, kod nije tacan!')

                end
            end, function(data, menu)
                menu.close()
            end)
        end
        end, function(data, menu)
        menu.close()
    end)
end)
 
-- lotanje lower
Trolly = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s'
    },
    ['animations'] = {
        {'intro', 'bag_intro'},
        {'grab', 'bag_grab', 'cart_cash_dissapear'},
        {'exit', 'bag_exit'}
    }
}

local TrollyAnimation = {
    ['objects'] = {},
    ['scenes'] = {}
}

local trollys = {}
local troliObjekti = {
    {  type = 'trolly', oldModel = 769923921, newModel = 881130828, coords = vector3(302.68652, 217.26814, 96.688095), heading = 256.07186, grab = false},
    {  type = 'trolly', oldModel = 769923921, newModel = 881130828, coords = vector3(294.29196, 221.99208, 96.688125), heading = 256.07186, grab = false},
    {  type = 'trolly', oldModel = 769923921, newModel = 269934519, coords = vector3(308.1264, 233.69676, 96.688148), heading = 184, grab = false},
    {  type = 'trolly', oldModel = 769923921, newModel = 2007413986, coords = vector3(309.07379, 224.3659, 96.688064), heading = 220, grab = false},
}

Citizen.CreateThread(function()
    Citizen.Wait(1)

    local spavanac = true

    while true do
        Citizen.Wait(1)


        for k,v in pairs(troliObjekti) do
            local kordinatePeda = GetEntityCoords(PlayerPedId())
            local distanca = #(kordinatePeda - v['coords'])

            if distanca < 1.5 then
                ESX.ShowHelpNotification('Stisni [E] da lootas!')
                spavanac = false
    
                if IsControlJustReleased(0, 38) then
                    if v['grab'] then
                        notifikacija('Ovaj trolly je vec lootan!')
                    else
                        pocniLootat(k)
                    end

                end
            end
        end

        if spavanac then
            Citizen.Wait(1000)
        end
    end
end)


RegisterNetEvent('esxGlavna:spawnajTrollye')
AddEventHandler('esxGlavna:spawnajTrollye', function()
    for k, v in pairs(troliObjekti) do
        if v['oldModel'] ~= nil and v['type'] == 'trolly' then
            loadModel(v['newModel'])
            trollys[k] = CreateObject(v['newModel'], v['coords'], 1, 0, 0)
            SetEntityHeading(trollys[k], v['heading'])
        end
    end
end)

RegisterCommand('spawnajtrolije', function()
    pozoviClient('esxGlavna:spawnajTrollye')
end)

RegisterNetEvent('client:lootSync')
AddEventHandler('client:lootSync', function(index)
    troliObjekti[index]['grab'] = true
end)

function pocniLootat(index)
    local ped = PlayerPedId()
    local pedCo, pedRotation = GetEntityCoords(ped), vector3(0.0, 0.0, 0.0)
    local grabModel = troliObjekti[index]['newModel']
    local animDict = 'anim@heists@ornate_bank@grab_cash'
    if grabModel == 881130828 then
        grabModel = 'ch_prop_vault_dimaondbox_01a'
    elseif grabModel == 2007413986 then
        grabModel = 'ch_prop_gold_bar_01a'
    elseif grabModel == 3031213828 then
        grabModel = 'prop_coke_block_half_a'
    else
        grabModel = 'hei_prop_heist_cash_pile'
    end
    loadAnimDict(animDict)
    loadModel('hei_p_m_bag_var22_arm_s')

    sceneObject = GetClosestObjectOfType(troliObjekti[index]['coords'], 2.0, troliObjekti[index]['newModel'], false, false, false)
    bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), pedCo, true, false, false)

    while not NetworkHasControlOfEntity(sceneObject) do
        Citizen.Wait(1)
        NetworkRequestControlOfEntity(sceneObject)
    end

    for i = 1, #Trolly['animations'] do
        TrollyAnimation['scenes'][i] = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, TrollyAnimation['scenes'][i], animDict, Trolly['animations'][i][1], 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, TrollyAnimation['scenes'][i], animDict, Trolly['animations'][i][2], 4.0, -8.0, 1)
        if i == 2 then
            NetworkAddEntityToSynchronisedScene(sceneObject, TrollyAnimation['scenes'][i], animDict, "cart_cash_dissapear", 4.0, -8.0, 1)
        end
    end

    NetworkStartSynchronisedScene(TrollyAnimation['scenes'][1])
    Wait(1750)
    pokaziModel(grabModel)
    NetworkStartSynchronisedScene(TrollyAnimation['scenes'][2])
    Wait(37000)
    NetworkStartSynchronisedScene(TrollyAnimation['scenes'][3])
    Wait(2000)

    local emptyobj = 769923921
    newTrolly = CreateObject(emptyobj, troliObjekti[index]['coords'],  true, false, false)
    SetEntityRotation(newTrolly, 0, 0, GetEntityHeading(sceneObject), 1, 0)
    DeleteObject(sceneObject)
    DeleteObject(bag)
end

function pokaziModel(grabModel)
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)

    if grabModel == 'ch_prop_vault_dimaondbox_01a' then
        nagrada = ESXBalkan.TrollyItemi['diamondTrolly']
    elseif grabModel == 'ch_prop_gold_bar_01a' then
        nagrada = ESXBalkan.TrollyItemi['goldTrolly']
    elseif grabModel == 'prop_coke_block_half_a' then
        nagrada = ESXBalkan.TrollyItemi['cokeTrolly']
    elseif grabModel == 'hei_prop_heist_cash_pile' then
        nagrada = ESXBalkan.TrollyItemi['cashTrolly']
    end

    local grabmodel = GetHashKey(grabModel)

    loadModel(grabmodel)
    local grabobj = CreateObject(grabmodel, pedCoords, true)

    FreezeEntityPosition(grabobj, true)
    SetEntityInvincible(grabobj, true)
    SetEntityNoCollisionEntity(grabobj, ped)
    SetEntityVisible(grabobj, false, false)
    AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
    local startedGrabbing = GetGameTimer()

    Citizen.CreateThread(function()
        while GetGameTimer() - startedGrabbing < 37000 do
            Citizen.Wait(1)
            DisableControlAction(0, 73, true)
            if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
                if not IsEntityVisible(grabobj) then
                    SetEntityVisible(grabobj, true, false)
                end
            end
            if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
                if IsEntityVisible(grabobj) then
                    SetEntityVisible(grabobj, false, false)
                    pozoviServer('esxGlavna:trollyReward', nagrada)

                    for k,v in pairs(troliObjekti) do
                        v['grab'] = true
                        pozoviServer('esxGlavna:server:lootSinkronizacija', k)
                        print(v['grab'])
                    end
                end
            end
        end
        DeleteObject(grabobj)
    end)
end

RNE('esxGlavna:lootajProp')
AEH('esxGlavna:lootajProp', function()
    ESX.TriggerServerCallback('esxGlavna:povuciBrojPokupljenih', function(pokupljene) 
        if pokupljene ~= ESXBalkan.LowerVaultPropMaxUzimanje then
            local igrac = PlayerId()
            local igracPed = GetPlayerPed(igrac)
            local igracPos = GetEntityCoords(igracPed, false)
             
            local prop = GetClosestObjectOfType(igracPos.x, igracPos.y, igracPos.z, 200.0, GetHashKey(ESXBalkan.LowerVaultProp), false, 0, 0)
            if prop ~= 0 then
                SetEntityAsMissionEntity(prop, true, true)
                DeleteObject(prop)
                SetEntityAsNoLongerNeeded(prop)
            end
            
            pozoviServer('esxGlavna:propLoot')

            Citizen.Wait(1000)
        else
            notifikacija('Ne mozete pokupiti vise koverti!')
        end
    end)
end)

RNE('esxGlavna:bushi')
AEH('esxGlavna:bushi', function()
    if GetResourceKvpString('sefoviLootani') == 'jesu' then
        notifikacija('Sefovi su vec izbuseni!')
        return
    end

    izbusiSefove()
end)

local LaserDrill = {
    ['animations'] = {
        {'intro', 'bag_intro', 'intro_drill_bit'},
        {'drill_straight_start', 'bag_drill_straight_start', 'drill_straight_start_drill_bit'},
        {'drill_straight_end_idle', 'bag_drill_straight_idle', 'drill_straight_idle_drill_bit'},
        {'drill_straight_fail', 'bag_drill_straight_fail', 'drill_straight_fail_drill_bit'},
        {'drill_straight_end', 'bag_drill_straight_end', 'drill_straight_end_drill_bit'},
        {'exit', 'bag_exit', 'exit_drill_bit'},
    },
    ['scenes'] = {}
}

-- FUNKCIJE
function izbusiSefove()
    ESX.TriggerServerCallback('esxGlavna:itemCallback', function(hasItem, itemLabel)
        if hasItem then
            --TriggerServerEvent('casinoheist:server:drillSync')
            local ped = PlayerPedId()
            local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
            local animDict = 'anim_heist@hs3f@ig9_vault_drill@laser_drill@'
            loadAnimDict(animDict)
            local bagModel = 'hei_p_m_bag_var22_arm_s'
            loadModel(bagModel)
            local laserDrillModel = 'ch_prop_laserdrill_01a'
            loadModel(laserDrillModel)

            cam = CreateCam("DEFAULT_ANIMATED_CAMERA", true)
            SetCamActive(cam, true)
            RenderScriptCams(true, 0, 3000, 1, 0)

            bag = CreateObject(GetHashKey(bagModel), pedCo, 1, 0, 0)
            laserDrill = CreateObject(GetHashKey(laserDrillModel), pedCo, 1, 0, 0)
            
            vaultPos = vector3(317.71707, 211.51507, 97.688117)
            vaultRot = vector3(0, 0, 0)

            for i = 1, #LaserDrill['animations'] do
                LaserDrill['scenes'][i] = NetworkCreateSynchronisedScene(vaultPos, vaultRot, 2, true, false, 1065353216, 0, 1.3)
                NetworkAddPedToSynchronisedScene(ped, LaserDrill['scenes'][i], animDict, LaserDrill['animations'][i][1], 4.0, -4.0, 1033, 0, 1000.0, 0)
                NetworkAddEntityToSynchronisedScene(bag, LaserDrill['scenes'][i], animDict, LaserDrill['animations'][i][2], 1.0, -1.0, 1148846080)
                NetworkAddEntityToSynchronisedScene(laserDrill, LaserDrill['scenes'][i], animDict, LaserDrill['animations'][i][3], 1.0, -1.0, 1148846080)
            end

            NetworkStartSynchronisedScene(LaserDrill['scenes'][1])
            PlayCamAnim(cam, 'intro_cam', animDict, vaultPos, vaultRot, 0, 2)
            Wait(GetAnimDuration(animDict, 'intro') * 1000)

            NetworkStartSynchronisedScene(LaserDrill['scenes'][2])
            PlayCamAnim(cam, 'drill_straight_start_cam', animDict, vaultPos, vaultRot, 0, 2)
            Wait(GetAnimDuration(animDict, 'drill_straight_start') * 1000)

            NetworkStartSynchronisedScene(LaserDrill['scenes'][3])
            PlayCamAnim(cam, 'drill_straight_idle_cam', animDict, vaultPos, vaultRot, 0, 2)

            Drilling.Start(function(uspjesno)
                if uspjesno then
                    NetworkStartSynchronisedScene(LaserDrill['scenes'][5])
                    PlayCamAnim(cam, 'drill_straight_end_cam', animDict, vaultPos, vaultRot, 0, 2)
                    Wait(GetAnimDuration(animDict, 'drill_straight_end') * 1000)
                    NetworkStartSynchronisedScene(LaserDrill['scenes'][6])
                    PlayCamAnim(cam, 'exit_cam', animDict, vaultPos, vaultRot, 0, 2)
                    Wait(GetAnimDuration(animDict, 'exit') * 1000)
                    RenderScriptCams(false, false, 0, 1, 0)
                    DestroyCam(cam, false)
                    ClearPedTasks(ped)
                    DeleteObject(bag)
                    DeleteObject(laserDrill)
                    SetEntityAlpha(vault, 0, 0)

                    PlayCutscene('hs3f_mul_vlt')
                    SetEntityAlpha(vault, 255, 0)
                    vaultLoop = false

                    pozoviServer('esxGlavna:sefoviNagrada')
                    SetResourceKvp('sefoviLootani', 'jesu')

                else
                    NetworkStartSynchronisedScene(LaserDrill['scenes'][4])
                    PlayCamAnim(cam, 'drill_straight_fail_cam', animDict, vaultPos, vaultRot, 0, 2)
                    Wait(GetAnimDuration(animDict, 'drill_straight_fail') * 1000 - 1500)
                    RenderScriptCams(false, false, 0, 1, 0)
                    DestroyCam(cam, false)
                    ClearPedTasks(ped)
                    DeleteObject(bag)
                    DeleteObject(laserDrill)
                    notifikacija('Neuspjesno, pokusajte ponovo!')

                    SetResourceKvp('sefoviLootani', 'nisu')

                end
            end)
        else
            notifikacija('Potrebna vam je busilica!')
        end
    end, 'water')
end

RNE('esxGlavna:postaviC4')
AEH('esxGlavna:postaviC4', function()
    exports.rprogress:Custom({
        Duration = 4000,
        Label = "Stavljanje C4 eksploziva...",
        DisableControls = {
            Mouse = false,
            Player = true,
            Vehicle = true
        }
    })

    Wait(4000)

    mozeRaznijeti = true
    notifikacija('Eksploziv je postavljen!')

end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)

        if mozeRaznijeti then
            ESX.ShowHelpNotification('Pritisni ~INPUT_DETONATE~ da razneses bravu!')
    
            if IsControlJustReleased(0, 47) then
                pozoviClient('esxGlavna:detonirajC4')
            end
        end
    end
end)


RNE('esxGlavna:detonirajC4')
AEH('esxGlavna:detonirajC4', function()
    AddExplosion(304.10113, 230.87936, 97.688125 , 0, 0, 1, 0, 1065353216, 0)
    AddExplosion(304.10113, 230.87936, 97.688125 , 0, 0, 1, 0, 1065353216, 0)

    notifikacija('Brava se sjebala, ulijeci!')
	pozoviClient('sierra-doorlock:client:setState', 35, false)

    mozeRaznijeti = false
end)

-- FUNCKIE

function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(0)
    end
end

function crtaj2dtekst(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
 
function plantajThermal()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(256.88, 220.27, 106.28, rotx, roty, rotz + 0.50, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 256.88, 220.27, 106.28,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)

    exports.rprogress:Custom({
        Duration = 4000,
        Label = "Stavljanje bombe...",
        DisableControls = {
            Mouse = false,
            Player = true,
            Vehicle = true
        }
    })

    SetFollowPedCamViewMode(4) -- seta ga u first person jer je gas

    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), 256.88, 220.27, 106.28 + 0.2,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)

    Citizen.Wait(4000)
    notifikacija('Postavili ste termalnu bombu!')


    SetFollowPedCamViewMode(1)
	--TriggerEvent("bfunkcije:tajmerdosto", "Topljenje Brave...", 12, true, function(jel) end)

    exports.rprogress:Custom({
        Duration = 12000,
        Label = "Topljenje brave...",
        DisableControls = {
            Mouse = false,
            Player = false,
            Vehicle = true
        }
    })
    
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)

    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", 256.88, 220.27, 106.28, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)

    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(2000)
    ClearPedTasks(ped)
    Citizen.Wait(2000)

    DeleteObject(bomba)
    Citizen.Wait(9000)

    notifikacija('Vrata su se istopila!')
    notifikacija('Nastavite ka panelu za hakovanje!')
    
	pozoviClient('sierra-doorlock:client:setState', 32, false)
	
    StopParticleFxLooped(effect, 0)
end

function plantajThermalDva()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(251.8756, 221.06, 101.83, rotx, roty, rotz + 0.50, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 251.8756, 221.06, 101.83,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)

    exports.rprogress:Custom({
        Duration = 4000,
        Label = "Stavljanje bombe...",
        DisableControls = {
            Mouse = false,
            Player = true,
            Vehicle = true
        }
    })

    SetFollowPedCamViewMode(4) -- seta ga u first person jer je gas

    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), 251.8756, 221.06, 101.83 + 0.2,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)

    Citizen.Wait(4000)
    notifikacija('Postavili ste termalnu!')


    SetFollowPedCamViewMode(1)

    exports.rprogress:Custom({
        Duration = 12000,
        Label = "Topljenje brave...",
        DisableControls = {
            Mouse = false,
            Player = false,
            Vehicle = true
        }
    })    
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)

    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", 251.8756, 221.06, 101.83, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)

    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(2000)
    ClearPedTasks(ped)
    Citizen.Wait(2000)

    DeleteObject(bomba)
    Citizen.Wait(9000)

    notifikacija('Vrata su se istopila!')
    
	pozoviClient('sierra-doorlock:client:setState', 29, false)
	
    StopParticleFxLooped(effect, 0)
end


function hakovanje(kordinatePanela)
    local loc = kordinatePanela

    local animDict = "anim@heists@ornate_bank@hack"

    SetFollowPedCamViewMode(4)

    RequestAnimDict(animDict)
    RequestModel("hei_prop_hst_laptop")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestModel("hei_prop_heist_card_hack_02")
    while not HasAnimDictLoaded(animDict)
        or not HasModelLoaded("hei_prop_hst_laptop")
        or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
        or not HasModelLoaded("hei_prop_heist_card_hack_02") do
        Citizen.Wait(100)
    end
    local ped = PlayerPedId()
    local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))

    local animPos = GetAnimInitialOffsetPosition(animDict, "hack_enter", loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
    local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
    local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)

    FreezeEntityPosition(ped, true)
    local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), targetPosition, 1, 1, 0)
    local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), targetPosition, 1, 1, 0)
    local card = CreateObject(GetHashKey("hei_prop_heist_card_hack_02"), targetPosition, 1, 1, 0)

    NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, "hack_enter_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, "hack_enter_laptop", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(card, netScene, animDict, "hack_enter_card", 4.0, -8.0, 1)

    local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(card, netScene2, animDict, "hack_loop_card", 4.0, -8.0, 1)

    local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(card, netScene3, animDict, "hack_exit_card", 4.0, -8.0, 1)

    SetPedComponentVariation(ped, 5, 0, 0, 0)
    Citizen.Wait(200)
    NetworkStartSynchronisedScene(netScene)
    Citizen.Wait(6300)
    NetworkStartSynchronisedScene(netScene2)
    Citizen.Wait(2000)

    TriggerEvent('open:minigame', function(uspjesno) 
		if uspjesno then
            if brojPanela == 1 then
                notifikacija('Hakovanje uspjesno, nastavite!')
                pozoviClient('sierra-doorlock:client:setState', 31, false) 
                upaliLasere()
                hakovanjeZavrseno = true 
            elseif brojPanela == 2 then
                print('dvojka')
                pozoviClient('esxGlavna:vault')

                lootaUpperVault = true
                notifikacija('Hakovanje uspjesno, vrata sefa ce se zatvoriti za 360 SEKUNI!')
                pozoviClient('esxGlavna:pokreni:gornjiVaultTimer')

                hakovanjeZavrseno = true 
            elseif brojPanela == 3 then
                print('trojka')
                hakovanjeZavrseno = true 

                notifikacija('Hakovanje uspjesno, nastavite!')
                pozoviClient('sierra-doorlock:client:setState', 33, false) 
                pozoviClient('sierra-doorlock:client:setState', 34, false) 
            end
		else
            notifikacija('Hakovanje neuspjesno, pokusajte ponovno!')
		end
	end)

    while not hakovanjeZavrseno do
        Citizen.Wait(1)
    end
    Citizen.Wait(1500)
    NetworkStartSynchronisedScene(netScene3)
    Citizen.Wait(4600)
    NetworkStopSynchronisedScene(netScene3)
    DeleteObject(bag)
    DeleteObject(laptop)
    DeleteObject(card)
    FreezeEntityPosition(ped, false)
    SetPedComponentVariation(ped, 5, 45, 0, 0)

    SetFollowPedCamViewMode(1)
end

-- ZA RESTART
  
  
