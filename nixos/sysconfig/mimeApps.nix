{ config, pkgs, ... }:

{
  xdg.mime = {
    enable = true;
    defaultApplications = {
    "text/*" = [ "nvim.desktop" "firefox.desktop" ];
    "text/x-python" = [ "nvim.desktop" ];
    "text/css" = [ "nvim.desktop" ];
    "application/x-trash" = [ "nvim.desktop" ];
    "x-scheme-handler/magnet" = [ "userapp-transmission-gtk-F8UY61.desktop" ];
    "application/x-bittorrent" = [ "torrent.desktop" ];
    "x-scheme-handler/tg" = [ "org.telegram.desktop.desktop" ];
    "application/x-xpinstall" = [ "nvim.desktop" "firefox.desktop" ];
    "application/json" = [ "nvim.desktop" "firefox.desktop" ];
    "pdf" = [ "zathura.desktop" ];
    "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
    "text/html" = [ "firefox.desktop"] ;
    "image/jpeg" = [ "imv.desktop" ];
    "video/mp4" = [ "mpv.desktop" ];
    "image/png" = [ "imv-dir.desktop" ];
    };
  };
}
