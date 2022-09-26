ESX = nil
local currentplayers, currentcounts = {}, {}


CreateThread(function()
    GlobalState.jobnumbers = {}
    for i,v in pairs(Config.JobNames) do
        if currentcount[v] == nil then
            currentcount[v] = 0
        end
    end
end)

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('playerDropped', function()
    _source = source
    local currentjob = currentplayers[_source]
    if currentcounts[currentjob] > 0 then
        currentcounts[currentjob] = currentcounts[currentjob] - 1
        GlobalState.jobnumbers = currentcounts
    end
end)

RegisterServerEvent('esx_jobnumbers:setjobnumbers')
AddEventHandler('esx_jobnumbers:setjobnumbers', function(job)
     local playerId = source
    if currentplayers[playerId] == nil then
        if Config.JobNames[job.name] then
            job.name  = Config.JobNames[job.name]
        end
        currentplayers[playerId] = job.name
        if currentcounts[job.name] ~= nil then
            currentcounts[job.name] = currentcounts[job.name] + 1
        else
            currentcounts[job.name] = 1
        end
        GlobalState.jobnumbers = currentcounts
    end
end)


RegisterServerEvent('esx_jobnumbers:changejob')
AddEventHandler('esx_jobnumbers:changejob', function(job)
    local playerId = source
    currentcounts[currentplayers[playerId]] = currentcounts[currentplayers[playerId]] - 1
    if Config.MultiNameJobs[job.name] then
        job.name  = Config.MultiNameJobs[job.name]
    end
    currentplayers[playerId] = job.name
    if currentcounts[job.name] ~= nil then
        currentcounts[job.name] = currentcounts[job.name] + 1
    else
        currentcounts[job.name] = 1
    end
    GlobalState.jobnumbers = currentcounts
end)

