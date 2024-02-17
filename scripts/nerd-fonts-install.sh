#!/bin/bash

# Define the destination directory for the fonts
fonts_dir="/usr/local/share/fonts/nerd-fonts-symbols"

# Check if the Nerd Fonts symbols are already installed
if [ "$(ls -A ${fonts_dir})" ]; then
    echo "Nerd Fonts symbols already installed."
else
    echo "Downloading Nerd Fonts symbols..."
    curl -Lo NerdFontsSymbolsOnly.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/NerdFontsSymbolsOnly.zip

    # Extract the fonts
    unzip NerdFontsSymbolsOnly.zip -d nerd-fonts-symbols

    # Create the destination directory if it doesn't exist
    sudo mkdir -p ${fonts_dir}

    # Move the extracted fonts to the destination directory
    sudo mv nerd-fonts-symbols/*.ttf ${fonts_dir}/.

    # Clean up the downloaded and extracted files
    rm -rf NerdFontsSymbolsOnly.zip nerd-fonts-symbols

    echo "Updating font cache..."
    sudo fc-cache -fv
fi
