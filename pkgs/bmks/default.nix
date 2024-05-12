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
  firefox,
}:

with lib;

stdenv.mkDerivation {
  name = "bmks";
  version = "1.1";
  src = ./src;

  nativeBuildInputs = [ makeWrapper ];

  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    install -Dm 0755 $src/bmks.sh $out/bin/bmks
    wrapProgram $out/bin/bmks --set PATH \
      "${
        makeBinPath [
          findutils
          coreutils
          rofi-wayland
          fuzzel
          fzf
          gawk
          gnused
          dmenu
          firefox
        ]
      }"
  '';

  meta = {
    description = "Browser independent bookmark manager for linux ";
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
