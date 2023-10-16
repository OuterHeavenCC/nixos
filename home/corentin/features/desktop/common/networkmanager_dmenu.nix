{ pkgs, ... }:

{
  home.packages = with pkgs; [ networkmanager_dmenu ];
  xdg.configFile."networkmanager-dmenu/config.ini" = {
    text = ''
      [dmenu]
      dmenu_command = fuzzel -d
  '';
  };
}
