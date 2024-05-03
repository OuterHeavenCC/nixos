{

  imports = [
    ./plugins/smart-enter.nix
    ./keymap.nix
    ./theme.nix
  ];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

}
