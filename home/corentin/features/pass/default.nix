{ pkgs, config, ... }:

{
  programs.password-store = {
    enable = true;
    settings = { PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store"; };
    package = pkgs.pass.withExtensions (p: [ p.pass-otp ]);
  };
}
