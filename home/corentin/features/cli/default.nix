{ pkgs, ... }:

{
  imports = [
    ./abook.nix
    ./bat.nix
    ./bottom.nix
    ./btop.nix
    ./calcurse.nix
    ./direnv.nix
    ./git.nix
    ./gpg.nix
    ./ledger.nix
    ./lf.nix
    ./lvim.nix
    ./ncmpcpp.nix
    ./newsboat.nix
    ./nvim.nix
    ./zsh.nix
  ];

}
