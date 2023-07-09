{ pkgs, config, ... }: {
  programs.password-store = {
    enable = true;
    settings = { PASSWORD_STORE_DIR = "$HOME/.local/share/password-store"; };
    package = pkgs.pass.withExtensions (p: [ p.pass-otp ]);
  };

  services.pass-secret-service = {
    enable = true;
    storePath = "${config.home.homeDirectory}/.local/share/password-store";
  };
}
