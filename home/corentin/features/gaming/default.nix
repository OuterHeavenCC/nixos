{ pkgs, lib, config, ... }:

let 
  steam-with-pkgs = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils
      ];
    };
in
{

  imports = [
    ./mangohud.nix
  ];

  home.packages = with pkgs; [
    protontricks
    samrewritten
    steam-run
    steam-with-pkgs
    steamtinkerlaunch
    xorg.xwininfo
    xdotool
    gamescope
  ];
}
