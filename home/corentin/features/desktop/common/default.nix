{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./gtk.nix
    ./kdeconnect.nix
    ./mpv.nix
    ./xdg.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    baobab                   # Disk management tool
    blanket                  # White noise stuff
    bottles                  # Better lutris
    gimp                     # GNU Image Manipulation Program
    gnome.gnome-boxes        # QEMU Made easy
    gnome.gnome-calculator   # When eva isn't enough
    gnome.nautilus           # When lf isn't enough
    imv                      # Simple Image Viewer
    libreoffice              # When pandoc isn't enought
    obs-studio               # Screen capturing tool
    piper                    # Gaming mouse management
    prismlauncher           # Minecraft launcher
    spotify                  # Peut-être à enlever si j'utilise ncmpcpp ?
    telegram-desktop         # Telegram
    thunderbird              # En attendant d'avoir une configuration neomutt plus propre
    warp                     # File transfer
  ];
}
