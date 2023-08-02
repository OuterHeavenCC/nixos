local options = {
  ensure_installed = { "lua",
    "c",
    "ledger",
    "bash",
    "nix",
    "cpp",
    "html",
    "css",
    "javascript",
    "typescript",
    "rust",
    "markdown",
    "python",
    "latex", },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
