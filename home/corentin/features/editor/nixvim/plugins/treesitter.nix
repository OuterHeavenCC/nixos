{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      nixvimInjections = true;
      settings.ensure_installed = "all";
    };
  };
}
