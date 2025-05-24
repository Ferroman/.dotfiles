# ~/.config/fish/config.fish
if status is-interactive
  mise activate fish | source
  atuin init fish | source
else
  mise activate fish --shims | source
end

zoxide init fish | source
/home/linuxbrew/.linuxbrew/bin/mise activate fish | source
starship init fish | source
