{
  imports = [
    ./autoCmd.nix
    ./colorscheme.nix
    ./keymaps.nix
    ./opts.nix
    ./plugins
    ./spell.nix
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
