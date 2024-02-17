<div align="center">
<h1>🔸.dotfiles</h1>
My personal dotfiles that include an aesthetic and feature-rich neovim config and my personal color [theme](https://github.com/Ferroman/theme-bfrankovskyi)
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

...and others, see [Brewfile](./Brewfile)

## Installation

```bash
git clone git@github.com:Ferroman/.dotfiles.git --depth 1
cd .dotfiles && ./install.sh
```

It uses [GNU Stow](https://www.gnu.org/software/stow/) to create symlinks to the config files in system
