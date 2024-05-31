{ pkgs, config, ... }:

{
  programs.password-store = {
    enable = true;
    settings = {
      PASSWORD_STORE_DIR = "${config.home.homeDirectory}/.password-store";
    };
    package = pkgs.pass.withExtensions (p: [ p.pass-otp ]);
  };
  home.packages = with pkgs; [ dmenu-wayland ];
}
