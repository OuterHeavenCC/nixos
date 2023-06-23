{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "fr";
    displayManager.lightdm.enable = false;
  };
  hardware = {
    opengl.enable = true;
  };
}
