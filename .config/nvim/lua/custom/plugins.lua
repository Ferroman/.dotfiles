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
  -- Install plugins
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
  -- search and replace
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
  },
  -- EXPERIMENTAL
  -- obsidian notes, attempt 2
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = false,
    opts = {
      workspaces = {
        {
          name = "!ObsidianVault",
          path = "~/Documents/!ObsidianVault/",
        },
      },
      notes_subdir = "00 Inbox",
      disable_frontmatter = true, -- disable adding header
    },
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
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
        },
        neorg = {
          enabled = false,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "norg" },
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
      tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
    }
  }
}

return plugins
