{ pkgs, ... }:

let
  hyprlock = "${pkgs.hyprlock}/bin/hyprlock";
  hyprctl = "${pkgs.hyprland}/bin/hyprctl";
in
{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        after_sleep_cmd = "${hyprctl} dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "${hyprlock}";
      };

      listener = [
      {
        timeout = 300;
        on-timeout = "${hyprlock}";
      }
      {
        timeout = 340;
        on-timeout = "${hyprctl} dispatch dpms off";
        on-resume = "${hyprctl} dispatch dpms on";
      }
      ];
    };
  };
}
