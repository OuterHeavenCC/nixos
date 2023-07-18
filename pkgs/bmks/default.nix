{ lib
, pkgs
, stdenv
, rofi
, gnused
, coreutils
, gawk
, findutils
}:

with lib;

stdenv.mkDerivation {

  name = "bmks";
  version = "1.0";
  src = ./bmks;

  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    install -Dm 0755 $src $out/bin/bmks
    wrapProgram $out/bin/bmks --set PATH \
      "${
        makeBinPath [
          rofi
          gnused
          coreutils
          gawk
          findutils
        ]
      }"
  '';

  meta = {
    description = "Browser independent bookmark manager for linux";
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
