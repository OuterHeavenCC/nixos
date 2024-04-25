{ pkgs, ... }:

{
  imports = [
    ./cursor.nix
    ./firefox.nix
    ./gtk.nix
    ./libreoffice.nix
    ./mpd.nix
    ./mpv.nix
    ./ncmpcpp.nix
    ./networkmanager_dmenu.nix
    ./tor.nix
    ./xdg.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    audacity                 # Audio recording
    bottles                  # Better lutris
    calibre                  # Ebook manager
    discord
    gimp
    gnome.gnome-boxes        # QEMU Made easy
    gnome.gnome-calculator   # When eva isn't enough
    gnome.nautilus           # When lf isn't enough
    helvum                   # Pipewire gui
    imv                      # Simple Image Viewer
    krita
    lynx                     # Terminal browser
    minecraft                # En attendant que prism refonctionne
    obs-studio               # Screen capturing tool
    swappy                   # Snapshot editing tool
    telegram-desktop         # Telegram
    warp                     # File transfer
    xdragon                  # Transfer files from CLI to GUI apps
    xournalpp                # Edition de PDF
  ];
}
