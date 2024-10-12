---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "yoru",
  theme_toggle = { "yoru", "ayu_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    overriden_modules = function(modules)
      -- show cursor position instead of Vim mode
      modules[1] = (function()
          local r,c = unpack(vim.api.nvim_win_get_cursor(0))
          return string.format('%-3s',c)
      end)()

      -- table.insert(
      --   modules,
      --   2,
      --   (function()
      --     local r,c = unpack(vim.api.nvim_win_get_cursor(0))
      --     return string.format('%s|%s',r, c)
      --   end)()
      -- )
    end,
  },

  -- disable custom tabs
  tabufline = {
    enabled = false
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
