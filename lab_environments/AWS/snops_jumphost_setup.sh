#!/bin/bash

# The purpose of this script is to setup the required components for the F5
# automation lab Linux jumphost
#
# This script is processed by cfn-init and will be run as root.
#
# You can monitor the progress of the packages install through
# /var/log/cfn-init-cmd.log. Here you will see all the different commands run
# from the Cloud Formation Template and through this script
#
# It takes approx. 10-15 min to have the RDP instance fully setup

set -x

# This should not be needed - TO BE INVESTIGATED
ifconfig eth1 10.1.1.20 netmask 255.255.255.0
ifconfig eth2 10.1.20.20 netmask 255.255.255.0

# Install desktop environment
apt-get -y install ubuntu-desktop mate-core mate-desktop-environment mate-notification-daemon tightvncserver xrdp

# Install specific fonts support
# Japanese
apt-get -y install fonts-takao-mincho

# Upgrade xrdp and install xorgxrdp
service xrdp stop
cd /root
apt-get -y install git autoconf libtool pkg-config gcc g++ make  libssl-dev libpam0g-dev libjpeg-dev libx11-dev libxfixes-dev libxrandr-dev  flex bison libxml2-dev intltool xsltproc xutils-dev python-libxml2 g++ xutils libfuse-dev libmp3lame-dev nasm libpixman-1-dev xserver-xorg-dev
git clone https://github.com/neutrinolabs/xrdp.git
cd xrdp
./bootstrap
./configure --prefix=/ --exec-prefix=/usr --enable-fuse --enable-pixman --enable-jpeg
make
make install

git clone https://github.com/neutrinolabs/xorgxrdp.git
cd xorgxrdp
./bootstrap
./configure --prefix=/ --exec-prefix=/usr
make
make install
cd ..

systemctl daemon-reload
systemctl enable xrdp.service
cd ..

# Configure xrdp
cat << 'EOF' > /etc/xrdp/startwm.sh
#!/bin/sh
if [ -r /etc/default/locale ]; then
  . /etc/default/locale
  export LANG LANGUAGE
fi
mate-session
. /etc/X11/Xsession
EOF

cat << 'EOF' > /etc/xrdp/xrdp.ini
[Globals]
ini_version=1
fork=true
port=3389
tcp_nodelay=true
tcp_keepalive=true
security_layer=negotiate
crypt_level=high
certificate=
key_file=
ssl_protocols=TLSv1, TLSv1.1, TLSv1.2
autorun=supernetops
allow_channels=true
allow_multimon=true
bitmap_cache=true
bitmap_compression=true
bulk_compression=true
max_bpp=32
new_cursors=true
use_fastpath=both

[Logging]
LogFile=xrdp.log
LogLevel=DEBUG
EnableSyslog=true
SyslogLevel=DEBUG

[Channels]
rdpdr=true
rdpsnd=true
drdynvc=true
cliprdr=true
rail=true
xrdpvr=true
tcutils=true

[supernetops]
name=Super-NetOps
lib=libxup.so
username=ubuntu
password=supernetops
ip=127.0.0.1
port=-1
code=20

EOF

sed -i.bak "s/FuseMountName=thinclient_drives/FuseMountName=remote_drives/g" /etc/xrdp/sesman.ini
service xrdp start
rm -Rf /root/xrdp

# Install Chrome setup and add the desktop icon
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt-get -y update
apt-get -y install google-chrome-stable

# Disable SSH Host Key Checking for hosts in the lab
cat << 'EOF' >> /etc/ssh/ssh_config

Host 10.1.*.*
   StrictHostKeyChecking no
   UserKnownHostsFile /dev/null
   LogLevel ERROR

EOF

# Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce

# pull the f5-super-netops images : base, jenkins, ansible
docker pull f5devcentral/f5-super-netops-container:base
docker pull f5devcentral/f5-super-netops-container:jenkins
docker pull f5devcentral/f5-super-netops-container:ansible

# Install Postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
ln -s /opt/Postman/Postman /usr/bin/postman

# Setup Desktop icons
mkdir /home/ubuntu/Desktop

cat << 'EOF' > /home/ubuntu/Desktop/Chrome.desktop
[Desktop Entry]
Version=1.0
Name=Chrome
Comment=Open Chrome
Exec=/opt/google/chrome/chrome --wm-window-animations-disabled
Icon=/opt/google/chrome/product_logo_48.png
Terminal=false
Type=Application
Categories=Internet;Application;
EOF

chmod +x /home/ubuntu/Desktop/Chrome.desktop

cat << 'EOF' > /home/ubuntu/Desktop/Terminal.desktop
[Desktop Entry]
Version=1.0
Name=Terminal
Comment=Open Terminal
Exec=mate-terminal
Icon=utilities-terminal
Type=Application
Categories=System;GTK;Utility;TerminalEmulator;
EOF

chmod +x /home/ubuntu/Desktop/Terminal.desktop

cat << 'EOF' > /home/ubuntu/Desktop/RootTerminal.desktop
[Desktop Entry]
Version=1.0
Name=Root Terminal
Comment=Open Terminal
Exec=sudo mate-terminal
Icon=utilities-terminal
Type=Application
Categories=System;GTK;Utility;TerminalEmulator;
EOF

chmod +x /home/ubuntu/Desktop/RootTerminal.desktop

cat << 'EOF' > /home/ubuntu/Desktop/Postman.desktop
[Desktop Entry]
Version=1.0
Name=Postman
Comment=Open Postman
Exec=/opt/Postman/Postman
Icon=/opt/Postman/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Utility;Application;
EOF

chmod +x /home/ubuntu/Desktop/Postman.desktop

#Things are created as root, need to transfer ownership
chown -R ubuntu:ubuntu /home/ubuntu/Desktop
chown -R ubuntu:ubuntu /home/ubuntu/f5-automation-labs

