{ pkgs, ... }:

{
  imports = [
    ./ags
    ./foot.nix
    ./fuzzel.nix
    ./gammastep.nix
    ./hypridle.nix
    ./hyprlock.nix
    # ./hyprpaper.nix # No longer needed with ags
  ];

  home.packages = with pkgs; [
    gamescope
    grim # Grab images from a Wayland compositor
    hyprpicker # Color picking tool for wlroots
    slurp # Select a region in a Wayland compositor
    wev # Show Wayland events
    wl-clipboard # Clipboard manager for wlroots
    grimblast
  ];

  home.sessionVariables = {
    LIBSEAT_BACKEND = "logind";
  };
}
