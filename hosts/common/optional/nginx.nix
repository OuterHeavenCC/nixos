{
  services.nginx.enable = true;
  services.nginx.virtualHosts."46.226.104.146" = {
      addSSL = true;
      enableACME = true;
      root = "/var/www/chaminand.com";
  };

  security.acme = {
    acceptTerms = true;
    email = "corent.cham@gmail.com";
  };
}
