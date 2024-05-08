{
  config,
  lib,
  pkgs,
  ...
}:
{
  networking.firewall = {
    allowedTCPPortRanges = [
      {
        from = 80;
        to = 80;
      }
      {
        from = 443;
        to = 443;
      }
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
    };
  };

  security.acme.acceptTerms = true;
  security.acme.certs = {
    "chaminand.com" = {
      email = "corent.cham@gmail.com";
    };
  };
}
