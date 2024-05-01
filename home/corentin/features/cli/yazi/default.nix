{

  imports = [
    ./plugins/smart-enter.nix
    ./keymap.nix
  ];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

}
