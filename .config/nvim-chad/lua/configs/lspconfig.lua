require("nvchad.configs.lspconfig").defaults()

local map = vim.keymap.set
-- local lspconfig = require "lspconfig"
-- local lspconfig = vim.lsp.config
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_ini
local capabilities = require("nvchad.configs.lspconfig").capabilities
local servers = { "html", "cssls" }
-- vim.lsp.enable(servers)

local my_on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  map("n", "gD", function()
    vim.lsp.buf.declaration { reuse_win = true }
  end, { buffer = bufnr })

  map("n", "gd", function()
    vim.lsp.buf.definition { reuse_win = true }
  end, { buffer = bufnr })
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  -- lspconfig[lsp].setup {
  vim.lsp.config(lsp, {
    on_attach = my_on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

-- lspconfig.elixirls.setup {
vim.lsp.config("elixirls", {
  cmd = { "/home/jakub/Install/elixir-ls/release/language_server.sh" },
  on_attach = my_on_attach,
  capabilities = capabilities,
})

-- lspconfig.kotlin_language_server.setup {}
vim.lsp.config("kotlin_language_server", {})

-- read :h vim.lsp.config for changing options of lsp servers
