{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
     ark
     scc
     ncdu
     skim
     sd
     atool
     bat
     binutils
     bluez
     gtk4
     bottles
     bottom
     glib
     btop
     calcurse
     catppuccin-gtk
     chafa
     cinnamon.warpinator
     clang
     clipman
     colordiff
     ctpv
     du-dust
     duf
     dunst
     elinks
     eva
     exa
     exiftool
     fd
     ffmpeg
     ffmpegthumbnailer
     file
     firefox
     fontconfig
     fontforge
     foot
     fzf
     gamescope
     gcc
     git
     glibc
     glow
     gnome-epub-thumbnailer
     gnome.gnome-boxes
     gnome.gnome-disk-utility
     gnumake
     grim
     hexyl
     home-manager
     hyprpicker
     imagemagick
     imv
     isync
     jq 
     killall
     lazygit
     ledger
     lf
     libnotify
     libreoffice
     libsixel
     lxappearance-gtk2
     mcrcon
     mediainfo
     mlocate
     mpc-cli
     mpd
     mpv
     mpvScripts.sponsorblock
     mullvad
     mullvad-vpn
     musl
     ncmpcpp
     neofetch
     neovim
     networkmanager_dmenu
     newsboat
     newsboat
     nmap
     nodePackages_latest.peerflix
     nodejs
     obs-studio
     odt2txt
     p7zip
     pamixer
     pandoc
     pass-wayland
     pciutils
     pcmanfm
     pinentry
     piper
     polkit_gnome
     poppler_utils
     prismlauncher
     procs
     pulsemixer
     python3
     qemu
     ripdrag
     ripgrep
     ripgrep-all
     rofi-wayland
     rpcs3
     rustup
     sc-im
     scanmem
     silver-searcher
     slurp
     spotify
     sqlite
     steam
     swayidle
     swaylock
     swww
     telegram-desktop
     texlive.combined.scheme-full
     thunderbird
     tldr
     transmission
     transmission-gtk
     tree-sitter
     unrar
     unzip
     ventoy-full
     vimv-rs
     wev
     wget
     whitesur-gtk-theme
     wl-clipboard
     xcodebuild
     xdg-desktop-portal
     xdg-desktop-portal-hyprland
     xdg-user-dirs
     xmlstarlet
     ydotool
     yt-dlp
     zafiro-icons
     zathura
     zoxide
     ];
}
