{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./config/lf.nix
    ./config/git.nix
    # ./config/gtk.nix
    ./config/mpd.nix
    ./config/nvim.nix
    ./config/dunst.nix
    ./config/abook.nix
    ./config/cursor.nix
    ./config/firefox.nix
    ./config/ncmpcpp.nix
    ./config/scripts.nix
    ./config/zathura.nix
    ./config/newsboat.nix
    ./config/swayidle.nix
    ./config/userDirs.nix
    ./config/mpv/mpv.nix
    ./config/rofi/rofi.nix
  ];
}
