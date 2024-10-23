#Leila Nelson 10/22/2024
#Assignment: Week 6 Scenario 1
#Resources: Jenn Moody (Brightspace)

import re

#imports re module

#opens and loads log file
with open('auth.log', 'r') as file:
    log_data = file.read()

#Detects failed logins from an IP address using a Regex pattern
pattern = r"Failed password.* from (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})"

#Creates a value for any repeating and matching ip addresses
suspiciousIPs = re.findall(pattern, log_data)

#creates a value for unique IP addresses and prints them out for each one of them
uniqueIPs = set(suspiciousIPs)
print("Suspicious IP addresses: ")
for ip in uniqueIPs:
    print(ip)

