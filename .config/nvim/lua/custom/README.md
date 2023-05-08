# Neovim config for development

* Automatic session save per folder
* Autosave changes
* Spell check is enabled
* [Mason](https://github.com/williamboman/mason.nvim) used to install language-specific LSP servers
* [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting
    * Configuration: ./configs/overrides.lua
* Enabled git blame on line using gitsigns
* fugitive to work with git changes
* LSP config is here: ./configs/lspconfig.lua
    * virtual lines used to display errors
    * lspsaga used for code actions, lightbulb and code navigation
* Telescope for overall search
* Customized icons for files git state

[Key mappings](./KEYMAP.md)
