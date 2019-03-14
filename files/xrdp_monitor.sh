#!/bin/bash
# Uncomment set command below for code debuging bash
# set -x

## WA reboot xrdp if dead
#*/5 * * * * /home/ubuntu/xrdp_monitor.sh > /dev/null 2>&1

STATUS=$(/etc/init.d/xrdp status | grep Active | awk '{print $2}')
# Most services will return something like "OK" if they are in fact "OK"
test "$STATUS" = "active" || sudo /etc/init.d/xrdp restart