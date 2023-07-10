{ config, pkgs, ... }:
let
  inherit (config.colorscheme) colors;
in
{
  home.packages = with pkgs; [ swayidle ];
  xdg.configFile."swayidle/config" = {
    text =
''
timeout 300 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' 
timeout 305 'swaylock -f -c ${colors.base00}' 
before-sleep 'swaylock -f -c ${colors.base00}'
  '';
  };
}
