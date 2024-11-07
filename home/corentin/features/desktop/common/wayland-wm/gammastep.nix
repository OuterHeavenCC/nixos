{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 48.0;
    longitude = -4.0;
    temperature = {
      day = 6000;
      night = 2700;
    };

    settings = {
      general.adjustment-method = "wayland";
    };
  };
}
