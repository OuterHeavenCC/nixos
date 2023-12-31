local null_ls = require "null-ls"
local format = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {

  -- webdev stuff
  format.prettier.with { filetypes = { "html", "markdown", "css", "astro" } }, -- so prettier works only on these filetypes

  -- Lua
  format.stylua,

  -- Nix
  format.nixfmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
