{ config, pkgs, ... }:
let
  inherit (config.colorscheme) colors;
in
{
  home.packages = with pkgs; [ swayidle ]; 
  xdg.configFile."swayidle/config" = {
    text =
''
timeout 60 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' \
  '';
  };
}
