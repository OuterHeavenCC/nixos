{ pkgs, lib, config, ... }:

let
  mbsync = "${config.programs.mbsync.package}/bin/mbsync";
  pass = "${config.programs.password-store.package}/bin/pass";

  common = rec {
    realName = "Corentin CHAMINAND";
    gpg = {
      key = "7CBB 4CFF 944E EBD6 65C2 4E2D A6E2 7C98 2607 CB1A";
      signByDefault = false;
    };
    signature = {
      showSignature = "append";
      text = ''
        ${realName}
        PGP: ${gpg.key}
      '';
    };
  };
in
{
  accounts.email = {
    maildirBasePath = "${config.home.homeDirectory}/.local/share/Mail";
      accounts = {
        personal = rec {
          primary = true;
          address = "corentin@chaminand.fr";
          passwordCommand = "${pass} ${address}";

          imap.host = "mail.gandi.net";
          mbsync = {
            enable = true;
            create = "maildir";
            expunge = "both";
          };
          folders = {
            inbox = "Boîte de réception";
            sent = "Envoyés";
            drafts = "Brouillons";
            trash = "Corbeille";
          };
          neomutt = {
            enable = true;
            extraMailboxes = [ "Envoyés" "Brouillons" "Pourriels" "Corbeille" ];
          };

          msmtp.enable = true;
          smtp.host = "mail.gandi.net";
          userName = address;
        } // common;

      # gmail = rec {
      #   primary = true;
      #   address = "corent.cham@gmail.com";
      #   passwordCommand = "${pass} ${address}";

      #   imap.host = "imap.gmail.com";
      #   mbsync = {
      #     enable = true;
      #     create = "maildir";
      #     expunge = "both";
      #   };
      #   folders = {
      #     inbox = "Inbox";
      #     sent = "Sent";
      #     trash = "[Gmail]/Corbeille";
      #   };
      #   neomutt = {
      #     enable = true;
      #     extraMailboxes = [ "Sent" "[Gmail]/Spam" "[Gmail]/Corbeille" ];
      #   };

      #   msmtp.enable = true;
      #   smtp.host = "smtp.gmail.com";
      #   userName = address;
      # } // common;

      # yahoo = rec {
      #   address = "corent.cham@yahoo.fr";
      #   passwordCommand = "${pass} ${address}";

      #   imap.host = "imap.mail.yahoo.com";
      #   mbsync = {
      #     enable = true;
      #     create = "maildir";
      #     expunge = "both";
      #   };
      #   folders = {
      #     inbox = "Inbox";
      #     drafts = "Drafts";
      #     sent = "Sent";
      #     trash = "Trash";
      #   };
      #   neomutt = {
      #     enable = true;
      #     extraMailboxes = [ "Archive" "Drafts" "Junk" "Sent" "Trash" ];
      #   };

      #   msmtp.enable = true;
      #   smtp.host = "smtp.mail.yahoo.com";
      #   userName = address;
      # } // common;

      # hotmail = rec {
      #   address = "corent.cham@hotmail.fr";
      #   passwordCommand = "${pass} ${address}";

      #   imap.host = "outlook.office365.com";
      #   mbsync = {
      #     enable = true;
      #     create = "maildir";
      #     expunge = "both";
      #   };
      #   folders = {
      #     inbox = "Inbox";
      #     drafts = "Drafts";
      #     sent = "Sent";
      #     trash = "Trash";
      #   };
      #   neomutt = {
      #     enable = true;
      #     extraMailboxes = [ "Sent" "Junk" "Deleted" ];
      #   };

      #   msmtp.enable = true;
      #   smtp.host = "smtp-mail.outlook.com";
      #   userName = address;
      # } // common;

    };
  };

  programs.mbsync.enable = true; # TODO Temporaire
  programs.msmtp.enable = true; # TODO Temporaire
  # programs.notmuch = {
  #   enable = true;
  #   hooks = { preNew = "mbsync --all"; };
  # };

  systemd.user.services.mbsync = {
    Unit = { Description = "mbsync synchronization"; };
    Service =
      let gpgCmds = import ../cli/gpg-commands.nix { inherit pkgs; };
      in
      {
        Type = "oneshot";
        ExecCondition = ''
          /bin/sh -c "${gpgCmds.isUnlocked}"
        '';
        ExecStart = "${mbsync} -a";
      };
  };
  systemd.user.timers.mbsync = {
    Unit = { Description = "Automatic mbsync synchronization"; };
    Timer = {
      OnBootSec = "30";
      OnUnitActiveSec = "5m";
    };
    Install = { WantedBy = [ "timers.target" ]; };
  };
}
