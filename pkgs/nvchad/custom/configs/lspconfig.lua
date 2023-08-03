local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers =  {
  "rust_analyzer",
  "pyright",
  "bashls",
  "ccls",
  "nil_ls",
  "cssls",
  "html",
  "jsonls",
  "tsserver",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Web stuff
lspconfig.cssls.setup{
  cmd = { "css-languageserver", "--stdio" },
}
lspconfig.html.setup{
  cmd = { "html-languageserver", "--stdio" },
}
lspconfig.jsonls.setup{
  cmd = { "vscode-json-languageserver", "--stdio" },
}
