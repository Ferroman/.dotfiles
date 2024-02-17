#!/bin/bash

if [ "$(ls -A ~/.config/nvim/lua/custom )" ]; then
    echo "NvChad is already installed."
else
    echo "Install NvChad"
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
    rm -rf ~/.config/nvim/lua/custom
fi
