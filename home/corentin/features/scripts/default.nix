{ pkgs, ... }:

{
  # TODO Simplfier tout ce merdier
  home.packages = with pkgs; [
    powermenu
    bmks
    transadd # Mimeapp script for adding torrents to transmission
  ];
}
