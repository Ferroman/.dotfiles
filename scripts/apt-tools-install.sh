#!/bin/bash

# File containing the list of tools and their corresponding commands
TOOLS_FILE="./packages/tools-apt"

echo "Checking for missing tools and installing them if necessary..."

while IFS=: read -r package commands; do
    # Split commands by comma if multiple are provided
    IFS=',' read -ra cmds <<< "$commands"
    install_package=true

    # Check each command associated with the package
    for cmd in "${cmds[@]}"; do
        # If no specific command is provided (single name case), use the package name as command
        if [ -z "$cmd" ]; then
            cmd=$package
        fi

        # Check if the command/tool is available in the PATH
        if command -v "$cmd" &> /dev/null; then
            echo "$cmd from $package is already installed."
            install_package=false
            break
        fi
    done

    # If none of the commands are available, attempt to install the package
    if $install_package ; then
        # Check if the package can be installed via apt (is in the apt cache)
        if apt-cache show "$package" &> /dev/null; then
            echo "$package is not installed. Installing..."
            sudo apt-get update
            sudo apt-get install -y "$package"
        else
            echo "$package is not available for installation via apt or might not be the correct package name."
        fi
    fi
done < "$TOOLS_FILE"

echo "All tools checked."
