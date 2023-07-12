{ pkgs, ... }:

{
  imports = [
    ./dunst.nix
    ./foot.nix
    ./rofi
    ./swayidle.nix
    ./swaylock.nix
    ./waybar.nix
  ];

    home.packages = with pkgs; [
      grim                        # Grab images from a Wayland compositor
      hyprpicker                  # Color picking tool for wlroots
      rofi-wayland                # Rofi Wayland fork
      slurp                       # Select a region in a Wayland compositor
      swww                        # Wallpaper manager
      wev                         # Show Wayland events
      wl-clipboard                # Clipboard manager for wlroots
      ydotool                     # Command line automation tool for Wayland
    ];

    home.sessionVariables = {
      LIBSEAT_BACKEND = "logind";
    };

}
