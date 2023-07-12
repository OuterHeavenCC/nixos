{
  home.sessionVariables.EDITOR = "lvim";
  xdg.configFile."lvim/config.lua" = {
    text = ''
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


lvim.plugins = {
  { "catppuccin/nvim" },
  { "folke/tokyonight.nvim"},
  { "sainnhe/everforest" },
  { "sainnhe/gruvbox-material" },
  { "shaunsingh/nord.nvim" },
}

lvim.colorscheme = "gruvbox-material"
'';
  };
}
