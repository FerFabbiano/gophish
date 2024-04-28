#!/bin/bash

echo "Update & Upgrade | Install Golang & GoPhish..."
sudo apt update & sudo upgrade -y
sudo apt install golang-go -y
sudo apt install unzip -y

# Install GoPhish
wget https://github.com/gophish/gophish/releases/download/v0.12.1/gophish-v0.12.1-linux-64bit.zip
sudo mkdir /opt/gophish
sudo unzip gophish-v0.12.1-linux-64bit.zip -d /opt/gophish

echo "Change Config Files..."
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /opt/gophish/config.json
sudo sed -i 's/true/false/g' /opt/gophish/config.json
sudo sed -i 's|"contact_address":.*,|"contact_address": "fernando.fabbiano@y.uno",|; s|"filename":.*,|"filename": "app.log",|; s|"level":.*|"level": "info"|' /opt/gophish/config.json


echo "Execute GoPhish..."
cd /opt/gophish
sudo chmod +x gophish
sudo ./gophish