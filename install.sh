apt update -y && apt upgrade -y

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

dpkg -i google-chrome-stable_current_amd64.deb

apt --fix-broken install

mkdir RouterReboot

cd RouterReboot

chrome_driver=$(curl "https://chromedriver.storage.googleapis.com/LATEST_RELEASE") 

curl -Lo chromedriver_linux64.zip "https://chromedriver.storage.googleapis.com/${chrome_driver}/chromedriver_linux64.zip"

mkdir -p "chromedriver/stable" && \
unzip -q "chromedriver_linux64.zip" -d "chromedriver/stable" && \
chmod +x "chromedriver/stable/chromedriver"

apt install python3 python3-pip

pip3 install selenium

wget https://raw.githubusercontent.com/OwenRempel/TelusZTE-Restart/master/main.py