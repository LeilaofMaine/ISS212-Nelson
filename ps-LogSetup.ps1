'''
.DESCRIPTION
Leila Nelson 10/22/24
ISS 212 - CS Scripting - PowerShell Script: ps-LogSetup.ps1
Citations: Jenn Moody (BrightSpace) (Edited to output to a log file)

.PURPOSE
PowerShell script that enables PowerShell Event, Module, and Script Block Logging.

.USAGE
run script from file with command or from terminal. | .\ps-LogSetup.ps1
'''

# identifies and stores the path to the folder and file path
$logFolderPath = "C:\Users\nelso\Desktop\Fall2024\iss212\Git Repo"
$logFilePath = Join-Path -Path $logFolderPath -ChildPath "PowerShellLogSetup.log"

# this section will then output those stored values of the paths
Write-Host "Log folder path: $logFolderPath"
Write-Host "Log file path: $logFilePath"

# creates an if statement to determine if the log file exists in the foler, if not it will create it.
#If there is an error it will also notify the user
if (-not (Test-Path -Path $logFolderPath -PathType Container)) {
    Write-Host "Logs folder does not exist. Creating..."
    try {
        New-Item -Path $logFolderPath -ItemType Directory
        Write-Host "Logs folder created successfully."
    } catch {
        Write-Host "Error creating Logs folder: $_"
        exit
    }
} else {
    Write-Host "Logs folder already exists."
}

function Ensure-RegistryPath {
    param (
        [string]$Path
    )
    # creates a function to check if the registry path exists then creates one if it does not already
    if (-not (Test-Path $Path)) {
        $null = New-Item -Path $Path -Force
        Write-Host "Created registry path: $Path"
    }
}

# creates a function for log-events, that will output the events with a timestamp to the log file.
function Log-Event {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Message
    )

    # # comment here
    $Timestamp = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    $MessageWithTimestamp = "$Timestamp - $Message"

    # # comment here
    $MessageWithTimestamp | Out-File -FilePath $logFilePath -Append
}
function Enable-EventLogging {
    #asks user to enable event logging and storing the choice. If yes then it will go ahead and enable it.
    Write-Host "Event Logging enables the recording of PowerShell engine events."
    $userChoice = Read-Host "Do you want to enable Event Logging? (Y/N)"
    if ($userChoice -eq 'Y') {
        Ensure-RegistryPath -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
        Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -Value 1
        Log-Event "Event Logging has been enabled."
    } else {
        Write-Host "Skipping Event Logging."
    }
}

function Enable-ModuleLogging {
    # asks user to enable module logging, then stores the answer. If yes then it will enable it.
    Write-Host "Module Logging records events from PowerShell modules."
    $userChoice = Read-Host "Do you want to enable Module Logging? (Y/N)"
    if ($userChoice -eq 'Y') {
        Ensure-RegistryPath -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging"
        Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -Name "EnableModuleLogging" -Value 1
        Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -Name "ModuleNames" -Value "*"
        Log-Event "Module Logging has been enabled for all modules."
    } else {
        Write-Host "Skipping Module Logging."
    }
}

function Enable-ScriptBlockLogging {
    # Asks user if they want to enable script block logging, if yes then it will enable it.
    Write-Host "Script Block Logging records the content of all script blocks that are processed."
    $userChoice = Read-Host "Do you want to enable Script Block Logging? (Y/N)"
    if ($userChoice -eq 'Y') {
        Ensure-RegistryPath -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
        Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -Value 1
        Log-Event "Script Block Logging has been enabled."
    } else {
        Write-Host "Skipping Script Block Logging."
    }
}

Write-Host "Welcome to the PowerShell Logging Setup Script"
Write-Host "This script will guide you through enabling various PowerShell logging features."

Enable-EventLogging
Enable-ModuleLogging
Enable-ScriptBlockLogging

Write-Host "PowerShell Logging setup is complete."
