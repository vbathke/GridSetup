#!/bin/sh

ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -i key.pem "$1" "sudo apt-get -y install git; git clone git://github.com/vbathke/testbots; cd testbots; ./setupSeleniumNode.sh ${2}"
 
