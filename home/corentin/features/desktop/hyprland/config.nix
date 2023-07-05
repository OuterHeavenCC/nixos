{home, colorscheme}:
''
env = GDK_BACKEND=wayland,x11
env = QT_QPA_PLATFORM="wayland,xcb"
env = SDL_VIDEODRIVER=x11
env = CLUTTER_BACKEND=wayland
env = XDG_CURRENT_DESKTOP=Hyprland
env = XDG_SESSION_TYPE=wayland
env = XDG_SESSION_DESKTOP=Hyprland
env = QT_AUTO_SCREEN_SCALE_FACTOR=1
env = QT_WAYLAND_DISABLE_WINDOWDECORATION=1
env = QT_QPA_PLATFORMTHEME=qt5ct
env = WLC_REPEAT_RATE=300
env = WLC_REPEAT_DELAY=50

exec-once=swww init
exec-once=foot --server
exec-once=waybar
exec-once=swayidle -w
exec-once=wl-paste -t text --watch clipman store

windowrule = float, Rofi
windowrule = noborder, Rofi
windowrule = float, title:^(sfml)$
windowrule = center, title:^(sfml)$

# Fix Telegram
windowrule = nofullscreenrequest, title:^(Lecteur multimédia)$
windowrule = float, title:^(Calculatrice)$


input {
    kb_layout=fr
    kb_variant=
    kb_model=pc105
    kb_options=caps:super,terminate:ctrl_alt_bksp
    kb_rules=evdev

    follow_mouse=1

    repeat_rate=50
    repeat_delay=300
    
    left_handed=0
}

decoration {
    active_opacity=0.94
    inactive_opacity=0.84
    fullscreen_opacity=1.0
    rounding=10
    blur=true
    blur_size=5
    blur_passes=3
    blur_new_optimizations=true
    blur_ignore_opacity
    drop_shadow = true
    shadow_range=12
    shadow_offset=3 3
    shadow_render_power=5
    col.shadow= 0x33000000
    col.shadow_inactive=0x22000000
    blur_new_optimizations=1
  }

animations {
    enabled=1
    bezier=easein,0.11, 0, 0.5, 0
    bezier=easeout,0.5, 1, 0.89, 1
    bezier=easeinout,0.45, 0, 0.55, 1

    animation=windowsIn,1,3,easeout,slide
    animation=windowsOut,1,3,easein,slide
    animation=windowsMove,1,3,easeout

    animation=fadeIn,1,3,easeout
    animation=fadeOut,1,3,easein
    animation=fadeSwitch,1,3,easeout
    animation=fadeShadow,1,3,easeout
    animation=fadeDim,1,3,easeout
    animation=border,1,3,easeout

    animation=workspaces,1,2,easeout,slide

  }

misc {
    enable_swallow = true
    swallow_regex="footclient"
  }

general {
    sensitivity=1.0 # for mouse cursor

    gaps_in=5
    gaps_out=20
    border_size=2
    col.active_border=0xFF${colorscheme.colors.base07}
    col.inactive_border=0x66${colorscheme.colors.base02}
    layout=master

}

master {
    new_on_top=true
  }



bind=SUPER,Return,exec,footclient

bind=SUPER,B,exec,blueman-manager
bind=SUPERSHIFT,B,exec,pkill -USR1 waybar

bind=SUPER,C,exec,footclient -e calcurse
bind=SUPERSHIFT,C,exec,gnome-calculator

bind=SUPER,d,exec,rofi-launcher
bind=SUPERSHIFT,d,exec,rofi-runner

bind=SUPER,E,exec,thunderbird

bind=SUPER,F,fullscreen,0

bind=SUPER,M,exec,footclient -e ncmpcpp
bind=SUPERSHIFT,M,exec,pamixer -t

bind=SUPER,N,exec,footclient -e lvim
bind=SUPERSHIFT,N,exec,footclient -e newsboat

