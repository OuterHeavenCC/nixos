dofile(vim.g.base46_cache .. "lsp")
require "nvchad_ui.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

require("lspconfig").lua_ls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/extensions/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

require("lspconfig").rust_analyzer.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}

require("lspconfig").pyright.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}
require("lspconfig").bashls.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}
require("lspconfig").ccls.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}
require("lspconfig").nil_ls.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}

-- Web stuff
require("lspconfig").cssls.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  cmd = { "css-languageserver", "--stdio" },
}
require("lspconfig").html.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  cmd = { "html-languageserver", "--stdio" },
}
require("lspconfig").jsonls.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  cmd = { "vscode-json-languageserver", "--stdio" },
}
require("lspconfig").tsserver.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}

return M
