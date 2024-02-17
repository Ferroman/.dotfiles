#!/bin/bash

echo "Install 1Password with apt"

# Add the GPG key only if it hasn't been added
GPG_KEYRING="/usr/share/keyrings/1password-archive-keyring.gpg"
if [ ! -f "$GPG_KEYRING" ]; then
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output "$GPG_KEYRING"
fi

# Add the repository only if it hasn't been added
REPO_LIST="/etc/apt/sources.list.d/1password.list"
REPO_URL="https://downloads.1password.com/linux/debian/amd64 stable main"
if ! grep -q "^deb .*1password.com/linux/debian" "$REPO_LIST" 2>/dev/null; then
    echo "deb [arch=amd64 signed-by=$GPG_KEYRING] $REPO_URL" | sudo tee "$REPO_LIST"
fi

# Configure the policy only if it hasn't been configured
POLICY_DIR="/etc/debsig/policies/AC2D62742012EA22"
if [ ! -d "$POLICY_DIR" ]; then
    sudo mkdir -p "$POLICY_DIR"
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee "$POLICY_DIR/1password.pol"
fi

# Add the debsig keyring only if it hasn't been added
DEBSIG_KEYRING_DIR="/usr/share/debsig/keyrings/AC2D62742012EA22"
DEBSIG_KEYRING="$DEBSIG_KEYRING_DIR/debsig.gpg"
if [ ! -f "$DEBSIG_KEYRING" ]; then
    sudo mkdir -p "$DEBSIG_KEYRING_DIR"
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output "$DEBSIG_KEYRING"
fi

# Install 1Password only if it isn't already installed
if ! dpkg -l | grep -qw 1password; then
    sudo apt update && sudo apt install -y 1password
else
    echo "1Password is already installed."
fi
