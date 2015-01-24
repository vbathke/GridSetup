#!/bin/sh

wget http://selenium-release.storage.googleapis.com/2.44/selenium-server-standalone-2.44.0.jar
sudo apt-get update
sudo apt-get -y install openjdk-7-jre-headless
nohup java -jar selenium-server-standalone-2.44.0.jar -role hub -port 8081 &> /dev/null &
