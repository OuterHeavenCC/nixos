# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  bmks = pkgs.callPackage ./bmks { };
  # example = pkgs.callPackage ./example { };
}
