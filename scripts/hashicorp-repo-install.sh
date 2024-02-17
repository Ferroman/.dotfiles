#!/bin/bash

echo "Install HashiCorp repo"

# Define keyring and repo list paths
HASHICORP_KEYRING="/usr/share/keyrings/hashicorp-archive-keyring.gpg"
HASHICORP_REPO_LIST="/etc/apt/sources.list.d/hashicorp.list"

# Add the GPG key only if it hasn't been added
if [ ! -f "$HASHICORP_KEYRING" ]; then
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee "$HASHICORP_KEYRING" >/dev/null
fi

# Add the repository only if it hasn't been added
if ! grep -q "apt.releases.hashicorp.com" "$HASHICORP_REPO_LIST" 2>/dev/null; then
    echo "deb [signed-by=$HASHICORP_KEYRING] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee "$HASHICORP_REPO_LIST" >/dev/null
fi

echo "HashiCorp repository setup completed."
