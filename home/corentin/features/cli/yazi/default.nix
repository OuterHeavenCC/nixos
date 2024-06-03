{ config, ... }:

{

  imports = [
    ./plugins/smart-enter.nix
    ./keymap.nix
  ];

  programs.yazi = {
    enable = true;
    enableBashIntegration = config.programs.bash.enable;
    enableZshIntegration = config.programs.zsh.enable;
  };

  stylix.targets.yazi = {
    enable = true;
  };

}
