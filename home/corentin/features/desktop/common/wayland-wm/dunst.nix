{ pkgs, ... }:
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
        separator_color = "frame";
        corner_radius = 7;
      };
    };
  };
  home.packages = with pkgs; [ libnotify ]; # notify-send to test notifications
}
