{ pkgs, config, ... }:

{

  home.packages = with pkgs; [ hyprpaper ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${config.stylix.image}
    wallpaper = , ${config.stylix.image}
  '';

  systemd.user.services.hyprpaper = {
    Unit = {
      Description = "Hyprland wallpaper daemon";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
