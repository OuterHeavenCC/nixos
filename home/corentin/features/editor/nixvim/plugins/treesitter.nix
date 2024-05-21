{ pkgs, ... }:

{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      ensureInstalled = "all";
      nixGrammars = true;
      nixvimInjections = true;
      grammarPackages =  (with pkgs.tree-sitter-grammars; [
          tree-sitter-norg
          tree-sitter-norg-meta
      ]);
    };
  };
}
