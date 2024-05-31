{ config, lib, ... }:

let
  inherit (config.colorscheme) palette;
  monitor = lib.head (lib.filter (m: m.primary) config.monitors);
in
{
  programs.fuzzel = {
    enable = true;

    settings = {

      main = {
        dpi-aware = "yes";
        font =
          if (monitor.displaySize <= 18) then
            "${config.fontProfiles.monospace.family}:size=10"
          else
            "${config.fontProfiles.monospace.family}:size=12";
        terminal = "footclient -e";
        prompt = ''"❯ "'';
        layer = "overlay";
        icon-theme = "Zafiro-icons-Dark";
      };

      colors = {
        background = "${palette.base01}fa";
        text = "${palette.base05}fa";
        match = "${palette.base04}fa";
        selection = "${palette.base07}fa";
        selection-match = "${palette.base04}fa";
        border = "${palette.base07}fa";
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
