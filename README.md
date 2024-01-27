<div align="center">
<h1>🔸.dotfiles</h1>
My personal dotfiles that include an aesthetic and feature-rich neovim config
</div>

---
- [Pop!_OS](https://pop.system76.com/) as main OS
    - [Homebrew](https://brew.sh) for some installations
        - [Fish](https://fishshell.com/) for shell
        - [NvChad](https://nvchad.com/) (Neovim config) for editor
- [kitty](https://sw.kovidgoyal.net/kitty/) for terminal emulator
    - [Iosevka](https://github.com/be5invis/Iosevka) font

---
- [asdf](https://asdf-vm.com) to manage runtime versions

---
- [bat](https://github.com/sharkdp/bat) cat clone with wings
- [delta](https://github.com/dandavison/delta) fancy git diff
- [ripgrep](https://github.com/BurntSushi/ripgrep) fast search
- [fzf](https://github.com/junegunn/fzf) fast search
- [fdfind](https://github.com/sharkdp/fd) find files
- [jq](https://stedolan.github.io/jq/) common JSON files parser tool
- [yq](https://github.com/mikefarah/yq) `jq` with cherries
- [btop](https://github.com/aristocratos/btop) htop on steroids

## Installation

Clone repo

```bash
git clone git@github.com:Ferroman/.dotfiles.git --depth 1
cd .dotfiles
```

### Fonts Installation

Install Iosevka fonts and symbols from [Nerd Fonts](https://www.nerdfonts.com/)

```bash
./install-iosevka.sh && ./install-nerd-fonts.sh
```

### Kitty

```bash
ln -s $(pwd)/.config/kitty/ ~/.config/kitty
```

Install kitty: 

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

set kitty as default terminal

```bash
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /home/bohdanf/.local/kitty.app/bin/kitty 5
sudo update-alternatives --config x-terminal-emulator
```

### Neovim

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
brew install neovim && ln -s $(pwd)/.config/nvim/lua/custom/ ~/.config/nvim/lua/custom
```
