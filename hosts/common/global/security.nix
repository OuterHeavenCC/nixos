{ pkgs, ... }:

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

  # Rentrer le mot de passe automatiquement à la connexion
  security.pam.services.corentin.gnupg.enable = true;

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
