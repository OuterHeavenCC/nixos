# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, ... }: {
  # You can import other home-manager modules here
  imports = [

    ./features/cli
    ./features/desktop/common
    ./features/desktop/common/wayland-wm
    ./features/desktop/common/wayland-wm
    ./features/desktop/hyprland
    ./features/nvidia
    ./features/scripts
    ./features/productivity
    ./global


    # outputs.homeManagerModules.monitors
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  monitors = [
    {
      name = "DP-3";
      width = 3840;
      height = 2160;
      workspace = "1";
      x = 0;
    }
    {
      name = "DP-1";
      width = 1920;
      height = 1080;
      refreshRate = 240;
      x = 3840;
      workspace = "2";
    }
    {
      name = "DP-2";
      width = 3840;
      height = 2160;
      x = 5760;
      workspace = "3";
    }
  ];

      programs.foot.settings.main.font = "Iosevka Nerd Font:size=16";
}
