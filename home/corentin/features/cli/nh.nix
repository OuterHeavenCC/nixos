{ pkgs, ... }:

{
  home.sessionVariables = {
    FLAKE = "/home/corentin/Documents/git/nixos/";
  };

  home.packages = with pkgs; [
    nh
    nix-output-monitor
    nvd
  ];
}