bind=SUPER,P,exec,mpc toggle
bind=SUPERSHIFT,P,exec,mpc pause

bind=SUPER,Q,killactive,
bind=SUPERSHIFT,Q,exit,

bind=SUPER,R,exec,footclient -e lf

bind=SUPER,S,exec,footclient -e pulsemixer
bind=SUPERSHIFT,S,exec,bmks

bind=SUPER,W,exec,firefox
bind=SUPERSHIFT,W,exec,footclient -e nmtui

bind=SUPER,X,exec,clipman pick -t rofi -T"-theme ~/.config/rofi/launcher.rasi"

bind=SUPER,F4,exec,footclient -e btm
bind=SUPER,F5,exec,rofi -theme ~/.config/rofi/launcher.rasi -show ssh
bind=SUPER,F6,exec,rofi-mullvad-toggle
bind=SUPER,F7,exec,rofi-td-toggle
bind=SUPER,F9,exec,rofi-mount
bind=SUPER,F10,exec,rofi-umount
bind=SUPER,F11,exec,firefox localhost:9091/transmission/web
bind=SUPER,F12,submap,passthrough
submap=passthrough
bind=SUPER,F12,submap,reset
submap=reset

bind=,Print,exec,rofi-printscreen

bind=SUPER,exclam,exec,telegram-desktop

bind=SUPER,BackSpace,exec,rofi-powermenu
bind=SUPERSHIFT,BackSpace,exec,passrofi -theme ~/.config/rofi/long-launcher.rasi

bind=SUPER,space,togglefloating,
bind=SUPER,Delete,exec,rofi-kill

binde=,XF86AudioRaiseVolume,exec,pamixer -i 5
binde=,XF86AudioLowerVolume,exec,pamixer -d 5
bind=,XF86AudioMute,exec,pamixer --toggle-mute

bind=,XF86MonBrightnessUp,exec,light -A 5
bind=,XF86MonBrightnessDown,exec,light -U 5

binde=SUPER,j,layoutmsg,cyclenext
binde=SUPER,k,layoutmsg,cycleprev
binde=SUPER,h,resizeactive,-99 0
binde=SUPER,l,resizeactive,99 0

binde=SUPERSHIFT,j,swapnext,none
binde=SUPERSHIFT,k,swapnext,prev

bind=SUPER,left,focusmonitor,l
bind=SUPERSHIFT,left,movewindow,mon:l
bind=SUPER,right,focusmonitor,r
bind=SUPERSHIFT,right,movewindow,mon:l

bindm=SUPER,mouse:272,movewindow
bindm=SUPER,mouse:273,resizewindow

bind=SUPER,ampersand,workspace,1
bind=SUPER,eacute,workspace,2
bind=SUPER,quotedbl,workspace,3
bind=SUPER,apostrophe,workspace,4
bind=SUPER,parenleft,workspace,5
bind=SUPER,minus,workspace,6
bind=SUPER,egrave,workspace,7
bind=SUPER,underscore,workspace,8
bind=SUPER,ccedilla,workspace,9
bind=SUPER,agrave,workspace,10

bind=SUPERSHIFT,ampersand,movetoworkspacesilent,1
bind=SUPERSHIFT,eacute,movetoworkspacesilent,2
bind=SUPERSHIFT,quotedbl,movetoworkspacesilent,3
bind=SUPERSHIFT,apostrophe,movetoworkspacesilent,4
bind=SUPERSHIFT,parenleft,movetoworkspacesilent,5
bind=SUPERSHIFT,minus,movetoworkspacesilent,6
bind=SUPERSHIFT,egrave,movetoworkspacesilent,7
bind=SUPERSHIFT,underscore,movetoworkspacesilent,8
bind=SUPERSHIFT,ccedilla,movetoworkspacesilent,9
bind=SUPERSHIFT,agrave,movetoworkspacesilent,10

exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
''
