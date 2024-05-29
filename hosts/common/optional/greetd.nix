{ pkgs, lib, ... }:

let
  tuigreet = "${lib.getExe pkgs.greetd.tuigreet}";
  hyprland-session = "${pkgs.hyprland}/share/wayland-sessions";
in
{
  services.greetd = {
    enable = true;
    vt = 1;
    settings = {
      default_session = {
        command = "${tuigreet} --time --remember-session --sessions ${hyprland-session}";
        user = "greeter";
      };
    };
  };
  systemd.services.greetd.serviceConfig = {
    # without these bootlogs will spam on screen
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
