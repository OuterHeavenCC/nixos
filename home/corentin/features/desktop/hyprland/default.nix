{ inputs, lib, config, pkgs, ... }:

{

  imports = [
    ../common
    ../common/wayland-wm
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig =
      (import ./monitors.nix {
        inherit lib;
        inherit (config) monitors;
      }) +
      (import ./config.nix {
        inherit (config) home colorscheme;
      });
  };
}
