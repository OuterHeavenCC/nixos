{ pkgs, ... }:

{
  home.packages = with pkgs; [ signpdf ];

  imports = [
    ./mail.nix
    ./neomutt.nix
    ./groff.nix
    ./texlive.nix
  ];
}
