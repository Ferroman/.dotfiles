local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "yamlls", "terraformls", "dockerls", "bashls", "jsonls", "gopls", "pyright"}

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    require("inlay-hints").on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
})

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { only_current_line = true }
})

vim.cmd [[
  hi DiagnosticUnderlineError gui=undercurl
  hi DiagnosticUnderlineWarn gui=undercurl
]]

-- does not support go to definition
-- lspconfig.ruff_lsp.setup {
--   init_options = {
--     settings = {
--       -- Any extra CLI arguments for `ruff` go here.
--       args = {},
--     }
--   }
-- }
