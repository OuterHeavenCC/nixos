{ config, ... }:

let 
  inherit (config.colorscheme) colors;
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
        background = "${colors.base01}fa";
        text = "${colors.base05}fa";
        match = "${colors.base04}fa";
        selection = "${colors.base07}fa";
        selection-match = "${colors.base04}fa";
        border = "${colors.base07}fa";
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
