#!/bin/bash

echo "Set kitty as default terminal emulator"

if ! command -v kitty &>/dev/null; then
    echo "Kitty is not found, exit"
    exit 1
fi

# Get Kitty's binary path
kitty_path=$(which kitty)

# Check if Kitty is already set as the default terminal emulator
current_default=$(update-alternatives --query x-terminal-emulator | grep 'Value:' | awk '{print $2}')

if [ "$current_default" != "$kitty_path" ]; then
    # Kitty is not the default, proceed with setting it as default
    if ! update-alternatives --list x-terminal-emulator | grep -q "$kitty_path"; then
        # Kitty is not an alternative, add it
        sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator "$kitty_path" 50
    fi
    # Note: This command usually requires manual selection, automating it might not reflect in all environments
    echo "Setting Kitty as the default terminal emulator"
    sudo update-alternatives --set x-terminal-emulator "$kitty_path"
else
    echo "Kitty is already set as the default terminal emulator"
fi
