#!/bin/bash

function configure_script() {
  cat << EOF > ~/wagerr-2.0.0/bin
#!/bin/bash
SERVICE=’wagerrd’

if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
echo “Masternode is running! Yay!”
else
~/wagerr-2.0.0/bin/./wagerrd
fi
EOF

