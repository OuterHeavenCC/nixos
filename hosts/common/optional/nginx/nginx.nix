{

  networking.firewall = {
    allowedTCPPortRanges = [
      { from = 80; to = 80; }
    ];
  };

  services.nginx = {
    enable = true;
    virtualHosts."46.226.104.146" = {
      root = "/var/www/chaminand.com";
    };
  };
  # Optional: You can configure the email address used with Let's Encrypt.
  # This way you get renewal reminders (automated by NixOS) as well as expiration emails.
}
