{
  home.file.".mailcap" = {
    enable = true;
    executable = true;
    text = ''
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
  };
}
