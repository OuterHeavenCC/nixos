{ config, pkgs, ... }:

{
  # TODO Faire en sorte que ça fonctionne même sans carte graphique Nvidia
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
