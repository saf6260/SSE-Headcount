# SSE-Headcount
An automated bash script for recording headcount

## Running the Script
The system is executable from start so cd into your OS's folder (sorry OSX there isnt one for you) in a bash shell and type `./headcount.sh` This will start the script. From there, it will notify you every time the time is 30 minutes past the hour until you stop it.

## System Information
Notifies, in our case, a mentor on duty every time the current time is 30 minutes past the hour
Once script starts, the system automatically finds the number of minutes til its 30 minutes past the hour
After the system finds the difference, it sleeps for that amount of time
Upon waking up, the system checks again to see if the current time is 30 minutes past the hour
As soon as it is, the system calls a function and then sleeps for one hour

The function call just opens all of the websites needed to complete headcount and a reminder to do headcount
