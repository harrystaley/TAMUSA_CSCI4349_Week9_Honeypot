#!/bin/bash


if [ "$1" = "--help" ]
then
  echo "bash gcloud_honeypot_setup.sh <IMAGE> <MHN-ADMIN-IP>"
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
if [ $# -eq 2 ]
then
  	echo "This script takes only two parameters <IMAGE> <MHN-ADMIN-IP>"
	exit 0
fi


IMAGE=$1
MHN-ADMIN-IP=$2
#NOTE: Instructions for firewall install taken from codepath.org

#Create a firewall rule for our honeypots
gcloud beta compute firewall-rules create mhn-allow-honeypot --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=all --source-ranges=0.0.0.0/0 --target-tags=mhn-honeypot

#####HONEYPOTS#####
#--------------------------
#NOTE: In order to change the image that is used you only need to change the variable
gcloud compute instances create "mhn-honeypot-dionaea" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image $IMAGE --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-dionaea"
#ssh into your newly created honeypot
gcloud compute ssh mhn-honeypot-dionaea << EOF
	wget "http://$MHN-ADMIN-IP/api/script/?text=true&script_id=2" -O deploy.sh && sudo bash deploy.sh http://$MHN-ADMIN-IP RWLXbcNr
EOF
#Honeypot script
#--------------------------
#NOTE: In order to change the image that is used you only need to change the variable
gcloud compute instances create "mhn-honeypot-wordpot" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image $IMAGE --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-wordpot"
#ssh into your newly created honeypot
gcloud compute ssh mhn-honeypot-wordpot << EOF
	wget "http://$MHN-ADMIN-IP/api/script/?text=true&script_id=17" -O deploy.sh && sudo bash deploy.sh http://$MHN-ADMIN-IP RWLXbcNr
EOF
#--------------------------
#NOTE: In order to change the image that is used you only need to change the variable
gcloud compute instances create "mhn-honeypot-shockpot" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image $IMAGE --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-shockpot"
#ssh into your newly created honeypot
gcloud compute ssh mhn-honeypot-shockpot << EOF
	wget "http://$MHN-ADMIN-IP/api/script/?text=true&script_id=15" -O deploy.sh && sudo bash deploy.sh http://$MHN-ADMIN-IP RWLXbcNr
EOF
#--------------------------
#NOTE: In order to change the image that is used you only need to change the variable
gcloud compute instances create "mhn-honeypot-diondeahttp" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image $IMAGE --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-diondeahttp"
#ssh into your newly created honeypot
gcloud compute ssh mhn-honeypot-diondeahttp << EOF
	wget "http://$MHN-ADMIN-IP/api/script/?text=true&script_id=4" -O deploy.sh && sudo bash deploy.sh http://$MHN-ADMIN-IP RWLXbcNr
EOF
#--------------------------
#NOTE: In order to change the image that is used you only need to change the variable
gcloud compute instances create "mhn-honeypot-snort" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image $IMAGE --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-snort"
#ssh into your newly created honeypot
gcloud compute ssh mhn-honeypot-snort << EOF
	wget "http://$MHN-ADMIN-IP/api/script/?text=true&script_id=3" -O deploy.sh && sudo bash deploy.sh http://$MHN-ADMIN-IP RWLXbcNr
EOF
#--------------------------
#NOTE: In order to change the image that is used you only need to change the variable
gcloud compute instances create "mhn-honeypot-kippojuniper" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image $IMAGE --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-kippojuniper"
#ssh into your newly created honeypot
gcloud compute ssh mhn-honeypot-kippojuniper << EOF
	wget "http://$MHN-ADMIN-IP/api/script/?text=true&script_id=10" -O deploy.sh && sudo bash deploy.sh http://$MHN-ADMIN-IP RWLXbcNr
EOF
#--------------------------
#NOTE: In order to change the image that is used you only need to change the variable
gcloud compute instances create "mhn-honeypot-suricata" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image $IMAGE --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-suricata"
#ssh into your newly created honeypot
gcloud compute ssh mhn-honeypot-suricata << EOF
	wget "http://$MHN-ADMIN-IP/api/script/?text=true&script_id=2" -O deploy.sh && sudo bash deploy.sh http://$MHN-ADMIN-IP RWLXbcNr
EOF

gcloud compute instances create "mhn-honeypot-suricata" --machine-type "f1-micro" --subnet "default" --maintenance-policy "MIGRATE"  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --tags "mhn-honeypot","http-server" --image $IMAGE --image-project "ubuntu-os-cloud" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "mhn-honeypot-suricata"
gcloud compute ssh mhn-honeypot-suricata << EOF
	wget "http://$MHN-ADMIN-IP/api/script/?text=true&script_id=13" -O deploy.sh && sudo bash deploy.sh http://$MHN-ADMIN-IP RWLXbcNr
EOF

