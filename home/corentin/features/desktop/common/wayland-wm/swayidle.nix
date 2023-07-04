{ config, ... }:
let
  inherit (config.colorscheme) colors;
in
{
  home.file.".config/swayidle/config" = {
    enable = true;
    text = ''
timeout 300 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
timeout 305 'swaylock -f -c ${colors.base00}'
before-sleep 'swaylock -f -c ${colors.base00}'
'';
  };
}
