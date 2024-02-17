#!/bin/bash

echo "Install toolse with Homebrew"
./scripts/homebrew-install.sh
brew bundle

echo "Link all configs"
stow --target ~/ . 

echo "Set fish as default shell"
FILE="/etc/shells"
if grep -q "fish" "$FILE"; then
    echo "fish is already set"
else
    sudo echo "/home/linuxbrew/.linuxbrew/bin/fish" | tee /etc/shells
    sudo chsh -s /home/linuxbrew/.linuxbrew/bin/fish "$USER"
    chsh -s /home/linuxbrew/.linuxbrew/bin/fish
fi
