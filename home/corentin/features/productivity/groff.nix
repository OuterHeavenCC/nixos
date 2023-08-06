{ pkgs, ... }:

{
  home.packages = with pkgs; [ groff ];
}
