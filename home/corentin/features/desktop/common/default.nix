{ pkgs, ... }:

{
  imports = [
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
    anki # SRS
    audacity # Audio recording
    calibre # Ebook manager
    gimp
    gnome-boxes # QEMU Made easy
    nautilus # When yazi isn't enough
    helvum # Pipewire gui
    imv # Simple Image Viewer
    krita
    lynx # Terminal browser
    neovide
    obs-studio # Screen capturing tool
    swappy # Snapshot editing tool
    telegram-desktop # Telegram
    vesktop # better discord for linux
    xournalpp # Edition de PDF
  ];
}
