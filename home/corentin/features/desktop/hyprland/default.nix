{ inputs, lib, config, pkgs, ... }:


{

  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig =
      (import ./monitors.nix {
        inherit lib;
        inherit (config) monitors;
      }) +
      (import ./config.nix {
        inherit (config) home;
      });
  };
}
