{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "fr";
    videoDrivers = ["nvidia"];
    displayManager.lightdm.enable = false;
  };
  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };
}
