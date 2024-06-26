{
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "text/x-python" = [ "neovide.desktop" ];
      "text/css" = [ "neovide.desktop" ];
      "text/plain" = [ "neovide.desktop" ];
      "application/x-subrip" = [ "neovide.desktop" ];
      "application/x-trash" = [ "neovide.desktop" ];
      "x-scheme-handler/magnet" = [ "userapp-transmission-gtk-F8UY61.desktop" ];
      "application/x-bittorrent" = [ "torrent.desktop" ];
      "x-scheme-handler/tg" = [ "org.telegram.desktop.desktop" ];
      "application/x-xpinstall" = [
        "neovide.desktop"
        "firefox.desktop"
      ];
      "application/json" = [
        "neovide.desktop"
        "firefox.desktop"
      ];
      "text/html" = [
        "firefox.desktop"
        "neovide.desktop"
      ];
      "text/xml" = [
        "firefox.desktop"
        "neovide.desktop"
      ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
      "application/epub" = [ "org.pwmt.zathura-pdf-mupdf.desktop " ];
      "application/epub+zip" = [ "org.pwmt.zathura-pdf-mupdf.desktop " ];
      "image/jpeg" = [ "imv-dir.desktop" ];
      "video/mp4" = [ "mpv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "image/png" = [ "imv-dir.desktop" ];
    };
  };

  environment.etc."mailcap".text = ''
    text/plain; $EDITOR %s ;
    text/html; $BROWSER %s ; nametemplate=%s.html
    text/html; lynx -assume_charset=%{charset} -display_charset=utf-8 -dump -width=1024 %s; nametemplate=%s.html; copiousoutput;
    image/*; imv %s ;
    video/*; setsid mpv --quiet %s &; copiousoutput
    audio/*; mpv %s ;
    application/pdf; $READER %s ;
    application/pgp-encrypted; gpg -d '%s'; copiousoutput;
    application/pgp-keys; gpg --import '%s'; copiousoutput;
    application/x-subrip; $EDITOR %s ;
  '';
}
