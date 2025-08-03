#!/bin/bash
# Test script to demonstrate importing a shell script from a raw URL
# and using its variables.

echo Test importing colors.sh from a raw URL to the file from a git repository:
echo

# Check if the variable RED is set before importing
echo Initial value of the variable "RED":
if [[ -n "${RED}" ]]; then
  echo "RED
 set...aborting."
  exit 1
else
  echo "RED
 is not set."
fi
echo
echo "Importing colors.sh..."
source <(curl -sSL https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh)
# Comment above line and use this for local testing:
#source ./colors.sh
echo

# Check if the variable RED is set after importing
echo Value of the variable "RED" after importing:

if [[ -n "${RED}" ]]; then`
  echo "RED`
 is set."`
else
`  echo "RED
 is not set."
fi
echo -e "${RED}This text should be red.${NOCOLOR}"