#!/bin/bash
chrome_driver=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE") 

echo "Downloading Chromedriver"

curl -s -L "https://chromedriver.storage.googleapis.com/${chrome_driver}/chromedriver_linux64.zip" > chromedriver_linux64.zip

mkdir -p "chromedriver/stable" 

unzip -q -o "chromedriver_linux64.zip" -d "chromedriver/stable"

rm chromedriver_linux64.zip

chmod +x "chromedriver/stable/chromedriver"