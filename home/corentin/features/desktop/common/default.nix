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
    imv                      # Simple Image Viewer
    krita
    lynx                     # Terminal browser
    obs-studio               # Screen capturing tool
    piper                    # Gaming mouse management
    prismlauncher            # Minecraft launcher
    swappy                   # Snapshot editing tool
    telegram-desktop         # Telegram
    warp                     # File transfer
    xdragon                  # Transfer files from CLI to GUI apps
    xournalpp                # Edition de PDF
  ];
}
