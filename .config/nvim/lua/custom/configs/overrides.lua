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
    "hcl"
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

    -- docs
    "markdownlint",

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
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_formatter = '<author>, <summary> - <author_time:%Y-%m-%d>',
}

return M
