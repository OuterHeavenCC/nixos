{ pkgs, ... }:

{
  # TODO Simplfier tout ce merdier
  home.packages = with pkgs; [
    powermenu
    bmks
    killmenu
    transadd # Mimeapp script for adding torrents to transmission
    fuzzelunicode
  ];
  home.file = {
    ".local/bin/passfuzzel" = {
      enable = true;
      source = ./bin/passfuzzel;
      executable = true;
    };
  };
}
