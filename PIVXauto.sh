#!/bin/bash
read -p "Do you want to create the mn_auto script? (Y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

cd ~/pivx-3.1.1/bin

cat <<EOT > mn_auto.sh
#!/bin/bash
SERVICE='pivxd'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
echo “Masternode is running! Yay!”
else
~/pivx-3.1.1/bin/./pivxd
fi
EOT

chmod 744 mn_auto.sh
fi

read -p "Do you want to add the required cron task? (Y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

crontab -l | { cat; echo "*/15 * * * * /root/pivx-3.1.1/bin/mn_auto.sh >> /root/pivx-3.1.1/bin/cronlog/auto.log 2>&1 #logs output to auto.log"; } | crontab - l

mkdir cronlog
fi
