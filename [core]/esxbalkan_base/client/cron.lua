local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end
    
    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)
    
    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next
    
    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end

function EnumerateObjects()
  return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
  return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
  return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

RegisterNetEvent("esxbalkan_base")
AddEventHandler("esxbalkan_base", function ()
  local journey = GetHashKey('journey')
    for vehicle in EnumerateVehicles() do
        if GetEntityModel(vehicle) ~= journey then
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
            SetEntityAsMissionEntity(vehicle, false, false) 
            SetModelAsNoLongerNeeded(vehicle)
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then 
                DeleteVehicle(vehicle) 
            end
          end
        end
    end
end)

RegisterNetEvent("esxbalkan_base")
AddEventHandler("esxbalkan_base", function ()
  local ped = PlayerPedId()
    for ped in EnumeratePeds() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(ped, -1))) then 
            SetEntityAsMissionEntity(ped, false, false) 
            DeletePed(ped)
            if (DoesEntityExist(ped)) then 
              DeletePed(ped) 
            end
        end
    end
end)

