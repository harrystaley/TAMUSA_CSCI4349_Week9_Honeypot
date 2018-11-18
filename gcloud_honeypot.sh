!# bin/bash

ZONE="us-central1-c"
REGION="us-central1"
IMAGE="ubuntu-1404-trusty-v20181114"

#NOTE: Instructions for firewall install taken from codepath.org

#Setting defualt region and zone
gcloud config set compute/zone $ZONE
gcloud config set compute/region $REGION

#HONEYPOT ADMIN

#First, create a firewall rule to allow ingress traffic on TCP ports 3000 and 10000. The following command can be used to do this via the command line:
gcloud beta compute firewall-rules create mhn-allow-admin --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:3000,tcp:10000,tcp:80,tcp:443 --source-ranges=0.0.0.0/0 --target-tags=mhn-admin

#create the VM instance mhn-admin
gcloud compute instances create "mhn-admin" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-admin","http-server","https-server" --image "ubuntu-1404-trusty-v20181114" --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-admin"

# now ssh into the instance we just created
gcloud compute ssh mhn-admin

#Start setting up the honeypot
sudo apt-get update
sudo apt-get install git -y
 cd /opt
 #replaced original repo with the official upstream version.
sudo git clone https://github.com/threatstream/mhn.git
cd mhn
sudo ./install.sh 

sudo git clone https://github.com/couozu/pyev.git#egg=pyev


#HONEYPOT ONE

#Create a firewall rule for our first honeypot
gcloud beta compute firewall-rules create mhn-allow-honeypot --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=all --source-ranges=0.0.0.0/0 --target-tags=mhn-honeypot

#####HONEYPOTS#####
#--------------------------
#NOTE: In order to change the image that is used you only need to change the variable
gcloud compute instances create "mhn-honeypot-dionaea" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image "ubuntu-1404-trusty-v20171010" --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-dionaea"
#ssh into your newly created honeypot
gcloud compute ssh mhn-honeypot-dionaea
#Honeypot script
wget "http://35.238.65.15/api/script/?text=true&script_id=2" -O deploy.sh && sudo bash deploy.sh http://35.238.65.15 RWLXbcNr
#--------------------------
#NOTE: In order to change the image that is used you only need to change the variable
gcloud compute instances create "mhn-honeypot-wordpot" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image "ubuntu-1404-trusty-v20171010" --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-wordpot"
#ssh into your newly created honeypot
gcloud compute ssh mhn-honeypot-wordpot
#wordpot script
wget "http://35.238.65.15/api/script/?text=true&script_id=17" -O deploy.sh && sudo bash deploy.sh http://35.238.65.15 RWLXbcNr
#--------------------------
#NOTE: In order to change the image that is used you only need to change the variable
gcloud compute instances create "mhn-honeypot-shockpot" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image "ubuntu-1404-trusty-v20171010" --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-shockpot"
#ssh into your newly created honeypot
gcloud compute ssh mhn-honeypot-shockpot
#wordpot script
wget "http://35.238.65.15/api/script/?text=true&script_id=15" -O deploy.sh && sudo bash deploy.sh http://35.238.65.15 RWLXbcNr

#--------------------------
#NOTE: In order to change the image that is used you only need to change the variable
gcloud compute instances create "mhn-honeypot-diondeahttp" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image "ubuntu-1404-trusty-v20171010" --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-diondeahttp"
#ssh into your newly created honeypot
gcloud compute ssh mhn-honeypot-diondeahttp
#wordpot script
wget "http://35.238.65.15/api/script/?text=true&script_id=4" -O deploy.sh && sudo bash deploy.sh http://35.238.65.15 RWLXbcNr
#--------------------------
#NOTE: In order to change the image that is used you only need to change the variable
gcloud compute instances create "mhn-honeypot-snort" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image "ubuntu-1404-trusty-v20171010" --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-snort"
#ssh into your newly created honeypot
gcloud compute ssh mhn-honeypot-snort
#wordpot script
wget "http://35.238.65.15/api/script/?text=true&script_id=3" -O deploy.sh && sudo bash deploy.sh http://35.238.65.15 RWLXbcNr
#--------------------------
#NOTE: In order to change the image that is used you only need to change the variable
gcloud compute instances create "mhn-honeypot-kippojuniper" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image "ubuntu-1404-trusty-v20171010" --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-kippojuniper"
#ssh into your newly created honeypot
gcloud compute ssh mhn-honeypot-kippojuniper
#wordpot script
wget "http://35.238.65.15/api/script/?text=true&script_id=10" -O deploy.sh && sudo bash deploy.sh http://35.238.65.15 RWLXbcNr


