#!/bin/sh

ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -i ../server.pem "$1" 'sudo apt-get -y install git; git clone git://github.com/vbathke/testbots; cd testbots; chmod +x setupSeleniumServer.sh; ./setupSeleniumServer.sh'
 
