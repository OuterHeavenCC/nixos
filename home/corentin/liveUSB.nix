{ config, ... }:

# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{
  # You can import other home-manager modules here
  imports = [

    ./features/cli
    ./features/desktop/common
    ./features/desktop/common/wayland-wm
    ./features/desktop/common/wayland-wm
    ./features/desktop/hyprland
    ./features/editor/nixvim
    ./features/pass
    ./features/scripts
    ./global

    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  monitors = [
    {
      name = "DP-1";
      width = 1920;
      height = 1080;
      x = 0;
      primary = true;
      vrr = 0;
    }
  ];

  programs.foot.settings.main.font = "${config.fontProfiles.monospace.family}:size=12";
}

