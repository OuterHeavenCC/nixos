{ lib
, stdenv
, makeWrapper
, fuzzel
, coreutils
, procps
, gawk
}:

with lib;

stdenv.mkDerivation {
  name = "killmenu";
  version = "1.0";
  src = ./killmenu;

  nativeBuildInputs = [ makeWrapper ];

  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    install -Dm 0755 $src $out/bin/killmenu
    wrapProgram $out/bin/killmenu --set PATH \
      "${
        makeBinPath [
          coreutils
          fuzzel
          procps
          gawk
        ]
      }"
  '';

  meta = {
    description = "A script for killing processes";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
