ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
					
		for i = 1, #locations, 1 do
                loc = locations[i]
                
                DrawMarker(
                    loc.marker,
                    loc.pos.x,
                    loc.pos.y,
                    loc.pos.z-0.75,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    loc.scale,
                    loc.scale,
                    loc.scale,
                    loc.rgba[1],
                    loc.rgba[2],
                    loc.rgba[3],
                    loc.rgba[4],
                    false,
                    true,
                    2,
                    nil,
                    nil,
                    false
                )
				if loc.submarker ~= nil then DrawMarker(
                    loc.submarker.marker,loc.pos.x,loc.pos.y,loc.submarker.posz,
                    0.0,0.0,0.0,0.0,0.0,0.0,
                    loc.scale/2,loc.scale/2,loc.scale/2,
                    loc.rgba[1],loc.rgba[2],loc.rgba[3],loc.rgba[4],
                    false,true,2,nil,nil,false) end
				local playerCoord = GetEntityCoords(PlayerPedId(), false)
                local locVector = vector3(loc.pos.x, loc.pos.y, loc.pos.z)
                if Vdist2(playerCoord, locVector) < loc.scale*1.12 and GetVehiclePedIsIn(PlayerPedId(), false) == 0 then
					TriggerServerEvent('magic')
				end

end)
