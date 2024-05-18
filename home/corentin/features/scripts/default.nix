{ pkgs, ... }:

{
  # TODO Simplfier tout ce merdier
  home.packages = with pkgs; [
    powermenu
    bmks
    killmenu
    transadd # Mimeapp script for adding torrents to transmission
  ];
  home.file = {
    ".local/bin/anyrun-pass" = {
      enable = true;
      source = ./bin/anyrun-pass;
      executable = true;
    };
  };
}
