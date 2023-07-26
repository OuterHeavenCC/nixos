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

    upstreams."libreosteo.chaminand.com".servers = {
      "127.0.0.1:8000" = {};
    };

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
    };
  # Optional: You can configure the email address used with Let's Encrypt.
  # This way you get renewal reminders (automated by NixOS) as well as expiration emails.
  };

  security.acme.acceptTerms = true;
  security.acme.certs = {
    "chaminand.com" = {
      email = "corent.cham@gmail.com";
    };
  };
}
