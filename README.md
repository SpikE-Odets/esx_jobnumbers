# esx_jobnumbers

This is a simple Dev Resource that will allow you to pull the amount of people online for any job on the server with a NetEvent.  I have gone away from using a export for because of performance/security issues.  This method will still update the count as soon as a person joins or leaves the server.  

This version also gives option for checking job numbers server side instead of client side only in the first version.


```
Any script you place this Event in will need to have a local added to it:    local JobCount = {}

* This event will need to be pasted into any client script that you want to use to check online numbers:

RegisterNetEvent('esx_jobnumbers:setjobs')
AddEventHandler('esx_jobnumbers:setjobs', function(jobslist)
  JobCount = jobslist
    if JobCount['cops'] ~= nil then
      CopsOnline = JobCount['cops']
    else
      CopsOnline = 0
    end
    
    if JobCount['ambulance'] ~= nil then
      EmsOnline = JobCount['ambulance']
    else
      EmsOnline = 0
    end
end)

* This Event can be pasted into any server script to be able to check online numbers:


RegisterServerEvent('esx_jobnumbers:setjobs')
AddEventHandler('esx_jobnumbers:setjobs', function(jobslist)
  JobCount = jobslist
  if JobCount['cops'] ~= nil then
    CopsOnline = JobCount['cops']
  else
    CopsOnline = 0
  end
    
  if JobCount['ambulance'] ~= nil then
    EmsOnline = JobCount['ambulance']
  else
    EmsOnline = 0
  end
end)


