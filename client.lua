local JobCount = {}
local PlayerData = {}


Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()

    if PlayerData.job ~= nil then
        TriggerServerEvent('esx_jobnumbers:setjobnumbers', PlayerData.job)
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	TriggerServerEvent('esx_jobnumbers:changejob', job)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    TriggerServerEvent('esx_jobnumbers:setjobnumbers', xPlayer.job)
end)


