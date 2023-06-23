{ config, pkgs, ... }:

{
  services.transmission = {
    enable = false;
    settings = {
      download-dir = "/mnt/Storage/Downloads";
      incomplete-dir = "/mnt/Storage/Downloads";
      download-queue-enabled = true;
      download-queue-size = 5;
    };
  };
}
