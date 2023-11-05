{ pkgs, ... }:
  
{
  home.packages = with pkgs; [
    simple-mtpfs
  ];
}
