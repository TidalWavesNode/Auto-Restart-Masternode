#!/bin/bash

cd ~/wagerr-2.0.0/bin
mkdir cronlog

cat << EOF > ~/wagerr-2.0.0/bin/mn_auto.sh
#!/bin/bash
SERVICE='wagerrd'

if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
echo “Masternode is running! Yay!”
else
~/wagerr-2.0.0/bin/./wagerrd
fi
EOF

chmod 744 mn_auto.sh

crontab -l | { cat; echo "*/1 * * * * ~/wagerr-2.0.0/bin/mn_auto.sh >> ~/wagerr-2.0.0/bin/cronlog/auto.log 2>&1 #logs output to auto.log"; } | crontab -
