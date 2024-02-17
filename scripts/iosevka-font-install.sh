#!/bin/bash

# Parallel downloads
P=4

# Define the release version
RELEASE="22.0.2"

# Base URL for downloads
BASE_URL="https://github.com/be5invis/Iosevka/releases/download/v$RELEASE"

# List of font variants to download
declare -a fonts=("ttf-iosevka-$RELEASE.zip"
                  "ttf-iosevka-aile-$RELEASE.zip"
                  "ttf-iosevka-curly-$RELEASE.zip"
                  "ttf-iosevka-curly-slab-$RELEASE.zip"
                  "ttf-iosevka-etoile-$RELEASE.zip"
                  "ttf-iosevka-fixed-$RELEASE.zip"
                  "ttf-iosevka-fixed-curly-$RELEASE.zip"
                  "ttf-iosevka-fixed-curly-slab-$RELEASE.zip"
                  "ttf-iosevka-fixed-slab-$RELEASE.zip"
                  # "ttf-iosevka-fixed-ss01-$RELEASE.zip"
                  # "ttf-iosevka-fixed-ss02-$RELEASE.zip"
                  # "ttf-iosevka-fixed-ss03-$RELEASE.zip"
                  "ttf-iosevka-fixed-ss04-$RELEASE.zip"
                  "ttf-iosevka-fixed-ss05-$RELEASE.zip"
                  "ttf-iosevka-slab-$RELEASE.zip"
                  # "ttf-iosevka-ss01-$RELEASE.zip"
                  # "ttf-iosevka-ss02-$RELEASE.zip"
                  # "ttf-iosevka-ss03-$RELEASE.zip"
                  # "ttf-iosevka-ss04-$RELEASE.zip"
                  "ttf-iosevka-ss05-$RELEASE.zip"
                  "ttf-iosevka-term-$RELEASE.zip"
                  "ttf-iosevka-term-curly-$RELEASE.zip"
                  "ttf-iosevka-term-curly-slab-$RELEASE.zip"
                  "ttf-iosevka-term-slab-$RELEASE.zip"
                  # "ttf-iosevka-term-ss01-$RELEASE.zip"
                  # "ttf-iosevka-term-ss02-$RELEASE.zip"
                  # "ttf-iosevka-term-ss03-$RELEASE.zip"
                  # "ttf-iosevka-term-ss04-$RELEASE.zip"
                  "ttf-iosevka-term-ss05-$RELEASE.zip"
                  "ttf-unhinted-iosevka-$RELEASE.zip"
                  "ttf-unhinted-iosevka-aile-$RELEASE.zip"
                  "ttf-unhinted-iosevka-curly-$RELEASE.zip"
                  "ttf-unhinted-iosevka-curly-slab-$RELEASE.zip"
                  "ttf-unhinted-iosevka-etoile-$RELEASE.zip"
                  "ttf-unhinted-iosevka-fixed-$RELEASE.zip"
                  "ttf-unhinted-iosevka-fixed-curly-$RELEASE.zip"
                  "ttf-unhinted-iosevka-fixed-curly-slab-$RELEASE.zip"
                  "ttf-unhinted-iosevka-fixed-slab-$RELEASE.zip"
                  # "ttf-unhinted-iosevka-fixed-ss01-$RELEASE.zip"
                  # "ttf-unhinted-iosevka-fixed-ss02-$RELEASE.zip"
                  # "ttf-unhinted-iosevka-fixed-ss03-$RELEASE.zip"
                  # "ttf-unhinted-iosevka-fixed-ss04-$RELEASE.zip"
                  "ttf-unhinted-iosevka-fixed-ss05-$RELEASE.zip"
                  "ttf-unhinted-iosevka-slab-$RELEASE.zip"
                  # "ttf-unhinted-iosevka-ss01-$RELEASE.zip"
                  # "ttf-unhinted-iosevka-ss02-$RELEASE.zip"
                  # "ttf-unhinted-iosevka-ss03-$RELEASE.zip"
                  # "ttf-unhinted-iosevka-ss04-$RELEASE.zip"
                  "ttf-unhinted-iosevka-ss05-$RELEASE.zip"
                  "ttf-unhinted-iosevka-term-$RELEASE.zip"
                  "ttf-unhinted-iosevka-term-curly-$RELEASE.zip"
                  "ttf-unhinted-iosevka-term-curly-slab-$RELEASE.zip"
                  "ttf-unhinted-iosevka-term-slab-$RELEASE.zip")

# Create the directory for downloading fonts
mkdir -p /tmp/iosevka-font/$RELEASE
cd /tmp/iosevka-font/$RELEASE || exit

# Download all fonts in parallel
printf "%s\n" "${fonts[@]}" | xargs -n 1 -P $P -I {} wget "${BASE_URL}/{}"

echo "Unzipping downloaded font files..."
unzip '*.zip'

FONT_DEST="/usr/local/share/fonts/iosevka-font"
echo "Moving fonts to $FONT_DEST"
sudo mkdir -p "$FONT_DEST"
sudo mv ./*.ttf "$FONT_DEST"/.

echo "Updating font cache..."
sudo fc-cache -fv

echo "Cleaning up..."
rm ./*.zip

echo "Iosevka fonts version $RELEASE installed successfully."
