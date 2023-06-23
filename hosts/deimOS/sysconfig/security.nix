{ config, pkgs, ... }:

let 
  user = "corentin";
in
{

  # Opendoas
  security.sudo.enable = false;
  security.doas.enable = true;
  # Configuration Doas
  security.doas.extraRules = [{ users = [ "${user}" ];
      noPass = true;
      keepEnv = true;
  }];

  # Polkit
  security.polkit.enable = true;
  systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
   extraConfig = ''
     DefaultTimeoutStopSec=10s
   '';
  }; 

  # Fix swaylock
  security.pam.services.swaylock = {
    text = ''
      # Account management.
    account required pam_unix.so

    # Authentication management.
    auth sufficient pam_unix.so   likeauth try_first_pass
    auth required pam_deny.so

    # Password management.
    password sufficient pam_unix.so nullok sha512

    # Session management.
    session required pam_env.so conffile=/etc/pam/environment readenv=0
    session required pam_unix.so
    '';
  };
}
