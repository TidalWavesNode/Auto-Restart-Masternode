#!/bin/bash
read -p "Do you want to create the n_auto script? (Y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

cd ~/StorX-Node

cat <<EOT > n_auto.sh
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

chmod 744 n_auto.sh
fi

read -p "Do you want to add the required cron task? (Y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

crontab -l | { cat; echo "*/15 * * * * /root/StorX-Node/bin/n_auto.sh >> /root/StorX-Node/bin/cronlog/auto.log 2>&1 #logs output to auto.log"; } | crontab - l

mkdir cronlog
fi
