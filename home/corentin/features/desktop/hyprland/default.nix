{ lib, config, pkgs, inputs, ... }:
let
  inherit (config.home.sessionVariables) BROWSER EDITOR TERMINAL MAILCLIENT;
  inherit (config.colorscheme) colors;
  cfg = config.xdg;
in {

  imports = [ ../common ../common/wayland-wm ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "wbg ${cfg.dataHome}/bg"
        "foot --server"
        "waybar"
        "swayidle -w"
        "wl-paste -t text --watch clipman store"
        "xrandr --output DP-1 --primary" # Fix Jeux Steam
      ];
      env = [
        "GDK_BACKEND=wayland,x11"
        ''QT_QPA_PLATFORM="wayland,xcb"''
        "SDL_VIDEODRIVER=x11"
        "CLUTTER_BACKEND=wayland"
        "XDG_CURRENT_DESKTOP=Hyprland"
        "XDG_SESSION_TYPE=wayland"
        "XDG_SESSION_DESKTOP=Hyprland"
        "QT_AUTO_SCREEN_SCALE_FACTOR=1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION=1"
        "QT_QPA_PLATFORMTHEME=qt5ct"
        "WLC_REPEAT_RATE=300"
        "WLC_REPEAT_DELAY=50"
        ''NIXOS_OZONE_WL"=1''
        "MOZ_ENABLE_WAYLAND=1"
        "MOZ_WEBRENDER==1"
      ];
      windowrule = [
        "float, Rofi"
        "noborder, Rofi"
        "float, title:^(sfml)$"
        "center, title:^(sfml)$"
        "nofullscreenrequest, title:^(Lecteur multimédia)$" # Fix Telegram
        "tile, title:^(Battle.net)$"
        "float, title:^(Calculatrice)$" # Calculatrice flottante
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
          size = "5";
          passes = "3";
          ignore_opacity = "1";
          new_optimizations = "1";
        };
        active_opacity = "0.94";
        inactive_opacity = "0.84";
        fullscreen_opacity = "1.0";
        rounding = "10";
        drop_shadow = "1";
        shadow_range = "12";
        shadow_offset = "3 3";
        shadow_render_power = "5";
        "col.shadow" = "0x33000000";
        "col.shadow_inactive" = "0x22000000";
      };
      animations = {
        enabled = "1";
        bezier = [
          "easein,0.11, 0, 0.5, 0"
          "easeout,0.5, 1, 0.89, 1"
          "easeinout,0.45, 0, 0.55, 1"
        ];
        animation = [
          "windowsIn,1,3,easeout,slide"
          "windowsOut,1,3,easein,slide"
          "windowsMove,1,3,easeout"
          "fadeIn,1,3,easeout"
          "fadeOut,1,3,easein"
          "fadeSwitch,1,3,easeout"
          "fadeShadow,1,3,easeout"
          "fadeDim,1,3,easeout"
          "border,1,3,easeout"
          "workspaces,1,2,easeout,slide"
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
      };
      master = { new_on_top = true; };
      bind = [
        "SUPER,Return,exec,${TERMINAL}"
        "SUPER,B,exec,blueman-manager"
        "SUPERSHIFT,B,exec,pkill -USR1 waybar"
        "SUPER,C,exec,${TERMINAL} -e calcurse"
        "SUPERSHIFT,C,exec,gnome-calculator"
        "SUPER,d,exec,rofi-launcher"
        "SUPERSHIFT,d,exec,rofi-runner"
        "SUPER,E,exec,${TERMINAL} -e ${MAILCLIENT}"
        "SUPERSHIFT,E,exec,${TERMINAL} -e abook -C ${cfg.configHome}/abook/abookrc --datafile ${cfg.configHome}/abook/addressbook"
        "SUPER,F,fullscreen,0"
        "SUPER,M,exec,${TERMINAL} -e ncmpcpp"
        "SUPERSHIFT,M,exec,pamixer -t"
        "SUPER,N,exec,${TERMINAL} -e ${EDITOR}"
        "SUPERSHIFT,N,exec,${TERMINAL} -e newsboat"
        "SUPER,P,exec,mpc toggle"
        "SUPERSHIFT,P,exec,mpc pause"
        "SUPER,Q,killactive,"
        "SUPERSHIFT,Q,exit,"
        "SUPER,R,exec,${TERMINAL} -e lf"
        "SUPER,S,exec,${TERMINAL} -e pulsemixer"
        "SUPER,T,exec,${TERMINAL} -e taskwarrior-tui"
        "SUPERSHIFT,S,exec,bmks"
        "SUPER,W,exec,${BROWSER}"
        "SUPERSHIFT,W,exec,networkmanager_dmenu"
        ''
          SUPER,X,exec,clipman pick -t rofi -T"-theme ${cfg.configHome}/rofi/launcher.rasi"''
        "SUPER,F4,exec,${TERMINAL} -e btm"
        "SUPER,F6,exec,rofi-mullvad-toggle"
        "SUPER,F9,exec,rofi-mount"
        "SUPER,F10,exec,rofi-umount"
        ",Print,exec,rofi-printscreen"
        "SUPER,exclam,exec,telegram-desktop"
        "SUPER,BackSpace,exec,rofi-powermenu"
        "SUPERSHIFT,BackSpace,exec,passrofi -theme ${cfg.configHome}/rofi/long-launcher.rasi"
        "SUPER,space,togglefloating,"
        "SUPER,Delete,exec,rofi-kill"
        ",XF86AudioMute,exec,pamixer --toggle-mute"
        ",XF86MonBrightnessUp,exec,light -A 5"
        ",XF86MonBrightnessDown,exec,light -U 5"
        "SUPER,left,focusmonitor,l"
        "SUPERSHIFT,h,focusmonitor,l"
        "SUPERSHIFT,left,movewindow,mon:l"
        "SUPER,right,focusmonitor,r"
        "SUPERSHIFT,l,focusmonitor,r"
        "SUPERSHIFT,right,movewindow,mon:r"
        "SUPER,ampersand,split-workspace,1"
        "SUPER,eacute,split-workspace,2"
        "SUPER,quotedbl,split-workspace,3"
        "SUPER,apostrophe,split-workspace,4"
        "SUPER,parenleft,split-workspace,5"
        "SUPER,minus,split-workspace,6"
        "SUPER,egrave,split-workspace,7"
        "SUPER,underscore,split-workspace,8"
        "SUPER,ccedilla,split-workspace,9"
        "SUPER,agrave,split-workspace,10"
        "SUPERSHIFT,ampersand,split-movetoworkspacesilent,1"
        "SUPERSHIFT,eacute,split-movetoworkspacesilent,2"
        "SUPERSHIFT,quotedbl,split-movetoworkspacesilent,3"
        "SUPERSHIFT,apostrophe,split-movetoworkspacesilent,4"
        "SUPERSHIFT,parenleft,split-movetoworkspacesilent,5"
        "SUPERSHIFT,minus,split-movetoworkspacesilent,6"
        "SUPERSHIFT,egrave,split-movetoworkspacesilent,7"
        "SUPERSHIFT,underscore,split-movetoworkspacesilent,8"
        "SUPERSHIFT,ccedilla,split-movetoworkspacesilent,9"
        "SUPERSHIFT,agrave,split-movetoworkspacesilent,10"
      ];

      bindm = [ "SUPER,mouse:272,movewindow" "SUPER,mouse:273,resizewindow" ];

      binde = [
        ",XF86AudioRaiseVolume,exec,pamixer -i 5"
        ",XF86AudioLowerVolume,exec,pamixer -d 5"
        "SUPER,j,layoutmsg,cyclenext"
        "SUPER,k,layoutmsg,cycleprev"
        "SUPER,h,resizeactive,-99 0"
        "SUPER,l,resizeactive,99 0"
        "SUPERSHIFT,j,swapnext,none"
        "SUPERSHIFT,k,swapnext,prev"
      ];
    };
    plugins = with pkgs; [ split-monitor-workspaces ];
    extraConfig = (import ./monitors.nix {
      inherit lib;
      inherit (config) monitors;
    });
  };
}
