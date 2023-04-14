local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
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

  -- Install a plugin
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
  -- git commands support fugitive
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
  -- Neovim lsp enhance plugin
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup()
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
     event = "LspAttach",
     config = function()
       require("lsp_lines").setup()
     end,
  },
  -- save files automatically on mode change
  {
    "Pocco81/auto-save.nvim",
    opts = {
      trigger_events = {"InsertLeave"}, -- removes TextChanged event
    },
    lazy = false -- enabled by default for all files
  },
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
  {
   "nvim-tree/nvim-tree.lua",
   opts = {
     renderer = {
      icons = {
        glyphs = {
          git = {
            -- unstaged = "✗",
            unstaged = "±",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            -- untracked = "★",
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
  -- {
  --   'sindrets/diffview.nvim',
  --   init = function()
  --     require("core.utils").lazy_load "diffview.nvim"
  --   end,
  --   dependencies = {'nvim-lua/plenary.nvim'},
  -- },
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
  {
   'TimUntersberger/neogit',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
      require("core.utils").lazy_load "neogit"
    end,
  },
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
