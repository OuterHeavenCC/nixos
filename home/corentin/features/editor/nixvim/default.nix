{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./spell.nix
    ./plugins
    ./colorscheme.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };

  home.sessionVariables.EDITOR = "nvim";
  programs.zsh.shellAliases = {
    v = "$EDITOR";
    vi = "$EDITOR";
    vim = "$EDITOR";
    nvim = "$EDITOR";
  };

}
