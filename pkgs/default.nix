# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{
  pkgs ? (import ../nixpkgs.nix) { },
}:
{
  # example = pkgs.callPackage ./example { };
  powermenu = pkgs.callPackage ./powermenu { };
  bmks = pkgs.callPackage ./bmks { };
  killmenu = pkgs.callPackage ./killmenu { };
  transadd = pkgs.callPackage ./transadd { };
  lunarvim = pkgs.callPackage ./lunarvim { }; # TODO Enlever le temps que Lunarvim soit fixé pour la version 0.10
}
