{ pkgs, ... }:

{
  home.packages = with pkgs; [
    yuzu-early-access
  ];
}
