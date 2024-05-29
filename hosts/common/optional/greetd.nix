{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    vt = 1;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };
}
