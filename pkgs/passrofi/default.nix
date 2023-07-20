{ lib
, pkgs
, stdenv
, rofi-wayland
, dmenu
, xdotool
, coreutils
, pass
}:

with lib;

stdenv.mkDerivation {

  name = "passrofi";
  version = "1.0";
  src = ./passrofi;

  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    install -Dm 0755 $src $out/bin/passrofi
    wrapProgram $out/bin/passrofi --set PATH \
      "${
        makeBinPath [
          rofi-wayland
          dmenu
          xdotool
          coreutils
          pass
        ]
      }"
  '';

  meta = {
    description = "Rofi menu for the standard unix password manager, pass";
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
