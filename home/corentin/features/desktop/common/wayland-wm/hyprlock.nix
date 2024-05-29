{ config, lib, ... }:

let
  inherit (config.colorscheme) palette;
  font_family = "${config.fontProfiles.monospace.family}";

  monitor = lib.head (lib.filter (m: m.primary) config.monitors);
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = false;
        no_fade_in = true;
      };

      background = [
        {
          monitor = "";
          path = config.wallpaper;
        }
      ];

      input-field = [
        {
          monitor = "${monitor.name}";

          size = "300, 50";

          outline_thickness = 1;

          outer_color = "rgb(${palette.base04})";
          inner_color = "rgb(${palette.base07})";
          font_color = "rgb(${palette.base00})";

          fade_on_empty = false;
          placeholder_text = ''<span font_family="${font_family}" foreground="##${palette.base00}">Mot de passe...</span>'';

          dots_spacing = 0.2;
          dots_center = true;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          inherit font_family;
          font_size = 50;
          color = "rgb(${palette.base05})";

          position = "0, 80";

          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
