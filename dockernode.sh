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

sudo docker kill cn1;
sudo docker kill cn2;
sudo docker kill cn3;
sudo docker kill cn4;
sudo docker kill cn5;

sudo docker rm cn1;
sudo docker rm cn2;
sudo docker rm cn3;
sudo docker rm cn4;
sudo docker rm cn5;

#if [ $3 != "extern" ]
#then
        NODEHOST=`ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'`;
#else
        #NODEHOST=`curl http://ipecho.net/plain`
#fi

#if [ $2 != "" ]
#then
#        HUBPORT=$2;
#else
#        HUBPORT="80";
#fi

sudo docker run -d -e HUB_PORT_4444_TCP_ADDR=$1 -e HUB_PORT_4444_TCP_PORT="80" --name cn1 -p 5551:5555 -e REMOTE_HOST="http://$NODEHOST:5551" selenium/node-chrome:2.48.2
sudo docker run -d -e HUB_PORT_4444_TCP_ADDR=$1 -e HUB_PORT_4444_TCP_PORT="80" --name cn2 -p 5552:5555 -e REMOTE_HOST="http://$NODEHOST:5552" selenium/node-chrome:2.48.2
sudo docker run -d -e HUB_PORT_4444_TCP_ADDR=$1 -e HUB_PORT_4444_TCP_PORT="80" --name cn3 -p 5553:5555 -e REMOTE_HOST="http://$NODEHOST:5553" selenium/node-chrome:2.48.2
sudo docker run -d -e HUB_PORT_4444_TCP_ADDR=$1 -e HUB_PORT_4444_TCP_PORT="80" --name cn4 -p 5554:5555 -e REMOTE_HOST="http://$NODEHOST:5554" selenium/node-chrome:2.48.2
sudo docker run -d -e HUB_PORT_4444_TCP_ADDR=$1 -e HUB_PORT_4444_TCP_PORT="80" --name cn5 -p 5555:5555 -e REMOTE_HOST="http://$NODEHOST:5555" selenium/node-chrome:2.48.2

