#!C:\Program Files\Git\bin\sh.exe

# ISS 212 CS Scripting - WK 5 - Bash Review
#Leila Nelson 10/17/2024
# Bash Script that takes input from the user and outputs a string using 2 inputs
# Takes input from the user and assigns to variables.

echo "What is your first name?"
#outputs to receive first name from user
read -r firstname
#reads input and stores it as firstname

echo "What is your last name?"
#outputs to receive input from user for last name
read -r lastname
#reads the input and stores it as lastname

echo "Your first name is ${firstname} and your last name is ${lastname}"
#outputs the user input for first and last name