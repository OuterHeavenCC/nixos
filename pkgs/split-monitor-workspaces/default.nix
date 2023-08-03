{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "split-monitor-workspaces";
  version = "0.2";

  src = pkgs.fetchFromGitHub {
    owner = "Duckonaut";
    repo = "split-monitor-workspaces";
    rev = "44785ce";
    sha256 = "XxcUPMqytWItOmre7MV1XAhx/i2uyBbjHMKr5+B0IPE=";
  };
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.hyprland ] ++ pkgs.hyprland.buildInputs;

  buildPhase = ''
    export HYPRLAND_HEADERS=${pkgs.hyprland.src}
    make all
  '';

  installPhase = ''
    mkdir -p $out/lib
    cp split-monitor-workspaces.so $out/lib/libsplit-monitor-workspaces.so
  '';
}
