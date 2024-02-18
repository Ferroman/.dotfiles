local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "html",
    "toml",
    "css",
    "markdown",
    "markdown_inline",
    "tsx",
    "c",
    "python",
    "javascript",
    "typescript",
    "bash",
    "lua",
    "terraform",
    "go",
    "hcl",
    "json",
    "yaml"
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    -- lint
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- shell
    "bash-language-server",

    --python
    "pyright",

    --ruby
    "solargraph",
    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- shell
    "shfmt",
    "shellcheck",

    -- docs lint
    "vale",

    -- yaml lint
    "yamllint",

    -- go stuff
    "gopls",

    --"terraformls",

    -- json, ts, js
    "biome",

    -- docker
    "dockerfile-language-server",
    "docker-compose-language-service",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        folder = {
          default = "",
        },
        git = {
          unstaged = "±",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "﹖",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

M.gitsigns = {
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_formatter = '<author>, <summary> - <author_time:%Y-%m-%d>',
}

M.telescope = {
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
}

M.image = {
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

M.obsidian = {
  workspaces = {
    {
      name = "!ObsidianVault",
      path = "~/Documents/!ObsidianVault/",
    },
  },
  notes_subdir = "00 Inbox",
  disable_frontmatter = true, -- disable adding header
}

M.leetcode = {
  arg = "leetcode.nvim",
  lang = "go",
  image_support = true,
  description = {
      position = "left", ---@type lc.position
      width = "60%", ---@type lc.size
      show_stats = true, ---@type boolean
  },
}

return M
