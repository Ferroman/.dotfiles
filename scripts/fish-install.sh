echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish
nvm install latest
set -U nvm_default_version latest
