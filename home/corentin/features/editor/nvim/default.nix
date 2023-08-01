{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.sessionVariables.EDITOR = "nvim";

  xdg.configFile."nvim" = {
    recursive = true;
    source = ./NvChad;
  };

  home.packages = with pkgs; [
    nodePackages.pyright
    nodePackages.bash-language-server
    lua-language-server
    ccls
    nil
  ];

}
