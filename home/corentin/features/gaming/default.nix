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
      gamescope
      mangohud
  ];
};
  monitor = lib.head (lib.filter (m: m.primary) config.monitors);

  steam-session = pkgs.makeDesktopItem {
    name = "Steam Session";
    desktopName = "Steam Session";
    exec = "${pkgs.gamescope}/bin/gamescope -W ${toString monitor.width} -H ${toString monitor.height} -O ${monitor.name} -e -- steam -gamepadui";
    type = "Application";
  };

in
{
  home.packages = with pkgs; [
    steam-with-pkgs
    steam-session
    gamescope
    protontricks
    samrewritten
    steam-run
  ];
}
