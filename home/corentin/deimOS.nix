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
    ./features/scripts
    ./features/productivity
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
      name = "eDP-1";
      width = 1920;
      height = 1080;
      x = 0;
      workspace = "1";
    }
  ];

    programs.foot.settings.main.font = "Iosevka Nerd Font:size=12";
}
