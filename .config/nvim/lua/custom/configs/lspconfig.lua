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
  virtual_lines = true
})
-- 
-- lspconfig.pyright.setup { blabla}
