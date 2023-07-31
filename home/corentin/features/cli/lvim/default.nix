{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.sessionVariables.EDITOR = "lvim";
  xdg.configFile."lvim/config.lua" = {
    text = ''
      lvim.plugins = {
        { "catppuccin/nvim" },
        { "folke/tokyonight.nvim"},
        { "sainnhe/everforest" },
        { "sainnhe/gruvbox-material" },
        { "shaunsingh/nord.nvim" },
        { "norcalli/nvim-colorizer.lua" },
      }

      lvim.colorscheme = "catppuccin-mocha"
'';
  };
}
