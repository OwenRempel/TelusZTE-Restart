#!/bin/bash

echo 'Updating system'
apt update -qq -y > /dev/null && apt upgrade -qq -y &> /dev/null

echo 'Installing required packages'
apt install curl unzip python3 python3-pip -qq -y &> /dev/null

echo 'Downloading Chrome'
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

dpkg -i google-chrome-stable_current_amd64.deb > /dev/null

apt --fix-broken install -qq -y &> /dev/null

mkdir RouterReboot

cd RouterReboot

chrome_driver=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE") 

echo 'Downloading Chromedriver'
curl -s -Lo chromedriver_linux64.zip "https://chromedriver.storage.googleapis.com/${chrome_driver}/chromedriver_linux64.zip"

mkdir -p "chromedriver/stable" && \
unzip -q "chromedriver_linux64.zip" -d "chromedriver/stable" && \
chmod +x "chromedriver/stable/chromedriver"

echo 'Installing Selenium'
pip3 -q install selenium

echo 'Downloading Main Script'
wget -q https://raw.githubusercontent.com/OwenRempel/TelusZTE-Restart/master/main.py

