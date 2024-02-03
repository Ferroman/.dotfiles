 curl -Lo NerdFontsSymbolsOnly.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/NerdFontsSymbolsOnly.zip
 unzip NerdFontsSymbolsOnly.zip

sudo mkdir /usr/local/share/fonts/nerd-fonts-symbols/
sudo mv *.ttf /usr/local/share/fonts/nerd-fonts-symbols/.

sudo fc-cache -fv

rm *zip
