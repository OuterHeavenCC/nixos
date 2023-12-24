{ lib, pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "SUPER,mouse:272,movewindow"
      "SUPER,mouse:273,resizewindow"
    ];

    binde = [
      "SUPER,j,layoutmsg,cyclenext"
      "SUPER,k,layoutmsg,cycleprev"
      "SUPER,h,resizeactive,-99 0"
      "SUPER,l,resizeactive,99 0"
      "SUPERSHIFT,j,swapnext,none"
      "SUPERSHIFT,k,swapnext,prev"
    ];

    bind = let

      azertyMapping = {
        ampersand = "1";
        eacute = "2";
        quotedbl = "3";
        apostrophe = "4";
        parenleft = "5";
        minus = "6";
        egrave = "7";
        underscore = "8";
        ccedilla = "9";
        agrave = "10";
      };

      workspaces = [ 
        "ampersand"
        "eacute"
        "quotedbl"
        "apostrophe"
        "parenleft"
        "minus"
        "egrave"
        "underscore"
        "ccedilla"
        "agrave"
      ];

      # Map keys (arrows and hjkl) to hyprland directions (l, r, u, d)
    in [

      "SUPER,q,killactive"

      "SUPER,f,fullscreen,0"
      "SUPER,space,togglefloating"

      "SUPER,left,focusmonitor,l"
      "SUPER,right,focusmonitor,r"
      "SUPERSHIFT,left,movewindow,mon:l"
      "SUPERSHIFT,right,movewindow,mon:r"

    ] ++
    # Change workspace
    (map (n: 
      "SUPER,${n},split-workspace,${azertyMapping.${n}}"
    ) workspaces) ++

    # Move window to workspace
    (map (n: 
      "SUPERSHIFT,${n},split-movetoworkspacesilent,${azertyMapping.${n}}"
    ) workspaces);
  };
}
