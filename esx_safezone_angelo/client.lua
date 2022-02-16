local ESX      	 = nil
local PlayerData = {}
local joinIN = false
local out = false
local closestZone = 1

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.ESX, function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent(Config.ESXJOB)
AddEventHandler(Config.ESXJOB, function(job)
  	PlayerData.job = job
end) 
 
--DONT TOUCH
Citizen.CreateThread(function()
     while not NetworkIsPlayerActive(PlayerId()) do
        Citizen.Wait(0)
      end       
      while true do
      local playerPed = GetPlayerPed(-1)
      local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
      local minDistance = 150000
         for i = 1, #Config.Coords, 1 do
              dist = Vdist(Config.Coords[i].x, Config.Coords[i].y, Config.Coords[i].z, x, y, z)
             if dist < minDistance then
                 minDistance = dist
                closestZone = i
            end
        end
        Citizen.Wait(15000)
    end
end)
    

    
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
         DisableControlAction(1, 140, true)
       end
end)
--DONT TOUCH END    

    
 ---Screen 
 function DrawScreen(x,y ,width,height,scale, text, r,g,b,a)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end
 ----Screen End

--BLIPS
Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do
        Citizen.Wait(0)
    end
    for i = 1, #Config.CoordsBlips, 1 do
        local szBlip = AddBlipForCoord(Config.CoordsBlips[i].x, Config.CoordsBlips[i].y, Config.CoordsBlips[i].z)
        SetBlipAsShortRange(szBlip, true)
        SetBlipColour(szBlip, Config.BlipColour)  
        SetBlipSprite(szBlip, Config.BlipSprite) 
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Strings['blip_text']) 
        EndTextCommandSetBlipName(szBlip)
    end
end)
--BLIPS END


--jOBS 
Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do
        Citizen.Wait(0)
    end
    
    while true do
        Citizen.Wait(0)
        local player = GetPlayerPed(-1)
        local x,y,z = table.unpack(GetEntityCoords(player, true))
        local dist = Vdist(Config.Coords[closestZone].x, Config.Coords[closestZone].y, Config.Coords[closestZone].z, x, y, z)

        if dist <= 80.0 then  
            DrawScreen(Config.width, Config.height, 1.0,1.0,0.45, Strings['screen_text'], Config.R, Config.G, Config.B, Config.Opacity)
            if not joinIN then														
                NetworkSetFriendlyFireOption(true)
                ClearPlayerWantedLevel(PlayerId())
                SetCurrentPedWeapon(player,GetHashKey(Config.Weapon),true)
                joinIN = true
                out = false
                ShowNotification(Strings['notification_text'])
            end
        else
            if not out then
                out = true
                joinIN = false
                ShowNotification(Strings['notification_text2'])
            end
        end
        if joinIN and (PlayerData.job ~= nil and PlayerData.job.name ~= Config.AllowedJobs1 and PlayerData.job.name ~= Config.AllowedJobs2 and PlayerData.job.name ~= Config.AllowedJobs3 and PlayerData.job.name ~= Config.AllowedJobs4 and PlayerData.job.name ~= Config.AllowedJobs5) then
            DisableControlAction(2, 37, true) 
            DisablePlayerFiring(player,true)
            DisableControlAction(0, 106, true) 
            
            DisableControlAction(0, 68, true)
            DisableControlAction(0, 69, true)
            DisableControlAction(0, 70, true)
            DisableControlAction(0, 90, true)
            DisableControlAction(0, 91, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 167, true)
            SetCurrentPedWeapon(player,GetHashKey(Config.Weapon),true)
        end
    end
end)
--JOBS END

--Notification
function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0,1)
end
RegisterNetEvent('esx_safezone_angelo:client:showNotification')
AddEventHandler('esx_safezone_angelo:client:showNotification', function(str)
    ShowNotification(str)
end)
--NotificationEND