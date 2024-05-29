{ config, lib, ... }:

let
  inherit (config.colorscheme) palette;
  monitor = lib.head (lib.filter (m: m.primary) config.monitors);
in
{

  home.sessionVariables.TERMINAL = "footclient";

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font =
          if (monitor.displaySize <= 18) then
            "${config.fontProfiles.monospace.family}:size=12"
          else
            "${config.fontProfiles.monospace.family}:size=14";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        alpha = 0.7;
        foreground = "${palette.base05}";
        background = "${palette.base00}";
        regular0 = "${palette.base03}";
        regular1 = "${palette.base08}";
        regular2 = "${palette.base0B}";
        regular3 = "${palette.base0A}";
        regular4 = "${palette.base0D}";
        regular5 = "${palette.base06}";
        regular6 = "${palette.base0C}";
        regular7 = "${palette.base07}";
        bright0 = "${palette.base04}";
        bright1 = "${palette.base08}";
        bright2 = "${palette.base0B}";
        bright3 = "${palette.base0A}";
        bright4 = "${palette.base0D}";
        bright5 = "${palette.base06}";
        bright6 = "${palette.base0C}";
        bright7 = "${palette.base0E}";
      };
    };
  };
}
