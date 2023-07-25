{ pkgs, config, ... }:
let
  inherit (config.colorscheme) colors;
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
        frame_color = "#${colors.base07}";
        separator_color = "frame"; 
        font = "Fira Code Nerd Font 10";
        corner_radius = 7;
        background = "#${colors.base00}";
        foreground = "#${colors.base05}";
      };
    };
  };

  
  home.packages = with pkgs; [ libnotify ]; # notify-send to test notifications

}
