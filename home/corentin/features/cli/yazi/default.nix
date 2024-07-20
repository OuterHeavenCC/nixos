{ config, ... }:

{

  imports = [
    ./plugins/smart-enter.nix
    ./plugins/session.nix
    ./keymap.nix
  ];

  programs.yazi = {
    enable = true;
    enableBashIntegration = config.programs.bash.enable;
    enableZshIntegration = config.programs.zsh.enable;
    initLua = ./init.lua;
  };

  stylix.targets.yazi = {
    enable = true;
  };

}
