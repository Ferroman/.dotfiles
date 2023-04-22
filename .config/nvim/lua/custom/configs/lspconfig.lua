local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "yamlls", "terraformls", "dockerls", "bashls", "tsserver", "jsonls", "gopls" }

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
