{ lib
, stdenv
, makeWrapper
, fuzzel
, findutils
, coreutils
, swaylock
, gnugrep
, systemd
}:

with lib;

stdenv.mkDerivation {
  name = "powermenu";
  version = "1.1";
  src = ./powermenu;

  nativeBuildInputs = [ makeWrapper ];

  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    install -Dm 0755 $src $out/bin/powermenu
    wrapProgram $out/bin/powermenu --set PATH \
      "${
        makeBinPath [
          findutils
          coreutils
          swaylock
          gnugrep
          fuzzel
          systemd
        ]
      }"
  '';

  meta = {
    description = "A script for power menu";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
