{
  programs.gpg.enable = true;

  home.file.".pam-gnupg".text = "88921B907B0F39E17E3F734BF2D57789304EBD10";

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 86400;
    maxCacheTtl = 86400;
    pinentryFlavor = "gnome3";
    extraConfig = ''
allow-preset-passphrase
  '';
  };
}
