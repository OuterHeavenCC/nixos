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

  # Rentrer le mot de passe automatiquement gpg à la connexion
  security.pam.services.login.gnupg = {
    enable = true;
    storeOnly = true;
  };

  # TODO Tentative de fix swaylock ? Peut être rajouter pam_gnupg pour qu'il se relance ?
  security.pam.services.swaylock = {
    text = ''
      # Account management.
    account required pam_unix.so

    # Authentication management.
    auth sufficient pam_unix.so   likeauth try_first_pass
    auth required pam_deny.so
    auth optional ${pkgs.pam_gnupg}/lib/security/pam_gnupg.so

    # Password management.
    password sufficient pam_unix.so nullok sha512

    # Session management.
    session required pam_env.so conffile=/etc/pam/environment readenv=0
    session required pam_unix.so
    '';
  };
}
