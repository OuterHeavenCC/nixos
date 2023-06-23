{ config, pkgs, ... }:

{
  home.file = {
    ".local/bin/bmks" = {
      enable = true;
      source = ../../global/bin/bmks;
      executable = true;
    };
    ".local/bin/doasedit" = {
      enable = true;
      source = ../../global/bin/doasedit;
      executable = true;
    };
    ".local/bin/iplocate" = {
      enable = true;
      source = ../../global/bin/iplocate;
      executable = true;
    };
    ".local/bin/passrofi" = {
      enable = true;
      source = ../../global/bin/passrofi;
      executable = true;
    };
    ".local/bin/rofi-kill" = {
      enable = true;
      source = ../../global/bin/rofi-kill;
      executable = true;
    };
    ".local/bin/rofi-launcher" = {
      enable = true;
      source = ../../global/bin/rofi-launcher;
      executable = true;
    };
    ".local/bin/rofi-mount" = {
      enable = true;
      source = ../../global/bin/rofi-mount;
      executable = true;
    };
    ".local/bin/rofi-mullvad-toggle" = {
      enable = true;
      source = ../../global/bin/rofi-mullvad-toggle;
      executable = true;
    };
    ".local/bin/rofi-powermenu" = {
      enable = true;
      source = ../../global/bin/rofi-powermenu;
      executable = true;
    };
    ".local/bin/rofi-printscreen" = {
      enable = true;
      source = ../../global/bin/rofi-printscreen;
      executable = true;
    };
    ".local/bin/rofi-runner" = {
      enable = true;
      source = ../../global/bin/rofi-runner;
      executable = true;
    };
    ".local/bin/rofi-td-toggle" = {
      enable = true;
      source = ../../global/bin/rofi-td-toggle;
      executable = true;
    };
    ".local/bin/rofi-umount" = {
      enable = true;
      source = ../../global/bin/rofi-umount;
      executable = true;
    };
    ".local/bin/transadd" = {
      enable = true;
      source = ../../global/bin/transadd;
      executable = true;
    };
    ".local/bin/wrappedhl" = {
      enable = true;
      source = ../bin/wrappedhl;
      executable = true;
    };
  };
}
