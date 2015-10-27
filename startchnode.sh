#!/bin/sh

ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -i key.pem "$1" "killall Xvfb; killall java; nohup Xvfb :10 -screen 0 1366x768x24 -ac &> /dev/null & export DISPLAY=:10; cd testbots; nohup java -jar selenium-server-standalone-2.44.0.jar -Dwebdriver.chrome.driver=/usr/bin/chromedriver -role node -hub http://${2}/grid/register -browser \"browserName=chrome,maxInstances=3,platform=ANY\" &> /dev/null &"
