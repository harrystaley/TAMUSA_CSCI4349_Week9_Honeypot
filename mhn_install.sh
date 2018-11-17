!# bin/bash


# This script is used to execute the basic install of the honeypot.
sudo apt-get update
sudo apt-get install git -y
cd /opt
sudo git clone https://github.com/threatstream/mhn.git
cd mhn
sudo ./install.sh

#CHeck services
sudo /etc/init.d/nginx status
sudo /etc/init.d/supervisor status
sudo supervisorctl status
