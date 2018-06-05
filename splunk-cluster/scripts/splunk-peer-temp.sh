#!/bin/bash
apt update && apt upgrade -y && apt install -y htop 
wget -O splunk-7.0.3-fa31da744b51-linux-2.6-amd64.deb 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.0.3&product=splunk&filename=splunk-7.0.3-fa31da744b51-linux-2.6-amd64.deb&wget=true'
sudo dpkg -i splunk*.deb
cd /opt/splunk
sleep 60s
./bin/splunk start --accept-license
./bin/splunk enable boot-start 
./bin/splunk edit cluster-config -mode slave -master_uri https://splunk-sh:8089 -replication_port 9887 -secret password1212 -auth admin:changeme
./bin/splunk restart 