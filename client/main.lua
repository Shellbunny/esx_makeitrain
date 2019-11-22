ESX                           = nil
local Stage = { x = 114.90000000000, y = -1285.85000000000, z = 27.260000000000, h = 180.4409942627 }

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local plyCoords = GetEntityCoords(PlayerPedId(), 0)
        local distance = #(vector3(Stage.x, Stage.y, Stage.z) - plyCoords)
        if distance < 10 then
            if not IsPedInAnyVehicle(PlayerPedId(), true) then
                if distance < 3 then
                    ESX.Game.Utils.DrawText3D(vector3(Stage.x, Stage.y, Stage.z + 0.5), '[E] Make it rain', 0.4)
					if IsControlJustReleased(0, 54) then 
							
                                    RequestNamedPtfxAsset("core")
                                    cash = CreateObject(GetHashKey("prop_cash_pile_01"), 0, 0, 0, true, true, true) 
                                    AttachEntityToEntity(cash, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 18905), 0.12, 0.028, 0.001, 300.00, 180.0, 20.0, true, true, false, true, 1, true)
                                    local lib, anim = 'anim@mp_player_intcelebrationfemale@raining_cash', 'raining_cash' do
                                    Citizen.Wait(900)
                                    ESX.Streaming.RequestAnimDict(lib, function()
                                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0 , -1 , -1 , 0 , 0 , false , false , false);
                                    Citizen.Wait(1000)
                                    UseParticleFxAssetNextCall("core")
                                    local fx = StartParticleFxNonLoopedOnEntity("ent_brk_banknotes", PlayerPedId(), 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, false, false, false)  --(effectName, entity, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, scale, axisX, axisY, axisZ);
                                        end)
                                    end
                                TriggerServerEvent('esx_makeitrain:pay')
                                Citizen.Wait(4000)
                                DeleteEntity(cash)
                                Citizen.Wait(1000)
                            end
                        end
                    end
                end
            end
        end
)
