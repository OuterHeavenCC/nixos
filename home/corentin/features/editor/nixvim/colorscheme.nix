{
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {
      background.dark = "mocha";
      integrations = {
        cmp = true;
        gitsigns = true;
        nvimtree = true;
        treesitter = true;
      };
    };
  };
}
