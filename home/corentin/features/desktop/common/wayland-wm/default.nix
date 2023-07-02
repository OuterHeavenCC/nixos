{ pkgs, ... }:

{
  imports = [
    ./dunst.nix
    ./foot.nix
    ./rofi
    ./swayidle.nix
    ./waybar.nix
  ];

    home.packages = with pkgs; [
      grim                        # Grab images from a Wayland compositor
      hyprpicker                  # Color picking tool for wlroots
      pass-wayland                # Mandatory ? I don't know
      rofi-wayland                # Rofi Wayland fork
      slurp                       # Select a region in a Wayland compositor
      swww                        # Wallpaper manager
      wev                         # Show Wayland events
      wl-clipboard                # Clipboard manager for wlroots
      ydotool                     # Command line automation tool for Wayland
      swaylock                    # Wayland lock screen
      swayidle                    # Wayland idle management
    ];

}
