local overrides = require("custom.configs.overrides")

local plugins = {
  -- LSP servers config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },

  {
   "nvim-telescope/telescope.nvim",
   opts = overrides.telescope
  },

  -- Install plugins
  -- save session automatically
  {"tpope/vim-obsession"},

  -- keep different session per directory
  {
    "dhruvasagar/vim-prosession",
    dependencies = {"tpope/vim-obsession"},
    lazy = false
  },

  -- git commands support
  {
    "tpope/vim-fugitive",

    init = function()
      require("core.utils").lazy_load "vim-fugitive"
    end,
  },

  -- search and replace
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
  },

  -- save files automatically on mode change
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        -- trigger_events = {"InsertLeave"}, -- removes TextChanged event
        condition = function(buf)
            local fn = vim.fn
            local utils = require("auto-save.utils.data")

            if fn.getbufvar(buf, "&modifiable") == 1
                and utils.not_in(fn.getbufvar(buf, "&filetype"), {
                  "gitcommit" -- do not autosave git commit message
                })
            then
                return true -- met condition(s), can save
            end
            return false -- can't save
        end,
        write_all_buffers = false,
      })
    end,
    lazy = false -- enabled by default for all files
  },

  -- Linter
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },

  -- Neovim lsp enhance plugin
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = false, -- this feature make scrolling slow
        },
        ui = {
          title = true,
          code_action = "!"
        }
      })
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },

  -- render diagnostics using virtual lines
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
     event = "BufWinEnter",
     config = function()
       require("lsp_lines").setup()
     end,
  },

  -- EXPERIMENTAL
  -- obsidian notes, attempt 2
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = false,
    opts = overrides.obsidian,
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
  },
  -- reformat
  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },
  -- img
  {
    "3rd/image.nvim",
    lazy = false,
    opts = overrides.image
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = overrides.leetcode,
  }
}

return plugins
