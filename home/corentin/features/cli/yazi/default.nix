{ config, ... }:

{

  imports = [
    ./plugins/smart-enter.nix
    ./keymap.nix
    ./theme.nix
  ];

  programs.yazi = {
    enable = true;
    enableBashIntegration = config.programs.bash.enable;
    enableZshIntegration = config.programs.zsh.enable;

    settings = {
      cache_dir = config.xdg.cacheHome;
    };
  };

}
