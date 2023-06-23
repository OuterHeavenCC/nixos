{ config, pkgs, ... }:

{
  home = {
  pointerCursor = {
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 16;
    gtk.enable = true;
    };
  };
}
