{ config, pkgs, ... }:
{
  services.dunst = {
    enable = true;
    iconTheme = {
      package = pkgs.zafiro-icons;
      name = "Zafiro";
    };
    settings = {
      global = {
        format = ''"<b>%a\n%s</b>\n%b"'';
        origin = "bottom-right";
        offset = "30x30";
        frame_width = 2;
        frame_color = "#cba6f7";
        separator_color = "frame"; 
        font = "Fira Code 10";
        corner_radius = 7;
        background = "#11111B";
        foreground = "#CDD6F4";
      };
    };
  };
}
