#!/bin/bash

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

#Start setting up the honeypot
sudo apt-get update
sudo apt-get install git -y
 cd /opt
 #replaced original repo with the official upstream version.
sudo git clone https://github.com/threatstream/mhn.git
cd mhn
sudo ./install.sh 

sudo git clone https://github.com/couozu/pyev.git#egg=pyev
EOF
