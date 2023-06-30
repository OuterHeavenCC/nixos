# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ config, inputs, outputs, ... }: {
  # You can import other home-manager modules here
  imports = [

    ./global
    ./features/desktop/hyprland
    ./features/cli/zsh.nix
    ./features/desktop/common/wayland-wm/foot.nix
    ./features/desktop/common/wayland-wm/waybar.nix
    ../../modules/home-manager/monitors.nix

    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      heigth = 1080;
      workspace = "1";
      x = 0;
    }
  ];

}
