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
  -- Better markdown preview 
  {"ellisonleao/glow.nvim",
    config = function()
      require("glow").setup()
    end,
    cmd = "Glow"
  },
  -- (EXPERIMENTAL USE) AI helper
  {
    "Bryley/neoai.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    cmd = {
        "NeoAI",
        "NeoAIOpen",
        "NeoAIClose",
        "NeoAIToggle",
        "NeoAIContext",
        "NeoAIContextOpen",
        "NeoAIContextClose",
        "NeoAIInject",
        "NeoAIInjectCode",
        "NeoAIInjectContext",
        "NeoAIInjectContextCode",
    },
    keys = {
        { "<leader>as", desc = "summarize text" },
        { "<leader>ag", desc = "generate git message" },
    },
    config = function()
        require("neoai").setup({
            -- Options go here
        })
    end,
  },
  -- (EXPERIMENTAL USE) Single tabpage interface for easily cycling through diffs
  {
    'sindrets/diffview.nvim',
    init = function()
      require("core.utils").lazy_load "diffview.nvim"
    end,
    dependencies = {'nvim-lua/plenary.nvim'},
  },
  {
    "epwalsh/obsidian.nvim",
    lazy = false, -- enabled by default for all files
    init = function()
      require("core.utils").lazy_load "obsidian.nvim"
    end,
    config = function()
      require("obsidian").setup({
        dir = "~/Documents/docs/work/",
        notes_subdir = "flynotes",
        disable_frontmatter = true,
        -- Optional, if you keep daily notes in a separate directory.
        daily_notes = {
          folder = "flynotes/dailies",
        },
        -- Optional, customize how names/IDs for new notes are created.
        note_id_func = function(title)
          -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
          -- In this case a note with the title 'My new note' will given an ID that looks
          -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
          local suffix = ""
          if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
          else
            -- If title is ni:l, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
              suffix = suffix .. string.char(math.random(65, 90))
            end
          end
          return tostring(os.date("%Y-%m-%d")) .. "-" .. suffix
        end,
      })
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
