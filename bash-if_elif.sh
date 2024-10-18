#!C:\Program Files\Git\bin\sh.exe

# ISS 212 CS Scripting - WK 5 - Bash Review
#Leila Nelson 10/17/24
# Script checks if input is a file or directory.
# usage:
#      for directory:  bash bash-if_elif.sh "C:\Your\directory\path\"
#      for file:  bash bash-if_elif.sh "C:\Path\to\your\file\filename.extension"

USER_INPUT="$1"
#creates a variable for user input

if [[ -z "${USER_INPUT}" ]]; then
# creates an if statement
    echo "You must provide an argument!"
    #outputs to tell the user to provide input
    exit 1
    #exits
fi
#ends the if statement

echo "User input: ${USER_INPUT}"  # Debugging line
#outputs the user input using the variable

# Check if the argument is of type file or directory
if [[ -f "${USER_INPUT}" ]]; then
  #if the input is a file then it will output that is a file
    echo "${USER_INPUT} is a file."
elif [[ -d "${USER_INPUT}" ]]; then
#else if the input is a directory it will output accordingly
    echo "${USER_INPUT} is a directory."
else
#if neither it will output that is not a file nor directory
    echo "${USER_INPUT} is not a file or a directory."
fi
#ends if statement


