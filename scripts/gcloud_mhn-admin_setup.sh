#!/bin/bash

if [ "$1" = "--help" ]
then
  echo "bash gcloud_mhn-admin_setup.sh <ZONE> <REGION> <IMAGE>"
  exit 0
fi
if [ -z "$1" ]
then
    echo "Please provide the zone"
    exit 0
fi
if [ -z "$2" ]
then
    echo "Please provide the region."
    exit 0
fi
if [ -z "$3" ]
then
  echo "please provide the image"
  exit 0
fi
if [ $# -eq 3 ]
then
  echo "This script takes only three parameters <ZONE> <REGION> <IMAGE>"
	exit 0
fi

ZONE=$1
REGION=$2
IMAGE=$3

#NOTE: Instructions for firewall install taken from codepath.org

	#Setting defualt region and zone
	gcloud config set compute/zone $ZONE
	gcloud config set compute/region $REGION

#HONEYPOT ADMIN

#First, create a firewall rule to allow ingress traffic on TCP ports 3000 and 10000. The following command can be used to do this via the command line:
gcloud beta compute firewall-rules create mhn-allow-admin --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:3000,tcp:10000,tcp:80,tcp:443 --source-ranges=0.0.0.0/0 --target-tags=mhn-admin

#create the VM instance mhn-admin
gcloud compute instances create "mhn-admin" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-admin","http-server","https-server" --image $IMAGE --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-admin"

# now ssh into the instance we just created
gcloud compute ssh mhn-admin << EOF
sudo apt-get update
sudo apt-get install git -y
cd /opt
sudo git clone https://github.com/RedolentSun/mhn.git
cd mhn/scripts

#This changes the locaiton of where to get pyev due to a bug
sudo sed -i -e 's|https://github.com/HurricaneLabs/pyev.git#egg=pyev|https://github.com/couozu/pyev.git#egg=pyev|g' install_hpfeeds.sh
cd ..
sudo ./install.sh 
EOF
