#!/bin/sh

wget http://selenium-release.storage.googleapis.com/2.44/selenium-server-standalone-2.44.0.jar
sudo sh -c "echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list"
sudo sh -c "echo 'deb http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ precise multiverse' >> /etc/apt/sources.list"
sudo sh -c "echo 'deb http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ precise-updates multiverse' >> /etc/apt/sources.list"
sudo sh -c "wget -q -O - 'https://dl-ssl.google.com/linux/linux_signing_key.pub' | sudo apt-key add -"
sudo sh -c "echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list"
sudo sh -c "echo 'deb http://packages.linuxmint.com debian import' >> /etc/apt/sources.list"
sudo apt-get update
sudo apt-get -y install openjdk-7-jre-headless xvfb xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic firefox dbus-x11 unzip google-chrome-stable

wget http://chromedriver.storage.googleapis.com/2.13/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo sh -c "mv chromedriver /usr/bin"


nohup Xvfb :10 -screen 0 1366x768x24 -ac &> /dev/null &
export DISPLAY=:10
nohup java -jar selenium-server-standalone-2.44.0.jar -Dwebdriver.chrome.driver=/usr/bin/chromedriver -role node -hub http://"$1"/grid/register -browser "browserName=chrome,maxInstances=3,platform=ANY" &> /dev/null &

