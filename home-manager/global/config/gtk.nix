{ config, pkgs, ... }

{
  gtk = {
    enable = true;
    theme = {
      name = "catppuggin-gtk";
      package = "pkgs.catppuccin-gtk";
      };
    gtk2 = {
      configLocation = {
        "${config.xdg.configHome}/gtk-2.0/gtkrc"
      };
    };
    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
  };
}
