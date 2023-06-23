{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
  };
}
