{
  home.sessionVariables.MAILCLIENT = "neomutt";
  programs.neomutt = {
    enable = true;
    vimKeys = true;
    checkStatsInterval = 60;
    sort = "reverse-date";
    sidebar = {
      enable = true;
      width = 30;
    };

    settings = {
      mark_old = "no";
      text_flowed = "yes";
      reverse_name = "yes";
      mime_type_query_command = ''"file --mime-type -b %s"'';
      date_format = ''"%d/%m/%y %H:%M"'';
      index_format = ''"%2C %Z %?X?A& ? %D %-15.15F %s (%-4.4c)"'';
      smtp_authenticators = ''"gssapi:login"'';
      query_command = ''"abook --mutt-query '%s'"'';
      rfc2047_parameters = "yes";
      editor = "nvim";
      sleep_time = "0"; # Pause 0 seconds for informational messages
      markers = "no"; # Disables the `+` displayed at line wraps
      mime_forward = "yes"; # attachments are forwarded with mail
      wait_key = "no"; # mutt won't ask "press key to continue"
      fast_reply = "yes"; # skip to compose when replying
      fcc_attach = "yes"; # save attachments with the body
      forward_format = ''"Fwd: %s"''; # format of subject when forwarding
      forward_quote = "yes"; # include message in forwards
      include = "yes"; # include message in replies
      mail_check = "60"; # to avoid lags using IMAP with some email providers (yahoo for example)
    };
    binds = [
      {
        action = "noop";
        key = "gT";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "noop";
        key = "gg";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "noop";
        key = "gt";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "noop";
        key = "dT";
        map = [ "index" ];
      }
      {
        action = "noop";
        key = "dd";
        map = [ "index" ];
      }
      {
        action = "noop";
        key = "dt";
        map = [ "index" ];
      }
      {
        action = "noop";
        key = "i";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "noop";
        key = "g";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "noop";
        key = "\\Cf";
        map = [ "index" ];
      }
      {
        action = "noop";
        key = "M";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "noop";
        key = "C";
        map = [
          "index"
          "pager"
        ];
      }

      # General Bindings
      {
        action = "first-entry";
        key = "gg";
        map = [ "index" ];
      }
      {
        action = "next-entry";
        key = "j";
        map = [ "index" ];
      }
      {
        action = "previous-entry";
        key = "k";
        map = [ "index" ];
      }
      {
        action = "view-mailcap";
        key = "<return>";
        map = [ "attach" ];
      }
      {
        action = "view-mailcap";
        key = "l";
        map = [ "attach" ];
      }
      {
        action = "noop";
        key = "<space>";
        map = [ "editor" ];
      }
      {
        action = "last-entry";
        key = "G";
        map = [ "index" ];
      }
      {
        action = "exit";
        key = "h";
        map = [
          "pager"
          "attach"
        ];
      }
      {
        action = "next-line";
        key = "j";
        map = [ "pager" ];
      }
      {
        action = "previous-line";
        key = "k";
        map = [ "pager" ];
      }
      {
        action = "view-attachments";
        key = "l";
        map = [ "pager" ];
      }
      {
        action = "delete-message";
        key = "D";
        map = [ "index" ];
      }
      {
        action = "undelete-message";
        key = "U";
        map = [ "index" ];
      }
      {
        action = "limit";
        key = "L";
        map = [ "index" ];
      }
      {
        action = "noop";
        key = "h";
        map = [ "index" ];
      }
      {
        action = "display-message";
        key = "l";
        map = [ "index" ];
      }
      {
        action = "tag-entry";
        key = "<space>";
        map = [
          "index"
          "query"
        ];
      }
      {
        action = "view-raw-message";
        key = "H";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "select-entry";
        key = "l";
        map = [ "browser" ];
      }
      {
        action = "top-page";
        key = "gg";
        map = [
          "pager"
          "browser"
        ];
      }
      {
        action = "bottom-page";
        key = "G";
        map = [
          "pager"
          "browser"
        ];
      }
      {
        action = "half-down";
        key = "d";
        map = [
          "index"
          "pager"
          "browser"
        ];
      }
      {
        action = "half-up";
        key = "u";
        map = [
          "index"
          "pager"
          "browser"
        ];
      }
      {
        action = "sync-mailbox";
        key = "S";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "group-reply";
        key = "R";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "complete-query";
        key = "<Tab>";
        map = [ "editor" ];
      }
      {
        action = "sidebar-next";
        key = "\\Cj";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "sidebar-prev";
        key = "\\Ck";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "sidebar-open";
        key = "\\Co";
        map = [
          "index"
          "pager"
        ];
      }
    ];
    macros = [
      {
        action = "<enter-command>set my_pipe_decode=\$pipe_decode pipe_decode<return><pipe-message>abook --add-email<return><enter-command>set pipe_decode=\$my_pipe_decode; unset my_pipe_decode<return>";
        key = "a";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "<tag-pattern>~N<enter><tag-prefix><clear-flag>N<untag-pattern>.<enter>";
        key = "A";
        map = [ "index" ];
      }
    ];
    extraConfig = ''
      # Noms des dossiers
      named-mailboxes "Boite de réception" +Inbox
      named-mailboxes "Messages envoyés" "+[Gmail]/Messages envoy&AOk-s"
      named-mailboxes "Pourriel" "+[Gmail]/Spam"
      named-mailboxes "Brouillons" "+[Gmail]/Brouillons"
      named-mailboxes "Corbeille" "+[Gmail]/Corbeille"

      # Default index colors:
      color index yellow default '.*'
      color index_author red default '.*'
      color index_number blue default
      color index_subject cyan default '.*'

      # New mail is boldened:
      color index brightyellow black "~N"
      color index_author brightred black "~N"
      color index_subject brightcyan black "~N"

      # Tagged mail is highlighted:
      color index brightyellow blue "~T"
      color index_author brightred blue "~T"
      color index_subject brightcyan blue "~T"

      # Other colors and aesthetic settings:
      mono bold bold
      mono underline underline
      mono indicator reverse
      mono error bold
      color normal default default
      color indicator brightblack white
      color sidebar_highlight red default
      color sidebar_divider brightblack black
      color sidebar_flagged red black
      color sidebar_new green black
      color normal brightyellow default
      color error red default
      color tilde black default
      color message cyan default
      color markers red white
      color attachment white default
      color search brightmagenta default
      color status brightyellow black
      color hdrdefault brightgreen default
      color quoted green default
      color quoted1 blue default
      color quoted2 cyan default
      color quoted3 yellow default
      color quoted4 red default
      color quoted5 brightred default
      color signature brightgreen default
      color bold black default
      color underline black default
      color normal default default

      # Regex highlighting:
      color header brightmagenta default "^From"
      color header brightcyan default "^Subject"
      color header brightwhite default "^(CC|BCC)"
      color header blue default ".*"
      color body brightred default "[\-\.+_a-zA-Z0-9]+@[\-\.a-zA-Z0-9]+" # Email addresses
      color body brightblue default "(https?|ftp)://[\-\.,/%~_:?&=\#a-zA-Z0-9]+" # URL
      color body green default "\`[^\`]*\`" # Green text between ` and `
      color body brightblue default "^# \.*" # Headings as bold blue
      color body brightcyan default "^## \.*" # Subheadings as bold cyan
      color body brightgreen default "^### \.*" # Subsubheadings as bold green
      color body yellow default "^(\t| )*(-|\\*) \.*" # List items as yellow
      color body brightcyan default "[;:][-o][)/(|]" # emoticons
      color body brightcyan default "[;:][)(|]" # emoticons
      color body brightcyan default "[ ][*][^*]*[*][ ]?" # more emoticon?
      color body brightcyan default "[ ]?[*][^*]*[*][ ]" # more emoticon?
      color body red default "(BAD signature)"
      color body cyan default "(Good signature)"
      color body brightblack default "^gpg: Good signature .*"
      color body brightyellow default "^gpg: "
      color body brightyellow red "^gpg: BAD signature from.*"
      mono body bold "^gpg: Good signature"
      mono body bold "^gpg: BAD signature from.*"
      color body red default "([a-z][a-z0-9+-]*://(((([a-z0-9_.!~*'();:&=+$,-]|%[0-9a-f][0-9a-f])*@)?((([a-z0-9]([a-z0-9-]*[a-z0-9])?)\\.)*([a-z]([a-z0-9-]*[a-z0-9])?)\\.?|[0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+)(:[0-9]+)?)|([a-z0-9_.!~*'()$,;:@&=+-]|%[0-9a-f][0-9a-f])+)(/([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*(;([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*)*(/([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*(;([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*)*)*)?(\\?([a-z0-9_.!~*'();/?:@&=+$,-]|%[0-9a-f][0-9a-f])*)?(#([a-z0-9_.!~*'();/?:@&=+$,-]|%[0-9a-f][0-9a-f])*)?|(www|ftp)\\.(([a-z0-9]([a-z0-9-]*[a-z0-9])?)\\.)*([a-z]([a-z0-9-]*[a-z0-9])?)\\.?(:[0-9]+)?(/([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*(;([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*)*(/([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*(;([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*)*)*)?(\\?([-a-z0-9_.!~*'();/?:@&=+$,]|%[0-9a-f][0-9a-f])*)?(#([-a-z0-9_.!~*'();/?:@&=+$,]|%[0-9a-f][0-9a-f])*)?)[^].,:;!)? \t\r\n<>\"]"
    '';
  };
}
