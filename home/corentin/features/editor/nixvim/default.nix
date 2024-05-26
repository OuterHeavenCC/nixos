{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./colorscheme.nix
    ./keymaps.nix
    ./opts.nix
    ./spell.nix
    ./plugins
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
