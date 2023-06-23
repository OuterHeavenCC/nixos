{ config, pkgs, ... }:

{
  home.file = {
    ".local/bin/bmks" = {
      enable = true;
      source = ../bin/bmks;
      executable = true;
    };
    ".local/bin/doasedit" = {
      enable = true;
      source = ../bin/doasedit;
      executable = true;
    };
    ".local/bin/iplocate" = {
      enable = true;
      source = ../bin/iplocate;
      executable = true;
    };
    ".local/bin/passrofi" = {
      enable = true;
      source = ../bin/passrofi;
      executable = true;
    };
    ".local/bin/rofi-kill" = {
      enable = true;
      source = ../bin/rofi-kill;
      executable = true;
    };
    ".local/bin/rofi-launcher" = {
      enable = true;
      source = ../bin/rofi-launcher;
      executable = true;
    };
    ".local/bin/rofi-mount" = {
      enable = true;
      source = ../bin/rofi-mount;
      executable = true;
    };
    ".local/bin/rofi-mullvad-toggle" = {
      enable = true;
      source = ../bin/rofi-mullvad-toggle;
      executable = true;
    };
    ".local/bin/rofi-powermenu" = {
      enable = true;
      source = ../bin/rofi-powermenu;
      executable = true;
    };
    ".local/bin/rofi-printscreen" = {
      enable = true;
      source = ../bin/rofi-printscreen;
      executable = true;
    };
    ".local/bin/rofi-runner" = {
      enable = true;
      source = ../bin/rofi-runner;
      executable = true;
    };
    ".local/bin/rofi-td-toggle" = {
      enable = true;
      source = ../bin/rofi-td-toggle;
      executable = true;
    };
    ".local/bin/rofi-umount" = {
      enable = true;
      source = ../bin/rofi-umount;
      executable = true;
    };
    ".local/bin/transadd" = {
      enable = true;
      source = ../bin/transadd;
      executable = true;
    };
  };
}
