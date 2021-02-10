--/$$$$$$$$ /$$                 /$$$$$$$                                  /$$                     /$$  /$$$$$$                     
--|__  $$__/| $$                | $$__  $$                                | $$                    | $$ /$$__  $$                    
--   | $$   | $$$$$$$   /$$$$$$ | $$  \ $$  /$$$$$$   /$$$$$$   /$$$$$$$ /$$$$$$    /$$$$$$   /$$$$$$$| $$  \__/ /$$   /$$ /$$   /$$
--   | $$   | $$__  $$ /$$__  $$| $$$$$$$  /$$__  $$ /$$__  $$ /$$_____/|_  $$_/   /$$__  $$ /$$__  $$| $$ /$$$$| $$  | $$| $$  | $$
--   | $$   | $$  \ $$| $$$$$$$$| $$__  $$| $$  \ $$| $$  \ $$|  $$$$$$   | $$    | $$$$$$$$| $$  | $$| $$|_  $$| $$  | $$| $$  | $$
--   | $$   | $$  | $$| $$_____/| $$  \ $$| $$  | $$| $$  | $$ \____  $$  | $$ /$$| $$_____/| $$  | $$| $$  \ $$| $$  | $$| $$  | $$
--   | $$   | $$  | $$|  $$$$$$$| $$$$$$$/|  $$$$$$/|  $$$$$$/ /$$$$$$$/  |  $$$$/|  $$$$$$$|  $$$$$$$|  $$$$$$/|  $$$$$$/|  $$$$$$$
--   |__/   |__/  |__/ \_______/|_______/  \______/  \______/ |_______/    \___/   \_______/ \_______/ \______/  \______/  \____  $$
--                                                                                                                         /$$  | $$
--                                                                                                                        |  $$$$$$/
--                                                                                                                         \______/ 


vRP = Proxy.getInterface("vRP")
local ped = false
local lars = true


Citizen.CreateThread(function () 
    while true do 
        Citizen.Wait(1) 
        local spiller = PlayerPedId() 
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 823.93383789063,-1993.8959960938,29.301322937012) < 0.7 then 
            DrawText3Ds(823.93383789063,-1993.8959960938,29.301322937012, "Tryk [~r~E~s~] for at hvidvaske pengene 1000kr! (85% tilbage!)")
            if (IsControlJustReleased(1, 38)) then 
                exports['progressBars']:startUI(6000, "Hvidvasker pengene!")
                FreezeEntityPosition(PlayerPedId(), true) 
                TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                  Citizen.Wait(6000)
                  ClearPedTasksImmediately(GetPlayerPed(-1))
                  FreezeEntityPosition(PlayerPedId(), false)
                  Citizen.Wait(1)
                TriggerServerEvent('theboostedguy:starthvidvask')
            end
        end
    end
end)


Citizen.CreateThread(function() 
    if ped == false then 
        RequestModel(GetHashKey('csb_chin_goon')) 
            while not HasModelLoaded('csb_chin_goon') do 
                Citizen.Wait(100) 
            end 
        Ped = CreatePed(4, 0xA8C22996, 823.93566894531,-1993.8768310547,28.301357269287,311.41748046875, false, true) 
        SetEntityHeading(Ped, 311.41748046875) 
        FreezeEntityPosition(Ped, true) 
        SetEntityInvincible(Ped, true) 
        SetBlockingOfNonTemporaryEvents(Ped, true) 
        RequestAnimDict("amb@world_human_hang_out_street@male_c@base") 
            while not HasAnimDictLoaded("amb@world_human_hang_out_street@male_c@base") do 
                Citizen.Wait(100) 
            end 
        TaskPlayAnim(Ped, "amb@world_human_hang_out_street@male_c@base", "base", 8.0, 8.0, -1, 1, 0, 0, 0, 0) 
        ped = false 
    end 
end)



--#region_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________--#endregion



function DrawText3Ds(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
end
