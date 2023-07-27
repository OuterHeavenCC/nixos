{ lib
, pkgs
, stdenv
, fetchFromGitHub
, makeWrapper
, rofi-wayland
, findutils
, coreutils
, swaylock
, gnugrep
, systemd
}:

with lib;

stdenv.mkDerivation {
  name = "rofi-powermenu";
  version = "1.0";
  src = ./rofi-powermenu;

  nativeBuildInputs = [ makeWrapper ];

  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    install -Dm 0755 $src $out/bin/rofi-powermenu
    wrapProgram $out/bin/rofi-powermenu --set PATH \
      "${
        makeBinPath [
          findutils
          coreutils
          swaylock
          gnugrep
          rofi-wayland
          systemd
        ]
      }"
  '';

  meta = {
    description = "A rofi script for power menu";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
