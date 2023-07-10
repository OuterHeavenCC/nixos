{ pkgs, config, ... }: {
  programs.password-store = {
    enable = true;
    settings = { PASSWORD_STORE_DIR = "$HOME/.password-store"; };
    package = pkgs.pass.withExtensions (p: [ p.pass-otp ]);
  };

  services.pass-secret-service = {
    enable = true;
  };

  services.password-store-sync = {
    enable = true;
    frequency = "*:0/5";
  };
}
