# Shell for bootstrapping flake-enabled nix and home-manager
# You can enter it through 'nix develop' or (legacy) 'nix-shell'

{
  pkgs ? (import ./nixpkgs.nix) { },
}:
{
  default = pkgs.mkShell {
    # Enable experimental features without having to specify the argument
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [
      nix
      home-manager
      git
    ];

    shellHook = with pkgs; ''
      LD_LIBRARY_PATH=${stdenv.cc.cc.lib}/lib/:/run/opengl-driver/lib/:/run/opengl-driver-32/lib/
      QT_PLUGIN_PATH=${qt5.qtbase}/${qt5.qtbase.qtPluginPrefix}
      echo "Welcome"
    '';
  };
}
