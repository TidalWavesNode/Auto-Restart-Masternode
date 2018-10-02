#!/bin/bash

crontab -l | { cat; echo "*/1 * * * * ~/wagerr-2.0.0/bin/mn_auto.sh >> ~/wagerr-2.0.0/bin/cronlog/auto.log 2>&1 #logs output to auto.log"; } | crontab -​
