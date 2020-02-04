# esx_jobnumbers

This is a simple Dev Resource that will allow you to pull the amount of people online for any job on the server with a export.  I am only uplaoding this as any other script i upload from this point fwd that will need to do a job # check will use this script.


example: 

- if  exports["esx_jobnumbers"]:jobonline('police') > PoliceNeeded then


This script is setup to handle multiple job names for same occupation.

example:

- if  exports["esx_jobnumbers"]:jobonline('cops') > PoliceNeeded then 
  - will return the amount of all workers for the job listed in the config list called cops (example has  'police', 'sheriff')


