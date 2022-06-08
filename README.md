# Telus ZTE SmartHub Reboot Script

This script allows the Telus smart hub to be rebooted programmatically allowing for periodic restarting of the device. For maximum use of the smart hub I have found that it needs to be restarted approx once a week to maintain peak performance.
I am unsure as to why this is the case. Perhaps the device doesn't implement a garbage collector system correctly and so the ram fills up or it simply slows down form some sort of logs it is keeping or something to that effect.

At any rate a periodic restart seems to fix these issues.


## One line install

```bash
wget https://raw.githubusercontent.com/OwenRempel/TelusZTE-Restart/master/install.sh && bash install.sh
```

## Manual Setup


### Step 1

This step is mostly for linux as if you are running this on a windows computer you can just go download the latest version of chrome.

1. Make sure you system is up to date

```bash
sudo apt update && sudo apt upgrade
```

2. Download any required packages
```bash
sudo apt install python3 python3-pip curl unzip
```

3. Download the latest version of chrome for linux
```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```
4. Install <code>.deb</code> file

```bash
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

5. Fix any missing dependency's
```bash
sudo apt --fix-broken install
```
You can run this command to see what version you are running
```bash
google-chrome-stable --version
```

### Step 2

<br>

1. Move to you project dir

```bash
cd routerReboot
```

2. Get the current Release

```bash
chrome_driver=$(curl "https://chromedriver.storage.googleapis.com/LATEST_RELEASE") 
```

```bash
curl -Lo chromedriver_linux64.zip "https://chromedriver.storage.googleapis.com/\
${chrome_driver}/chromedriver_linux64.zip"
```
3. Unzip the folder and mark it executable 
```bash
mkdir -p "chromedriver/stable" && \
unzip -q "chromedriver_linux64.zip" -d "chromedriver/stable" && \
chmod +x "chromedriver/stable/chromedriver"
```

### Step 3
<br>

1. Install Selenium
```bash
pip3 install selenium
```

2. Update you settings in <code>main.py</code>

```python
password = 'youPassword'
url = 'http://192.168.0.1'
chromedriverPath = "chromedriver/stable/chromedriver"
```


### Congratulations it should work now!