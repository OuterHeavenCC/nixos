{
  home.file.".config/lvim/config.lua" = {
    enable = true;
    text = ''
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


lvim.plugins = {
  { "catppuccin/nvim" },
  { "folke/tokyonight.nvim"},
  { "sainnhe/everforest" },
  { "sainnhe/gruvbox-material" }
  { "shaunsingh/nord.nvim" },
}

lvim.colorscheme = "catppuccin-mocha"

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "nixpkgs-fmt",
    filetypes = { "nix" };
  }
}
'';
  };
}
