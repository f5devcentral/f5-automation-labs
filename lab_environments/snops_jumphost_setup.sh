#!/bin/bash

#The purpose of this script is to setup the required components for the F5 automation lab

#Install Chrome setup and add the desktop icon
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get -y update 
sudo apt-get -y install google-chrome-stable
sudo mkdir /home/ubuntu/Desktop
sudo sh -c 'echo "[Desktop Entry]\nVersion=1.0\nName=Chrome\nComment=Open Chrome\nExec=/opt/google/chrome/chrome\nIcon=/opt/google/chrome/product_logo_48.png\nTerminal=false\nType=Application\nCategories=Internet;Application;\n" > /home/ubuntu/Desktop/Chrome.desktop'
sudo chmod +x /home/ubuntu/Desktop/Chrome.desktop


#Install Postman and add the desktop icon
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman
sudo sh -c 'echo "[Desktop Entry]\nVersion=1.0\nName=Postman\nComment=Open Postman\nExec=/opt/Postman/Postman\nIcon=/opt/Postman/resources/app/assets/icon.png\nTerminal=false\nType=Application\nCategories=Utility;Application;\n" > /home/ubuntu/Desktop/Postman.desktop'
sudo chmod +x /home/ubuntu/Desktop/Postman.desktop

#Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce

#pull the f5-super-netops images : base, jenkins, ansible
sudo docker pull f5devcentral/f5-super-netops-container:base
sudo docker pull f5devcentral/f5-super-netops-container:jenkins
sudo docker pull f5devcentral/f5-super-netops-container:ansible


