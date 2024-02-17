#!/bin/bash

./scripts/apt-tools-install.sh
./scripts/nvchad-install.sh
./scripts/homebrew-install.sh

echo "Install toolse with Homebrew"
brew bundle

echo "Link all configs"
stow --target ~/ . 

./scripts/kitty-install.sh
./scripts/fish-install.sh
./scripts/fish-plugin-install.sh
./scripts/hashicorp-repo-install.sh
./scripts/1password-install.sh
./scripts/iosevka-font-install.sh
./scripts/nerd-fonts-install.sh
