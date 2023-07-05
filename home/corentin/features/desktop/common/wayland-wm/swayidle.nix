{ config, ... }:
let
  inherit (config.colorscheme) colors;
in
{
  xdg.configFile."swayidle/config" = {
    text = ''
timeout 300 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
timeout 305 'swaylock -f -c ${colors.base00}'
before-sleep 'swaylock -f -c ${colors.base00}'
'';
  };
}
