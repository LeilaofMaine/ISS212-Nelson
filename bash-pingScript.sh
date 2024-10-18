#!C:\Program Files\Git\bin\sh.exe

# ISS 212 CS Scripting - WK 5 - Bash Review
#Leila Nelson 10/17/24
# This script will ping any address provided as an argument.
# usage: bash bash-pingScript.sh <IP Address Here, sans brackets.>

SCRIPT_NAME="${0}"
#creates a variable for the script name from input
TARGET="${1}"
#creates a target variable for user input

echo "Running the script ${SCRIPT_NAME}..."
#ouputs that it is running the variable script name
echo "Pinging the target: ${TARGET}..."
#outputs that it is pinging the target specified from input
ping "${TARGET}"
#pings the target inputted