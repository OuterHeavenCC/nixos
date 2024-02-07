{ lib, config, pkgs, inputs, ... }:
let
  inherit (config.home.sessionVariables) BROWSER EDITOR TERMINAL MAILCLIENT;
  inherit (config.colorscheme) colors;
  cfg = config.xdg;
in {

  imports = [ 
  ../common
  ../common/wayland-wm

  ./basic-binds.nix
  ./tty-init.nix
  
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.inputs.hyprland.hyprland;
    settings = {
      exec-once = let 
        wbg = "${pkgs.wbg}/bin/wbg";
        foot = "${pkgs.foot}/bin/foot";
        waybar = "${pkgs.waybar}/bin/waybar";
        swayidle = "${pkgs.swayidle}/bin/swayidle";
        xrandr = "${pkgs.xorg.xrandr}/bin/xrandr";
        wl-paste = "${pkgs.wl-clipboard}/bin/wl-paste";
        gammastep-indicator = "${pkgs.gammastep}/bin/gammastep-indicator";
        cliphist = "${pkgs.cliphist}/bin/cliphist";
      in [
        "${wbg} ${config.wallpaper}"
        "${foot} --server"
        "${waybar}"
        "${swayidle} -w"
        "${wl-paste} --type text --watch ${cliphist} store" 
        "${wl-paste} --type image --watch ${cliphist} store"
        "${xrandr} --output DP-1 --primary" # Fix Jeux Steam
        "${gammastep-indicator}"
      ];
      env = [
        "GDK_BACKEND,wayland,x11"
        "QT_QPA_PLATFORM,wayland;xcb"
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKEND,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "WLC_REPEAT_RATE,300"
        "WLC_REPEAT_DELAY,50"
        "NIXOS_OZONE_WL,1"
        "MOZ_ENABLE_WAYLAND,1"
        "MOZ_WEBRENDER,1"
        "WLR_DRM_NO_ATOMIC,1" # Allow Tearing
      ];
      windowrule = [
        "float, title:^(sfml)$"
        "center, title:^(sfml)$"
        "nofullscreenrequest, title:^(Lecteur multimédia)$" # Fix Telegram
        "tile, title:^(Battle.net)$"
        "opaque, class:^(mpv)$"
        "float, title:^(Calculatrice)$" # Calculatrice flottante
        "float, title:^(Waydroid)$"
      ];

      windowrulev2 = [
        "immediate, class:^(GameThread)$"
        "immediate, class:^(gamescope-wl)$"
        "immediate, class:^(Turbo-Overkill)$"
        "immediate, class:^(teardown.exe)$"
        "immediate, class:^(AlanWake2.exe)$"
        "immediate, class:^(Subnautica.exe)$"
        "immediate, class:^(ProjectCoral-Win64-Shipping.exe)$"
        "immediate, class:^(ObraDinn.exe)$"
        "immediate, class:^(Dead Space.exe)$"
        "immediate, class:^(SubnauticaZero.exe)$"
        "immediate, class:^(MonsterHunterWorld.exe)$"
        "immediate, class:^(SummonersWar.exe)$"
      ];
      input = {
        kb_layout = "fr";
        kb_model = "pc105";
        kb_options = "caps:super,terminate:ctrl_alt_bksp";
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
        active_opacity = 0.92;
        inactive_opacity = 0.75;
        fullscreen_opacity = 1.0;
        rounding = 5;
        drop_shadow = true;
        shadow_range = 12;
        shadow_offset = "3 3";
        shadow_render_power = 5;
        "col.shadow" = "0x44000000";
        "col.shadow_inactive" = "0x66000000";
      };
      animations = {
        enabled = true;
        bezier = [
          "easein,0.11, 0, 0.5, 0"
          "easeout,0.5, 1, 0.89, 1"
          "easeinback,0.36, 0, 0.66, -0.56"
          "easeoutback,0.34, 1.56, 0.64, 1"
        ];
        animation = [
          "windowsIn,1,3,easeoutback,slide"
          "windowsOut,1,3,easeinback,slide"
          "windowsMove,1,3,easeoutback"
          "workspaces,1,2,easeoutback,slide"
          "fadeIn,1,3,easeout"
          "fadeOut,1,3,easein"
          "fadeSwitch,1,3,easeout"
          "fadeShadow,1,3,easeout"
          "fadeDim,1,3,easeout"
          "border,1,3,easeout"
        ];
      };
      misc = {
        enable_swallow = true;
        swallow_regex = "${TERMINAL}";
      };
      general = {
        sensitivity = "1.0";
        gaps_in = "5";
        gaps_out = "20";
        border_size = "2";
        "col.active_border" = "0xFF${colors.base07}";
        "col.inactive_border" = "0x66${colors.base02}";
        layout = "master";
        allow_tearing = true;
      };
      master = { new_on_top = true; };
      bind = let

        abook = "${pkgs.abook}/bin/abook";
        blueman-manager = "${pkgs.blueman}/bin/blueman-manager";
        bmks = "${pkgs.bmks}/bin/bmks";
        btm = "${pkgs.bottom}/bin/btm";
        calcurse = "${pkgs.calcurse}/bin/calcurse";
        cliphist = "${pkgs.cliphist}/bin/cliphist";
        fuzzel = "${pkgs.fuzzel}/bin/fuzzel";
        gnome-calculator = "${pkgs.gnome.gnome-calculator}/bin/gnome-calculator";
        grimblast = "${inputs.hyprland-contrib.packages.${pkgs.system}.grimblast}/bin/grimblast";
        killmenu = "${pkgs.killmenu}/bin/killmenu";
        lf = "${pkgs.lf}/bin/lf";
        light = "${pkgs.light}/bin/light";
        mpc = "${pkgs.mpc-cli}/bin/mpc";
        ncmpcpp = "${pkgs.ncmpcpp}/bin/ncmpcpp";
        networkmanager_dmenu = "${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";
        newsboat = "${pkgs.newsboat}/bin/newsboat";
        pamixer = "${pkgs.pamixer}/bin/pamixer";
        powermenu = "${pkgs.powermenu}/bin/powermenu";
        pulsemixer = "${pkgs.pulsemixer}/bin/pulsemixer";
        taskwarrior-tui = "${pkgs.taskwarrior-tui}/bin/taskwarrior-tui";
        telegram-desktop = "${pkgs.telegram-desktop}/bin/telegram-desktop";
        waybar = "${pkgs.waybar}/bin/waybar";
        wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
        ytfzf = "${pkgs.ytfzf}/bin/ytfzf";

      in [
        "SUPER,Return,exec,${TERMINAL}"
        "SUPER,B,exec,${blueman-manager}"
        "SUPERSHIFT,B,exec,pkill -USR1 ${waybar}"
        "SUPER,C,exec,${TERMINAL} -e ${calcurse}"
        "SUPERSHIFT,C,exec,${gnome-calculator}"
        "SUPER,d,exec,${fuzzel}"
        "SUPER,E,exec,${TERMINAL} -e ${MAILCLIENT}"
        "SUPERSHIFT,E,exec,${TERMINAL} -e ${abook} -C ${cfg.configHome}/abook/abookrc --datafile ${cfg.configHome}/abook/addressbook"
        "SUPER,M,exec,${TERMINAL} -e ${ncmpcpp}"
        "SUPERSHIFT,M,exec,${pamixer} -t"
        "SUPER,N,exec,${TERMINAL} -e ${EDITOR}"
        "SUPERSHIFT,N,exec,${TERMINAL} -e ${newsboat}"
        "SUPER,P,exec,${mpc} toggle"
        "SUPERSHIFT,P,exec,${mpc} pause"
        "SUPER,R,exec,${TERMINAL} -e ${lf}"
        "SUPER,S,exec,${TERMINAL} -e ${pulsemixer}"
        "SUPER,V,exec,${ytfzf} -D"
        "SUPER,T,exec,${TERMINAL} -e ${taskwarrior-tui}"
        "SUPERSHIFT,S,exec,${bmks}"
        "SUPER,W,exec,${BROWSER}"
        "SUPERSHIFT,W,exec,${networkmanager_dmenu}"
        "SUPER,X,exec,${cliphist} list | ${fuzzel} -d | cliphist decode | ${wl-copy}"
        "SUPER,F4,exec,${TERMINAL} -e ${btm}"
        "SUPER,exclam,exec,${telegram-desktop}"
        "SUPER,BackSpace,exec,${powermenu}"
        "SUPERSHIFT,BackSpace,exec,passfuzzel"
        "SUPER,Delete,exec,${killmenu}"
        ",XF86AudioMute,exec,${pamixer} --toggle-mute"

        # Screenshots

        ",Print,exec,${grimblast} --notify --freeze copy output"
        "CONTROL,Print,exec,${grimblast} --notify --freeze copy screen"
        "SUPER,Print,exec,${grimblast} --notify --freeze copy area"
        "ALT,Print,exec,${grimblast} --notify --freeze copy active"


        # Lumière

        ",XF86MonBrightnessUp,exec,${light} -A 5"
        ",XF86MonBrightnessDown,exec,${light} -U 5"

      ];

      binde = let 
        pamixer = "${pkgs.pamixer}/bin/pamixer";
      in [
        ",XF86AudioRaiseVolume,exec,${pamixer} -i 5"
        ",XF86AudioLowerVolume,exec,${pamixer} -d 5"
      ];

      monitor = map (m: let
        resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
        position = "${toString m.x}x${toString m.y}";
        vrr = "${toString m.vrr}";
      in
        "${m.name},${if m.enabled then "${resolution},${position},1,vrr,${vrr},bitdepth,10" else "disable"}"
      ) (config.monitors);

      workspace = map (m:
        "${m.name},${m.workspace}"
      ) (lib.filter (m: m.enabled && m.workspace != null) config.monitors);
      };

      plugins = [ pkgs.inputs.split-monitor-workspaces.split-monitor-workspaces ];

      extraConfig = ''
        # Passthrough mode (e.g. for VNC, Gaming)
        bind=SUPER,F12,submap,passthrough
        submap=passthrough
        bind=SUPER,F12,submap,reset
        submap=reset
      '';

  };
}
