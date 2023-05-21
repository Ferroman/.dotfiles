local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  -- LSP servers config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- EXPERIMENTAL: format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      -- TODO: LSP inlay hints
    },
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
  -- Install plugins
  -- escape with jj and jk with no frustrations
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- collect statistics
  {
    'wakatime/vim-wakatime',
    init = function()
      require("core.utils").lazy_load "vim-wakatime"
    end,
  },

  -- git commands support
  {
    "tpope/vim-fugitive",

    init = function()
      require("core.utils").lazy_load "vim-fugitive"
    end,
  },

  -- save session automatically
  {"tpope/vim-obsession"},
  -- keep different session per directory
  {
    "dhruvasagar/vim-prosession",
    dependencies = {"tpope/vim-obsession"},
    lazy = false
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
          code_action = ""
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
     event = "LspAttach",
     config = function()
       require("lsp_lines").setup()
     end,
  },
  -- fuzzy finder
  {
   "nvim-telescope/telescope.nvim",
   opts = {
     defaults = {
       mappings = {
         n = {
            ["<C-j>"] = function(...)
              require("telescope.actions").preview_scrolling_down(...)
            end,
            ["<C-k>"] = function(...)
              require("telescope.actions").preview_scrolling_up(...)
            end,
          },
         i = {
            ["<C-j>"] = function(...)
              require("telescope.actions").preview_scrolling_down(...)
            end,
            ["<C-k>"] = function(...)
              require("telescope.actions").preview_scrolling_up(...)
            end,
          },
        },
        layout_config = {
          scroll_speed = 1,
        },
      },
    },
   },
  -- a file explorer
  {
   "nvim-tree/nvim-tree.lua",
   opts = {
     renderer = {
      icons = {
        glyphs = {
          git = {
            unstaged = "±",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "﹖",
            deleted = "",
            ignored = "◌",
          },
        }
      }
     },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    }
   }
  },
  -- (EXPERIMENTAL USE) Single tabpage interface for easily cycling through diffs
  {
    'sindrets/diffview.nvim',
    init = function()
      require("core.utils").lazy_load "diffview.nvim"
    end,
    dependencies = {'nvim-lua/plenary.nvim'},
  },
  -- (EXPERIMENTAL USE) Modern folding
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {'kevinhwang91/promise-async'},
    init = function()
      require("core.utils").lazy_load "nvim-ufo"
    end,

    config = function()
      require("ufo").setup()
    end,
  },
  -- EXPERIMENTAL: show images in md files
  { 'edluffy/hologram.nvim',
    ft = "markdown",
    config = function()
      if not vim.g.neovide then  -- do not load it in GUI
        require('hologram').setup{
          auto_display = true -- WIP automatic markdown image display, may be prone to breaking
        }
      end
    end
  },
  -- (LOCAL DEVELOPMENT)
  {
    dir = "~/p/nvim/ygor.nvim",
    init = function()
      require("core.utils").lazy_load "ygor.nvim"
    end,
    dev = true
  }
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
