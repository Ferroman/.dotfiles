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
    "terraform"
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

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- shell
    "shfmt",
    "shellcheck",

    -- docs
    "markdownlint",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.gitsigns = {
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_formatter = '<author>, <summary> - <author_time:%Y-%m-%d>',
}

return M
