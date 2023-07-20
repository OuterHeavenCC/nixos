{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./gtk.nix
    ./mpd.nix
    ./mpv.nix
    ./ncmpcpp.nix
    ./networkmanager_dmenu.nix
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
    lynx                     # Terminal browser
    obs-studio               # Screen capturing tool
    piper                    # Gaming mouse management
    prismlauncher            # Minecraft launcher
    telegram-desktop         # Telegram
    thunderbird              # En attendant d'avoir une configuration neomutt plus propre
    warp                     # File transfer
    xdragon                  # Transfer files from CLI to GUI apps
    xournalpp                # Edition de PDF
  ];
}
