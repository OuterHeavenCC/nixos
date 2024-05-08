{ pkgs, ... }:
{
  home.packages = with pkgs; [ gcr ];

  xdg.configFile."pam-gnupg".text = "88921B907B0F39E17E3F734BF2D57789304EBD10";

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 86400;
    maxCacheTtl = 86400;
    extraConfig = ''
      allow-preset-passphrase
    '';
  };

  services.gpg-agent.pinentryPackage = pkgs.pinentry-gnome3;

  programs =
    let
      fixGpg = ''
        gpgconf --launch gpg-agent
      '';
    in
    {
      zsh.loginExtra = fixGpg;
      gpg = {
        enable = true;
        settings = {
          trust-model = "tofu+pgp";
        };
      };
    };
}
