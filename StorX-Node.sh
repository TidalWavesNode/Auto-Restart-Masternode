#!/bin/bash
read -p "Do you want to create the mn_auto script? (Y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

cd ~/StorX-Node

cat <<EOT > n_auto-upgrade.sh
#!/bin/bash
cd StorX-Node
git pull
sudo bash ./upgrade.sh
EOT

chmod 744 mn_auto.sh
fi

read -p "Do you want to add the required cron task? (Y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

crontab -l | { cat; echo "*/0 1 1 * * /root/StorX-Node/n_auto-upgrade.sh >> /root/StorX-Node/cronlog/auto.log 2>&1 #logs output to auto.log"; } | crontab - l

mkdir cronlog
fi
