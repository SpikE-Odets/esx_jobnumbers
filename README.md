# esx_jobnumbers

This is a simple Dev Resource that will allow you to pull the amount of people online for any job on the server without any ServerCallBack.   

This version also gives option for checking job numbers server side instead of client side only in the first version.


```
To check the numbercount for any job in a script (client/server) is done the same way..


if GlobalState.jobnumbers['cops'] > 0 then

  this code will only run if atleast 1 person on the server
  is set as a police

end



You will need to Edit the Config.Jobnames to suit your server, but I have left in general names to give you and example. 

You can use 

Config.JobNames = {
   ['police'] = 'cops',
   ['sheriff'] = 'cops',
   ['ambulance'] = 'medic',
   ['doctor'] = 'medic',
   ['mechanic'] = 'mechanic',
}

and you can count  police/sheriff in the same total.. or you can do

Config.JobNames = {
   ['police'] = 'police',
   ['sheriff'] = 'sheriff',
   ['ambulance'] = 'ambulance',
   ['doctor'] = 'doctor',
   ['mechanic'] = 'mechanic',
}

and each job will have a seperate count.

SpikE
