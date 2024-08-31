{
  programs.nixvim.plugins = {
    treesitter = {
      enable = false;
      nixGrammars = true;
      nixvimInjections = true;
    };
  };
}
