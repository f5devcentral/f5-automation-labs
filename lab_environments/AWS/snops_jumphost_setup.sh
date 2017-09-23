#!/bin/bash

#The purpose of this script is to setup the required components for the F5 automation lab
#This script is processed by cfn-init and will be run as root.
#You can monitor the progress of the packages install through /var/log/cfn-init-cmd.log. Here you will see all the different commands run from the Cloud Formation Template and through this script
#It takes approx. 10 min to have the RDP instance fully setup

#Retrieve the github repo https://github.com/f5devcentral/f5-automation-labs
apt-get -y install git
git clone https://github.com/f5devcentral/f5-automation-labs /home/ubuntu/f5-automation-labs

#Install Chrome setup and add the desktop icon
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt-get -y update
apt-get -y install google-chrome-stable
mkdir /home/ubuntu/Desktop
sh -c 'echo "[Desktop Entry]\nVersion=1.0\nName=Chrome\nComment=Open Chrome\nExec=/opt/google/chrome/chrome\nIcon=/opt/google/chrome/product_logo_48.png\nTerminal=false\nType=Application\nCategories=Internet;Application;\n" > /home/ubuntu/Desktop/Chrome.desktop'
chmod +x /home/ubuntu/Desktop/Chrome.desktop


#Install Postman and add the desktop icon
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
ln -s /opt/Postman/Postman /usr/bin/postman
sh -c 'echo "[Desktop Entry]\nVersion=1.0\nName=Postman\nComment=Open Postman\nExec=/opt/Postman/Postman\nIcon=/opt/Postman/resources/app/assets/icon.png\nTerminal=false\nType=Application\nCategories=Utility;Application;\n" > /home/ubuntu/Desktop/Postman.desktop'
chmod +x /home/ubuntu/Desktop/Postman.desktop

#Things are created as root, need to transfer ownership
chown -R ubuntu:ubuntu /home/ubuntu/Desktop
chown -R ubuntu:ubuntu /home/ubuntu/f5-automation-labs

#Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce

#pull the f5-super-netops images : base, jenkins, ansible
docker pull f5devcentral/f5-super-netops-container:base
docker pull f5devcentral/f5-super-netops-container:jenkins
docker pull f5devcentral/f5-super-netops-container:ansible


