{
  networking.firewall = {
    allowedTCPPortRanges = [
      { from = 80; to = 80; }
      { from = 443; to = 443; }
      { from = 10800; to = 10800; }
      { from = 8000; to = 8000; }
      { from = 8080; to = 8080; }
    ];
  };

  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;

    virtualHosts = {
      "chaminand.com" = {
        forceSSL = true;
        enableACME = true;
        locations = {
          "/" = {
            root = "/var/www/chaminand.com";
          };
        };
      };
      "www.chaminand.com" = {
        forceSSL = true;
        globalRedirect = "chaminand.com";
      };
    };
  # Optional: You can configure the email address used with Let's Encrypt.
  # This way you get renewal reminders (automated by NixOS) as well as expiration emails.
  };

  security.acme.acceptTerms = true;
  security.acme.certs = {
    "chaminand.com" = {
      email = "corent.cham@gmail.com";
      extraDomainNames = [ "www.chaminand.com" ];
    };
  };
}
