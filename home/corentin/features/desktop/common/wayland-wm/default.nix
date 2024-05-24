{ pkgs, ... }:

{
  imports = [
    ./ags
    ./anyrun
    ./foot.nix
    ./fuzzel.nix
    ./gammastep.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];

  home.packages = with pkgs; [
    gamescope
    grim # Grab images from a Wayland compositor
    hyprpicker # Color picking tool for wlroots
    slurp # Select a region in a Wayland compositor
    wbg # Wallpaper manager
    wev # Show Wayland events
    wl-clipboard # Clipboard manager for wlroots
    grimblast
  ];

  # home.sessionVariables = {
  #   LIBSEAT_BACKEND = "logind";
  # };
}
