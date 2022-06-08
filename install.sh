#!/bin/bash

echo 'Updating system'
apt update -qq -y && apt upgrade -qq -y

echo 'Installing required packages'
apt install curl unzip python3 python3-pip -qq -y

echo 'Downloading Chrome'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

dpkg -i google-chrome-stable_current_amd64.deb

apt --fix-broken install -qq -y

mkdir RouterReboot

cd RouterReboot

chrome_driver=$(curl "https://chromedriver.storage.googleapis.com/LATEST_RELEASE") 

echo 'Downloading ChromeDriver'
curl -Lo chromedriver_linux64.zip "https://chromedriver.storage.googleapis.com/${chrome_driver}/chromedriver_linux64.zip"

mkdir -p "chromedriver/stable" && \
unzip -q "chromedriver_linux64.zip" -d "chromedriver/stable" && \
chmod +x "chromedriver/stable/chromedriver"

echo 'Installing Selenium'
pip3 install selenium

echo 'Downloading Main Script'
wget https://raw.githubusercontent.com/OwenRempel/TelusZTE-Restart/master/main.py
