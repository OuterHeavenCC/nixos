let
  user = "corentin";
in
{

  # Opendoas
  security.sudo.enable = false;
  security.doas.enable = true;
  # Configuration Doas
  security.doas.extraRules = [
    {
      users = [ "${user}" ];
      noPass = true;
      keepEnv = true;
    }
  ];

  # Rentrer le mot de passe automatiquement gpg à la connexion
  security.pam.services.login.gnupg = {
    enable = true;
    storeOnly = true;
  };



  # Fix Hyprlock
  security.pam.services.hyprlock = {};
}
