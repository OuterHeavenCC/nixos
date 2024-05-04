{ pkgs, ... }:

{
  imports = [
    ./ags
    ./foot.nix
    ./fuzzel.nix
    ./gammastep.nix
    ./rofi
    ./swayidle.nix
    ./swaylock.nix
    # ./waybar-m4xshen
  ];

    home.packages = with pkgs; [
      gamescope
      grim                        # Grab images from a Wayland compositor
      hyprpicker                  # Color picking tool for wlroots
      rofi-wayland                # Rofi Wayland fork
      slurp                       # Select a region in a Wayland compositor
      wbg                         # Wallpaper manager
      wev                         # Show Wayland events
      wl-clipboard                # Clipboard manager for wlroots
      grimblast
    ];

    home.sessionVariables = {
      LIBSEAT_BACKEND = "logind";
    };

}
