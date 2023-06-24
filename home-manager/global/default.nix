{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./config/abook.nix
    ./config/cursor.nix
    ./config/dunst.nix
    ./config/firefox.nix
    ./config/git.nix
    ./config/gpg.nix
    # ./config/gtk.nix
    ./config/lf.nix
    ./config/mpd.nix
    ./config/mpv/mpv.nix
    ./config/ncmpcpp.nix
    ./config/newsboat.nix
    ./config/nvim.nix
    ./config/rofi/rofi.nix
    ./config/scripts.nix
    ./config/swayidle.nix
    ./config/userDirs.nix
    ./config/zathura.nix
  ];
}