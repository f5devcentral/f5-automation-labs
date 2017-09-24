#!/bin/bash

# The purpose of this script is to setup the required components for the F5
# automation lab Linux server
#
# This script is processed by cfn-init and will be run as root.
#
# You can monitor the progress of the packages install through
# /var/log/cfn-init-cmd.log. Here you will see all the different commands run
# from the Cloud Formation Template and through this script
#
# It takes approx. 5 min to have the instance fully setup

# Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce

# Start the f5-demo-app container
docker run -d -p 80:80 --rm f5devcentral/f5-demo-app:AWS

docker run -d -p 8000:80 --rm f5devcentral/f5-demo-app:AWS
docker run -d -p 8001:80 --rm f5devcentral/f5-demo-app:AWS
docker run -d -p 8002:80 --rm f5devcentral/f5-demo-app:AWS
docker run -d -p 8003:80 --rm f5devcentral/f5-demo-app:AWS
