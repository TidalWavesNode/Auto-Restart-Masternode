# Wagerr

This will install a script and add a crontab line that will check to see if wagerrd is running on your masternode. If it is running great if it is not then it will start it automagically for you.  

# Installation:
Log into the server using ssh (Putty for windows or terminal for Mac users) and run the following commands:

wget -q https://raw.githubusercontent.com/TidalWavesNode/Auto-Restart-Masternode/master/auto.sh

bash auto.sh

Answer Yes to prompts

# Details:
mn_auto.sh will be created in the ~/wagerr-2.0.0/bin/ directory
The created cron task will run every 15 minutes and create a log output in the created ~/wagerr-2.0.0/bin/cronlog directory
The timing can be modified by the following command
sudo crontab -e

locate the line (*/15 * * * * /root/wagerr-2.0.0/bin/mn_auto.sh >> /root/wagerr-2.0.0/bin/cronlog/auto.log 2>&1 #logs output to auto.log)

Modify based on your required time frame 
Time intervals are denoted by numbers and operators filled in place of each asterisk in a Cron job’s crontab line. From left to right, the asterisks represent:

Minutes specified as a number from 0 to 59.
Hours specified as numbers from 0 to 23.
Days of the month, specified as numbers from 1 to 31.
Months specified as numbers from 1 to 12.
Days of the week, specified as numbers from 0 to 7, with Sunday represented as either/both 0 and 7.

# Examples:
# 1 minute 
*/1 * * * * /root/wagerr-2.0.0/bin/mn_auto.sh >> /root/wagerr-2.0.0/bin/cronlog/auto.log 2>&1 #logs output to auto.log

# 5 minutes
*/5 * * * * /root/wagerr-2.0.0/bin/mn_auto.sh >> /root/wagerr-2.0.0/bin/cronlog/auto.log 2>&1 #logs output to auto.log

# 30 minutes
*/30 * * * * /root/wagerr-2.0.0/bin/mn_auto.sh >> /root/wagerr-2.0.0/bin/cronlog/auto.log 2>&1 #logs output to auto.log

# Testing:
1. stop masternode
cd ~/wagerr-2.0.0/bin/
./wagerr-cli stop

cd ~/wagerr-2.0.0/bin/cronlog 
watch cat auto.log #(ctrl-c to break watch)
cat auto.log
***or***
watch grep CRON /var/log/syslog (ctrl-c to break watch) #this will show all the times the cron job ran
