#!/bin/bash
read -p "Do you want to create the srx_auto_check script? (Y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

cd ~/StorX-Node

cat <<EOT > srx_auto_check.sh
#!/bin/bash
SERVICE='node'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
echo “node is running! Yay!”
else
~/StorX-Node/
sudo docker-compose -f docker-services.yml up -d
fi
EOT

chmod 744 srx_auto_check.sh
fi

read -p "Do you want to add the required cron task? (Y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

crontab -l | { cat; echo "*/15 * * * * /root/StorX-Node/srx_auto_check.sh >> /root/StorX-Node/cronlog/auto.log 2>&1 #logs output to auto.log"; } | crontab - l

mkdir cronlog
fi
