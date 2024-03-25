{ pkgs, ... }:

{

  imports = [
    ./mangohud.nix
  ];

  home.packages = with pkgs; [
    protontricks
    samrewritten
    steam-run
    steam
    steamtinkerlaunch
    xorg.xwininfo
    xdotool
    protontricks
    gamescope
  ];
}
