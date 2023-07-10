{ config, pkgs, ... }:
let
  inherit (config.colorscheme) colors;
in
{
  home.packages = with pkgs; [ swayidle swaylock ]; 
  xdg.configFile."swayidle/config" = {
    text =
''
timeout 120 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' 
timeout 125 'swaylock -f -c #${colors.base00}' 
before-sleep 'swaylock -f -c ${colors.base00}'
  '';
  };
}
