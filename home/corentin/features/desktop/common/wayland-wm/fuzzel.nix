{ config, ... }:

let 
  inherit (config.colorscheme) palette;
in
{
  programs.fuzzel = {
    enable = true;

    settings = {

      main = {
        dpi-aware = "yes";
        font = "FiraCode Nerd Font:weight=bold:size=12";
        terminal = "footclient -e";
        prompt = ''"❯ "'';
        layer = "overlay";
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
