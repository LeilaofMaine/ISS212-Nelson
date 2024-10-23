#Leila Nelson 10/22/2024
#Assignment: Week 6 Scenario 2
#Resources: Jenn Moody (Brightspace)

#!C:\Program Files\Git\bin\sh.exe

# Redacts IP addresses in the access.log and saves to access_redacted.log
sed -E 's/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[REDACTED]/g' access.log > access_redacted.log

#outputs to let user know IPs were redacted and saved to access_redacted.log
echo "Redacted IP addresses in access.log and saved access_redacted.log"