{
  programs.nixvim.colorschemes.gruvbox = {
    enable = true;
    settings = {
      gruvbox_contrat = "hard";
      integrations = {
        cmp = true;
        gitsigns = true;
        nvimtree = true;
        treesitter = true;
      };
    };
  };
}
