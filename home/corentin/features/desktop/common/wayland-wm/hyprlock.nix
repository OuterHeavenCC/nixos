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

          position = "0, 80";

          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
