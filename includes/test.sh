#!/bin/bash
# Test script to demonstrate importing a shell script from a raw URL
# and using its variables.

echo
echo Test importing colors.sh from a raw URL to the file from a git repository:
echo

# Check if the variable RED is set before importing
echo Initial value of the variable "RED":
if [[ -n "${RED}" ]]; then
  echo "RED set...aborting."
  exit 1
else
  echo "RED is not set."
fi

echo
echo "Importing colors.sh..."

# Use a command line option to determine which import method to use
# Usage: ./test.sh [ghdirect|ghtemp|local]

 # Define usage function
show_usage() {
  echo "Usage: $0 [ghdirect|ghtemp|local]"
}

if [[ -z "$1" ]]; then
  show_usage
  exit 1
fi

case "$1" in
  "ghdirect")
    # Import the colors.sh script directly from the raw URL
    
    # For some reason these methods only work in zsh on the mac
    source <(wget -qO- https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh)

    #source <(curl -sSL https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh)
    #curl -s https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh | source /dev/stdin
    
    # This method seems to work on bash and zsh:
    source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh)"

    if [[ $? -ne 0 ]]; then
      echo "Failed to source colors.sh from the URL."
      exit 1
    fi
    echo "Sourced colors.sh directly from the URL."
    ;;
  "ghtemp")
    # Import the colors.sh script to a temporary file and source it from there
    temp_file=$(mktemp /tmp/colors.sh.XXXXXX)
    curl -sSL https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh -o "$temp_file"
    if [[ $? -ne 0 ]]; then
      echo "Failed to download colors.sh from the URL."
      exit 1
    fi
    source "$temp_file"
    if [[ $? -ne 0 ]]; then
      echo "Failed to source colors.sh from the temporary file."
      exit 1
    else
      echo "Sourced colors.sh from the temporary file."
    fi
    # Clean up the temporary file after sourcing
    rm -f "$temp_file"
    ;;
  "local")
    # This can be useful for local testing
    source ./colors.sh
    echo "Sourced colors.sh from local directory."
    ;;
  *)
    show_usage
    exit 1
    ;;
esac


# Check if the variable RED is set after importing
echo
echo Value of the variable "RED" after importing:

if [[ -n "${RED}" ]]; then
  echo "RED is set."
else
  echo "RED is not set."
fi
echo
echo -e "${RED}This text should be red.${NOCOLOR}"