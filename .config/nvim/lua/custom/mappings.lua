---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.lspsaga = {
  n = {
    -- ["<leader>lo"] = {"<cmd>Lspsaga outline<CR>", "LSP: Outline"},
    -- ["[e"] = {"<cmd>lua vim.diagnostic.goto_prev()<CR>", "LSP: go to prev warning"},
    -- ["]e"] = {"<cmd>lua vim.diagnostic.goto_next()<CR>", "LSP: go to next warning"},
    -- ["gt"] = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "LSP: Peek type definition"},
    ["gD"] = {"<cmd>lua vim.lsp.buf.definition()<CR>", "LSP: Go to declaration"},
    ["gs"] = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "LSP: Show signature help"},
    ["<leader>lo"] = {"<cmd>Lspsaga outline<CR>", "LSP: Outline"},
    ["[e"] = {"<cmd>Lspsaga diagnostic_jump_prev<CR>", "LSP: go to prev warning"},
    ["]e"] = {"<cmd>Lspsaga diagnostic_jump_next<CR>", "LSP: go to next warning"},
    ["gt"] = {"<cmd>Lspsaga peek_type_definition<CR>", "LSP: Peek type definition"},
    ["gr"] = {"<cmd>Lspsaga rename<CR>", "LSP: Rename symbol"},
    ["GD"] = {"<cmd>Lspsaga peek_definition<CR>", "LSP: Preview definition"},
    ["<leader>ca"] = {"<cmd>Lspsaga code_action<CR>", "LSP: Show code actions"},
    ["gf"] = {"<cmd>Lspsaga finder<CR>", "LSP: Show mentions"},
    ["K"] = {"<cmd>Lspsaga hover_doc<CR>", "LSP: Show documentation"},
  },
  v = {
    ["ca"] = {"<cmd>Lspsaga code_action<CR>", "LSP: Show code actions"}
  },
}

M.telescope_custom = {
  n = {
    ["<leader>fs"] = { "<cmd> Telescope grep_string <CR>", "search word under cursor" },
    ["<leader>fc"] = { "<cmd> Telescope git_commits <CR>", "search git commits titles" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "grep buffers" },
 },
  v = {
    ["<leader>fs"] = { "<cmd> Telescope grep_string <CR>", "search word under cursor" },
  },
}

M.spectre = {
  n = {
    ["<leader>S"] = { '<cmd>lua require("spectre").toggle()<CR>', "Toggle Spectre" },
    ["<leader>sw"] = { '<esc><cmd>lua require("spectre").open_visual()<CR>', "search word under cursor" },
 },
  v = {
    ["<leader>sw"] = { '<esc><cmd>lua require("spectre").open_visual()<CR>', "search word under cursor" },
  },
}

return M
