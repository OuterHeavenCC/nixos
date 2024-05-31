{ pkgs, ... }:

{
  # TODO Simplfier tout ce merdier
  home.packages = with pkgs; [
    powermenu
    bmks
    fuzzelunicode
    transadd # Mimeapp script for adding torrents to transmission
  ];
}
