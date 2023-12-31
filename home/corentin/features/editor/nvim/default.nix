{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.sessionVariables.EDITOR = "nvim";

  xdg.configFile."nvim" = { source = "${pkgs.nvchad}"; };

  home.packages = with pkgs; [
    nodePackages_latest.pyright # Python
    nodePackages_latest.bash-language-server # Bash
    lua-language-server # Lua
    ccls # C
    nil # Nix
    texlab # Latex
    # Web stuff LSP
    nodePackages_latest.vscode-html-languageserver-bin
    nodePackages_latest.vscode-css-languageserver-bin
    nodePackages_latest.vscode-json-languageserver
    nodePackages_latest.typescript-language-server

    # Formatting 
    nixfmt # Nix Formatting
    nodePackages_latest.prettier # HTML/CSS/Markdown Formatting
    stylua # Lua Formatting
  ];

}
