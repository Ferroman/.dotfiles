#!/bin/bash

echo "Configure fish plugins"

# Install Fisher if it's not already installed
if ! fish -c 'type fisher' &>/dev/null; then
    fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
fi

PLUGINS=(
"wfxr/forgit"
"PatrickF1/fzf.fish"
"ferroman/theme-bfrankovskyi"
"franciscolourenco/done"
"rstacruz/fish-asdf"
"edc/bass"
)

for PLUGIN in "${PLUGINS[@]}"; do
  # Check if the plugin is already installed before attempting to install
  if ! fish -c "fisher list | grep -q $PLUGIN"; then
    fish -c "fisher install $PLUGIN"
  else
    echo "$PLUGIN is already installed."
  fi
done
