{ pkgs, ... }:

{
  # TODO Simplfier tout ce merdier
  home.packages = with pkgs; [
      powermenu
      bmks
      killmenu
    ];
  home.file = {
    ".local/bin/passfuzzel" = {
      enable = true;
      source = ./bin/passfuzzel;
      executable = true;
    };
    ".local/bin/transadd" = {
      enable = true;
      source = ./bin/transadd;
      executable = true;
    };
  };
}
