{ pkgs, ... }:

{
  # TODO Simplfier tout ce merdier
  home.packages = with pkgs; [
      rofi-powermenu
      bmks
    ];
  home.file = {
    ".local/bin/passrofi" = {
      enable = true;
      source = ./bin/passrofi;
      executable = true;
    };
    ".local/bin/rofi-kill" = {
      enable = true;
      source = ./bin/rofi-kill;
      executable = true;
    };
    ".local/bin/rofi-launcher" = {
      enable = true;
      source = ./bin/rofi-launcher;
      executable = true;
    };
    ".local/bin/rofi-mount" = {
      enable = true;
      source = ./bin/rofi-mount;
      executable = true;
    };
    ".local/bin/rofi-mullvad-toggle" = {
      enable = true;
      source = ./bin/rofi-mullvad-toggle;
      executable = true;
    };
    ".local/bin/rofi-printscreen" = {
      enable = true;
      source = ./bin/rofi-printscreen;
      executable = true;
    };
    ".local/bin/rofi-runner" = {
      enable = true;
      source = ./bin/rofi-runner;
      executable = true;
    };
    ".local/bin/rofi-umount" = {
      enable = true;
      source = ./bin/rofi-umount;
      executable = true;
    };
    ".local/bin/transadd" = {
      enable = true;
      source = ./bin/transadd;
      executable = true;
    };
  };
}
