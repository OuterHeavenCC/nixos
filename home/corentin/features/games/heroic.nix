{ pkgs, ... }:

{
  home.package = with pkgs; [
    heroic
  ];
}
