{ pkgs, config, ... }:
let
  inherit (config.colorscheme) palette;
in
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
        follow = "keyboard";
        frame_width = 2;
        frame_color = "#${palette.base07}";
        separator_color = "frame"; 
        font = "${config.fontProfiles.monospace.family} 10";
        corner_radius = 7;
        background = "#${palette.base00}";
        foreground = "#${palette.base05}";
      };
    };
  };
  home.packages = with pkgs; [ libnotify ]; # notify-send to test notifications
}
