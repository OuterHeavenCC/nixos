{
  networking.firewall = {
    allowedTCPPortRanges = [
      { from = 80; to = 80; }
      { from = 10800; to = 10800; }
      { from = 8000; to = 8000; }
      { from = 8080; to = 8080; }
    ];
  };

  services.nginx = {
    enable = true;
    virtualHosts."chaminand.com" = {
      enableACME = true;
      forceSSL = true;
      root = "/var/www/chaminand.com";
    };
  };
  # Optional: You can configure the email address used with Let's Encrypt.
  # This way you get renewal reminders (automated by NixOS) as well as expiration emails.
  security.acme.acceptTerms = true;
  security.acme.certs = {
  "chaminand.com".email = "corent.cham@gmail.com";
  };
}
