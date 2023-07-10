{ config, pkgs, ... }:
let
  inherit (config.colorscheme) colors;
in
{
  home.packages = with pkgs; [ swayidle ];
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300;
        command = "hyprctl dispatch dpms off";
        resumeCommand = "hyprctl dispatch dpms on";
      }
      {
        timeout = 305;
        command = "swaylock -f -c ${colors.base00}";
      }
    ];
    events = [
      { event = "before-sleep"; command = "swaylock -f -c ${colors.base00}"; }
    ];
  };
}
