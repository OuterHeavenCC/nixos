{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 48.00;
    longitude = -4.00;
    temperature = {
      day = 6000;
      night = 2000;
    };

    settings = {
      general.adjustment-method = "wayland";
    };
  };
}
