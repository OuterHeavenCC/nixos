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
  fuzzelunicode = pkgs.callPackage ./fuzzelunicode { };
}
