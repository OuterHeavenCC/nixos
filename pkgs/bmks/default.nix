{
  lib,
  stdenv,
  makeWrapper,
  rofi-wayland,
  fuzzel,
  findutils,
  coreutils,
  fzf,
  gawk,
  gnused,
  dmenu,
  xdg-utils,
}:

with lib;

stdenv.mkDerivation {
  name = "bmks";
  version = "1.1";
  src = ./src/bmks.sh;

  nativeBuildInputs = [ makeWrapper ];

  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    install -Dm 0755 $src $out/bin/bmks
    wrapProgram $out/bin/bmks --prefix PATH ':' \
    "${
      makeBinPath [
        findutils
        coreutils
        rofi-wayland
        fuzzel
        fzf
        gawk
        xdg-utils
        gnused
        dmenu
      ]
    }"
  '';

  meta = {
    description = "Browser independent bookmark manager for linux ";
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
