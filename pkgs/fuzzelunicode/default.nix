{
  lib,
  stdenv,
  makeWrapper,
  libnotify,
  findutils,
  gnused,
  coreutils,
  fuzzel,
  wl-clipboard,
  wtype,
}:

with lib;

stdenv.mkDerivation {
  name = "fuzzelunicode";
  version = "1.0";
  src = ./src;

  nativeBuildInputs = [ makeWrapper ];

  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
  mkdir -p $out/share/
  cp $src/emoji_list.txt $out/share
  install -Dm 0755 $src/fuzzelunicode.sh $out/bin/fuzzelunicode
  wrapProgram $out/bin/fuzzelunicode --set FUZZEL_EMOJI_FILE "$out/share/emoji_list.txt" --prefix PATH ':' \
      "${
        makeBinPath [
          fuzzel
          libnotify
          wl-clipboard
          findutils
          gnused
          coreutils
          wtype
          wl-clipboard
        ]
      }"
  '';

  meta = {
    description = "A fuzzel menu for choosing emoji";
    license = licenses.mit;
    platforms = platforms.all;
    mainProgram = "fuzzelunicode";
    extraEnv = {
      FUZZEL_EMOJI_FILE = "${out}/share/emoji_list.txt";
    };
  };
}
