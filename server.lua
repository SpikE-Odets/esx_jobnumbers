ESX = nil
local serverjobs, droppedplayer, currentplayer = {}, {}, {}
local IsBusy = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('playerDropped', function()
    _source = source
   table.insert(droppedplayer, _source)
end)

RegisterServerEvent('esx_jobnumbers:setjobnumbers')
AddEventHandler('esx_jobnumbers:setjobnumbers', function(jobname)
    local _source = source 
    local buildlist = { id = _source, job = jobname,}
    table.insert(currentplayer, buildlist)
end)


function AnnounceJobs()
    local sendingjobs = {}
    for i, v in pairs(serverjobs) do
        if sendingjobs[v.jobname] == nil then
            sendingjobs[v.jobname] = 1
        else
            sendingjobs[v.jobname] = sendingjobs[v.jobname] + 1
        end
    end
    TriggerClientEvent('esx_jobnumbers:setjobs', -1, sendingjobs)
    TriggerEvent('esx_jobnumbers:setjobs', sendingjobs)
end


Citizen.CreateThread(function()
    while true do
        sleep = 1000
        if #droppedplayer > 0 then
            for i, v in pairs(serverjobs) do
                if v.id == droppedplayer[1] then
                    table.remove(serverjobs, i)
                    break
                end
            end
            AnnounceJobs()
            table.remove(droppedplayer, 1)
        end
        
        if #currentplayer > 0 then
            local updated = false
            for i, v in pairs(serverjobs) do
                if v.id == currentplayer[1].id then
                    for i,v in pairs(Config.MultiNameJobs) do
                        for c, u in pairs(v) do
                            if u == currentplayer[1].job.name then
                                currentplayer[1].job.name = i
                                ismulti = true
                            end
                        end
                    end
                    v.jobname = currentplayer[1].job.name
                    updated = true
                end
            end
                
            if not updated then
                for i,v in pairs(Config.MultiNameJobs) do
                    for c,u in pairs(v) do
                        if u == currentplayer[1].job.name then
                            currentplayer[1].job.name = i
                        end
                    end
                end
                buildlist = { id = currentplayer[1].id, jobname = currentplayer[1].job.name}
                table.insert(serverjobs, buildlist)
            end
            print('running announcejob for currentplayer')
            AnnounceJobs()
            table.remove(currentplayer, 1)

            print('This is after accouncejobs: '..tostring(#currentplayer))
        end
        Citizen.Wait(sleep)
	end
end)



