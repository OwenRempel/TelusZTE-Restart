# Router Reset

# This script resets the Telus SmartHub ZTE
# Allowing for programmatic restarting of the hub to improve performance

# Author Owen Rempel  © 2022

import time
import os
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options

scriptPath = "/".join(os.path.realpath(__file__).split('/')[:-1])

password = 'admin'
url = 'http://192.168.0.1'
chromedriverPath = os.path.join(scriptPath, "chromedriver/stable/chromedriver")

# Setup chrome options
chrome_options = Options()
chrome_options.add_argument("--headless") # Ensure GUI is off
chrome_options.add_argument("--no-sandbox")

# Set path to chromedriver as per your configuration
webdriver_service = Service(chromedriverPath)

# Choose Chrome Browser
browser = webdriver.Chrome(service=webdriver_service, options=chrome_options)

# Get page
browser.get(url)

# Add delay to allow for the page to load
time.sleep(3)

# Get the Password Input
passwordField = browser.find_element(By.ID, "txtPwd")

# Enter Password
passwordField.send_keys(password)
print("Logging In")

# Click the Submit Button
browser.find_element(By.ID, "btnLogin").click()

# Wait for the page to load
time.sleep(3)

# Redirect to the correct page on the site
browser.get(url+"/index.html#others")

# Wait for the page to load
time.sleep(3)

# Get the outer div for the buttons
html = browser.find_element(By.ID, "frmRestoreReset")

# Find the restart button in the div above
button = html.find_element(By.CLASS_NAME, 'btn')

# Click the button
button.click()

# Wait for script to execute
time.sleep(3)

# Find the confirm button
yes = browser.find_element(By.ID, 'yesbtn')

# Click it
yes.click()
print('Sent Restart Command')

browser.quit()