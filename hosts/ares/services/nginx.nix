{ config, lib, pkgs, ... }:
{
  networking.firewall = {
    allowedTCPPortRanges = [
      { from = 80; to = 80; }
      { from = 443; to = 443; }
      { from = 10800; to = 10800; }
      { from = 8000; to = 8000; }
      { from = 8080; to = 8080; }
      { from = 8888; to = 8888; }
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
      "search.chaminand.com" = let inherit (config.services.searx) settings; in {
        enableACME = true;
        forceSSL = true;
        locations."/".extraConfig = ''
          uwsgi_pass "${lib.quoteListenAddr settings.server.bind_address}:${toString settings.server.port}";
          include ${config.services.nginx.package}/conf/uwsgi_params;
        '';
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
