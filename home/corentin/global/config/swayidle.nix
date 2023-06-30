{
  home.file.".config/swayidle/config" = {
    enable = true;
    text = ''
timeout 300 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
timeout 305 'swaylock -f -c 000000'
before-sleep 'swaylock -f -c 000000'
'';
  };
}
