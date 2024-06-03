{ lib, config, ... }:

let
  monitor = lib.head (lib.filter (m: m.primary) config.monitors);
in
{
  programs.fuzzel = {
    enable = true;

    settings = {

      main = {
        dpi-aware = lib.mkForce "yes";
        font =
          if (monitor.displaySize <= 18) then
            lib.mkForce "${config.stylix.fonts.monospace.name}:size=10"
          else
            lib.mkForce "${config.stylix.fonts.monospace.name}:size=12";
        terminal = "footclient -e";
        prompt = ''"❯ "'';
        layer = "overlay";
        icon-theme = "Zafiro-icons-Dark";
      };

      colors = {
        background = lib.mkForce "${config.lib.stylix.colors.base01}fa";
        border = lib.mkForce "${config.lib.stylix.colors.base07}fa";
      };


      border = {
        radius = 20;
        width = 2;
      };

      dmenu = {
        exit-immediately-if-empty = "no";
      };
    };
  };
}
