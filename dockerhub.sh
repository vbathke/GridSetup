#install docker-selenium on Debian
sudo apt-get purge lxc-docker*;
sudo apt-get purge docker.io*;
sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D;

sudo sh -c "echo 'deb http://apt.dockerproject.org/repo debian-wheezy main' >> /etc/apt/sources.list";
sudo sh -c "echo 'deb http://apt.dockerproject.org/repo debian-jessie main' >> /etc/apt/sources.list";
sudo sh -c "echo 'deb http://apt.dockerproject.org/repo debian-stretch main' >> /etc/apt/sources.list";

sudo apt-get update;
sudo apt-cache policy docker-engine;
sudo apt-get -y upgrade;
sudo wget http://launchpadlibrarian.net/173841617/init-system-helpers_1.18_all.deb;
sudo dpkg -i init-system-helpers_1.18_all.deb;
sudo apt-get --force-yes -y install docker-engine;
sudo service docker start;
sudo docker run -d -p 80:4444 --name selenium-hub2 selenium/hub:2.48.2;

if [ $3 != "extern" ]
then
        NODEHOST=`ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'`;
else
        NODEHOST=`curl http://ipecho.net/plain`
fi

echo "Command to append node:\n";
echo "curl https://raw.githubusercontent.com/vbathke/GridSetup/master/https://raw.githubusercontent.com/vbathke/GridSetup/master/dockernode.sh $NODEHOST | sh "
