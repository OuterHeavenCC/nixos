{ config, lib, ... }:

let
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
          path = "${config.stylix.image}";
          blur_size = "4";
          blur_passes = "3";
          noise = "0.0117";
          contrast = "1.3000";
          brightness = "0.2100";
          vibrancy = "0.2100";
          vibrancy_darkness = "0.0";
        }
      ];

      input-field = [
        {
          monitor = "${monitor.name}";

          size = "300, 50";

          outline_thickness = 1;

          outer_color = "rgb(${config.lib.stylix.colors.base04})";
          inner_color = "rgb(${config.lib.stylix.colors.base07})";
          font_color = "rgb(${config.lib.stylix.colors.base00})";

          placeholder_text = ''<span font_family="${config.stylix.fonts.monospace.name}" foreground="##${config.lib.stylix.colors.base00}">Mot de passe...</span>'';


          fade_on_empty = false;

          dots_spacing = 0.2;
          dots_center = true;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          font_size = 50;

          color = "rgb(${config.lib.stylix.colors.base05})";


          position = "0, 80";

          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
