{ pkgs, config, ... }:

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
    maildirBasePath = "${config.home.homeDirectory}/.local/share/mail";
      accounts = {
        gmail = rec {
          primary = true;
          address = "corent.cham@gmail.com";
          passwordCommand = "${pass} Email/${address}";

          imap.host = "imap.gmail.com";
          mbsync = {
            enable = true;
            create = "maildir";
            expunge = "both";
          };
          folders = {
            inbox = "Inbox";
            sent = "[Gmail]/Messages envoy&AOk-s";
            trash = "[Gmail]/Corbeille";
          };
          neomutt = {
            enable = true;
            extraMailboxes = [ "[Gmail]/Messages envoy&AOk-s" "[Gmail]/Brouillons" "[Gmail]/Spam" "[Gmail]/Corbeille" ];
          };

          msmtp.enable = true;
          smtp.host = "smtp.gmail.com";
          userName = address;
        } // common;
    };
  };

  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
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
