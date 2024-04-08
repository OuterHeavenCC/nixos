{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          keyutils
          libkrb5
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
        ];
    };
    gamescopeSession = {
      enable = true;
      args = [
        "--output-width 1920"
        "--output-height 1080"
        "--framerate-limit 240"
        "--prefer-output DP-1"
        "--expose-wayland"
        "--hdr-enabled"
        "--fullscreen"
        "--adaptive-sync"
      ];
      env = {
        XKB_DEFAULT_LAYOUT = "fr";
        XKB_DEFAULT_VARIANT = "azerty";
      };
    };
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

}
