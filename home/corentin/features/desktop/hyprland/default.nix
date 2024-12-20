{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  inherit (config.home.sessionVariables)
    BROWSER
    EDITOR
    TERMINAL
    MAILCLIENT
    ;
  cfg = config.xdg;
in
{

  imports = [
    ../common
    ../common/wayland-wm

    ./basic-binds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    settings = {
      exec-once =
        let
          pointer = config.home.pointerCursor;
          foot = "${pkgs.foot}/bin/foot";
          swayidle = "${pkgs.swayidle}/bin/swayidle";
          xrandr = "${pkgs.xorg.xrandr}/bin/xrandr";
          wl-paste = "${pkgs.wl-clipboard}/bin/wl-paste";
          gammastep-indicator = "${pkgs.gammastep}/bin/gammastep-indicator";
          cliphist = "${pkgs.cliphist}/bin/cliphist";
        in
        [
          "hyprctl setcursor ${pointer.name} ${toString pointer.size}"
          "${foot} --server"
          "${swayidle} -w"
          "${wl-paste} --type text --watch ${cliphist} store"
          "${wl-paste} --type image --watch ${cliphist} store"
          "${xrandr} --output DP-1 --primary" # Fix Jeux Steam
          "${gammastep-indicator}"
          "ags -b hypr"
        ];
      env = [
        "GDK_BACKEND,wayland,x11"
        "QT_QPA_PLATFORM,wayland;xcb"
        "CLUTTER_BACKEND,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "WLC_REPEAT_RATE,300"
        "WLC_REPEAT_DELAY,50"
        "NIXOS_OZONE_WL,1"
      ];
      windowrule = [
        "float, title:^(sfml)$"
        "center, title:^(sfml)$"
        "tile, title:^(Battle.net)$"
        "opaque, class:^(mpv)$"
        "float, title:^(Waydroid)$"
        "tile, class:^(neovide)$"

        "noblur, kando"
        "size 100% 100%, kando"
        "noborder, kando"
        "noanim, kando"
        "float, kando"
        "pin, kando"
      ];

      windowrulev2 = [
        "immediate, class:^(Turbo-Overkill)$"
        "noanim, class:^(fuzzel)$"

        "float,class:^(scratchpad)$"
        "size 80% 85%,class:^(scratchpad)$"
        "workspace special silent,class:^(scratchpad)$"
        "center,class:^(scratchpad)$"
      ];
      input = {
        kb_layout = "fr,us";
        kb_options = "caps:super,terminate:ctrl_alt_bksp,grp;";
        follow_mouse = "1";
        repeat_rate = "50";
        repeat_delay = "300";
      };
      decoration = {
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          ignore_opacity = 1;
          new_optimizations = 1;
        };

        shadow = {
          enabled = true;
          range = 12;
          offset = "3 3";
          render_power = 5;
          color = lib.mkForce "0x44000000";
          color_inactive = lib.mkForce "0x66000000";
        };

        active_opacity = 0.92;
        inactive_opacity = 0.75;
        fullscreen_opacity = 1.0;
        rounding = 5;

      };
      animations = {
        enabled = true;
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 5, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      misc = {
        enable_swallow = true;
        swallow_regex = "${TERMINAL}";
        force_default_wallpaper = "0";
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
      general = {
        gaps_in = "5";
        gaps_out = "20";
        border_size = "2";
        "col.active_border" = lib.mkForce "0xFF${config.lib.stylix.colors.base07}";
        "col.inactive_border" = lib.mkForce "0x66${config.lib.stylix.colors.base02}";
        layout = "master";
        allow_tearing = true;
      };
      master = {
        new_on_top = true;
      };

      cursor = {
        no_hardware_cursors = true;
      };

      bind =
        let
          abook = "${pkgs.abook}/bin/abook";
          blueman-manager = "${pkgs.blueman}/bin/blueman-manager";
          bmks = "${pkgs.bmks}/bin/bmks";
          btop = "${pkgs.btop}/bin/btop";
          calcurse = "${pkgs.calcurse}/bin/calcurse";
          cliphist = "${pkgs.cliphist}/bin/cliphist";
          eva = "${pkgs.eva}/bin/eva";
          fuzzel = "${pkgs.fuzzel}/bin/fuzzel";
          fuzzelunicode = "${pkgs.fuzzelunicode}/bin/fuzzelunicode";
          grimblast = "${pkgs.grimblast}/bin/grimblast";
          hyprctl = "${pkgs.hyprland}/bin/hyprctl";
          light = "${pkgs.light}/bin/light";
          mpc = "${pkgs.mpc-cli}/bin/mpc";
          ncmpcpp = "${pkgs.ncmpcpp}/bin/ncmpcpp";
          networkmanager_dmenu = "${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";
          newsboat = "${pkgs.newsboat}/bin/newsboat";
          pamixer = "${pkgs.pamixer}/bin/pamixer";
          passmenu = "${pkgs.pass}/bin/passmenu";
          powermenu = "ags -b hypr -t powermenu";
          pulsemixer = "${pkgs.pulsemixer}/bin/pulsemixer";
          signal-desktop = "${pkgs.signal-desktop}/bin/signal-desktop";
          wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
          applauncher = "ags -b hypr -t launcher";
          hyprgamemode = pkgs.writeShellScript "hyprgamemode.sh" ''
            #!/usr/bin/env sh
            HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
            if [ "$HYPRGAMEMODE" = 1 ] ; then
              hyprctl --batch "\
                keyword animations:enabled 0;\
                keyword decoration:drop_shadow 0;\
                keyword decoration:blur:enabled 0;\
                keyword general:gaps_in 0;\
                keyword general:gaps_out 0;\
                keyword general:border_size 1;\
                keyword decoration:rounding 0"
                exit
                fi
                hyprctl reload
          '';
        in
        [
          "SUPER,Return,exec,${TERMINAL}"
          "SUPER,B,exec,${blueman-manager}"
          "SUPERSHIFT,B,exec,ags -b hypr quit; ags -b hypr"
          "SUPER,C,exec,${TERMINAL} -e ${calcurse}"
          "SUPERSHIFT,C,exec,${TERMINAL} -e ${eva}"
          "SUPER,d,exec,exec ${applauncher}"
          "SUPER,E,exec,${TERMINAL} -e ${MAILCLIENT}"
          "SUPERSHIFT,E,exec,${TERMINAL} -e ${abook} -C ${cfg.configHome}/abook/abookrc --datafile ${cfg.configHome}/abook/addressbook"
          "SUPER,M,exec,${TERMINAL} -e ${ncmpcpp}"
          "SUPERSHIFT,M,exec,${pamixer} -t"
          "SUPER,N,exec,${TERMINAL} -e ${EDITOR}"
          "SUPERSHIFT,N,exec,${TERMINAL} -e ${newsboat}"
          "SUPER,P,exec,${mpc} toggle"
          "SUPERSHIFT,P,exec,${mpc} pause"
          "SUPER,R,exec,${TERMINAL} -e zsh -l -ic 'yy; zsh'" # Trick sorti tout droit du ghetto pour faire fonctionner le wrapper de yazi
          "SUPER,S,exec,${TERMINAL} -e ${pulsemixer}"
          "SUPERSHIFT,S,exec,${bmks}"
          "SUPER,W,exec,${BROWSER}"
          "SUPERSHIFT,W,exec,${networkmanager_dmenu}"
          "SUPER,X,exec,${cliphist} list | ${fuzzel} -d | cliphist decode | ${wl-copy}"
          "SUPER,exclam,exec,${signal-desktop}"
          "SUPER,BackSpace,exec,${powermenu}"
          "SUPERSHIFT,BackSpace,exec,${passmenu}"
          "SUPER,Delete,exec,${btop}"
          ",XF86AudioMute,exec,${pamixer} --toggle-mute"
          "SUPER,Insert,exec,${fuzzelunicode}"

          # Function

          "SUPER,g,exec,${hyprgamemode}"

          # Screenshots
          ",Print,exec,${grimblast} --notify --freeze copy output"
          "CONTROL,Print,exec,${grimblast} --notify --freeze copy screen"
          "SUPER,Print,exec,${grimblast} --notify --freeze copy area"
          "ALT,Print,exec,${grimblast} --notify --freeze copy active"

          # Lumière

          ",XF86MonBrightnessUp,exec,${light} -A 5"
          ",XF86MonBrightnessDown,exec,${light} -U 5"

          # Fix for switching layout with keyd
          "SHIFT,Alt_L,exec,${hyprctl} switchxkblayout keyd-virtual-keyboard next"

          # Musisque
          ",XF86Tools,exec,${TERMINAL} -e ${ncmpcpp}"
          ",XF86AudioPrev,exec,${mpc} prev"
          ",XF86AudioPlay,exec,${mpc} toggle"
          ",XF86AudioNext,exec,${mpc} next"

          # Calculatrice
          ",XF86Calculator,exec,${TERMINAL} -e ${eva}"

          # Search
          ",XF86Search,exec,${fuzzel}"
        ];

      binde =
        let
          pamixer = "${pkgs.pamixer}/bin/pamixer";
        in
        [
          ",XF86AudioRaiseVolume,exec,${pamixer} -i 5"
          ",XF86AudioLowerVolume,exec,${pamixer} -d 5"
        ];

      monitor = map (
        m:
        let
          resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
          position = "${toString m.x}x${toString m.y}";
          vrr = "${toString m.vrr}";
        in
        "${m.name},${if m.enabled then "${resolution},${position},1,vrr,${vrr},bitdepth,10" else "disable"}"
      ) (config.monitors);
    };

    extraConfig = ''
      # Passthrough mode (e.g. for VNC, Gaming)
      bind=SUPER,F12,submap,passthrough
      submap=passthrough
      bind=SUPER,F12,submap,reset
      submap=reset
    '';
  };
}
