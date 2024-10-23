#DESCRIPTION
#Leila Nelson 10/22/2024
#ISS 212 - CS Scripting - PowerShell Script: week6Scenario3
#Citations: Jenn Moody (BrightSpace)

#PURPOSE
#PowerShell script that reviews attempted logins

#USAGE
#Run script from file with command or from terminal. | .\ps-SysHealthCheck.ps1

#Loads file that contains failed login attempts
$logFile = "C:\Users\nelso\Desktop\Fall2024\iss212\Git Repo\security.log"
$failedAttempts = Select-String -Path $logFile -Pattern "Login attempt failed from IP (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})" -AllMatches

#Extract the IP addresses and adds up the amount of times a failed attempt has occurred
$ipCounts = @{}
foreach ($match in $failedAttempts)
{
    $ip = $match.Matches[0].Groups[1].Value
    if ($ipCounts.ContainsKey($ip))
    {
        $ipCounts[$ip] += 1
    }
    else {
        $ipCounts[$ip] = 1
    }
}

#Displays IPs with more than 3 failed login attempts
Write-Host "Potentially Malicious IP address(es)"
foreach ($ip in $ipCounts.Keys)
{
    if ($ipCounts[$ip] -gt 3)
    {
        Write-Host "$ip has $($ipCounts[$ip]) failed login attempts"
    }
}
