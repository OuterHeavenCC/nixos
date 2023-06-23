{ config, pkgs, ... }:

{
  home.file = {
    ".config/rofi/askpass.rasi" = {
      enable = true;
      source = ./themes/askpass.rasi;
    };
    ".config/rofi/bluetooth.rasi" = {
      enable = true;
      source = ./themes/bluetooth.rasi;
    };
    ".config/rofi/colors.rasi" = {
      enable = true;
      source = ./themes/colors.rasi;
    };
    ".config/rofi/confirm.rasi" = {
      enable = true;
      source = ./themes/confirm.rasi;
    };
    ".config/rofi/font.rasi" = {
      enable = true;
      source = ./themes/font.rasi;
    };
    ".config/rofi/launcher.rasi" = {
      enable = true;
      source = ./themes/launcher.rasi;
    };
    ".config/rofi/long-launcher.rasi" = {
      enable = true;
      source = ./themes/long-launcher.rasi;
    };
    ".config/rofi/mpd.rasi" = {
      enable = true;
      source = ./themes/mpd.rasi;
    };
    ".config/rofi/network.rasi" = {
      enable = true;
      source = ./themes/network.rasi;
    };
    ".config/rofi/networkmenu.rasi" = {
      enable = true;
      source = ./themes/networkmenu.rasi;
    };
    ".config/rofi/powermenu.rasi" = {
      enable = true;
      source = ./themes/powermenu.rasi;
    };
    ".config/rofi/runner.rasi" = {
      enable = true;
      source = ./themes/runner.rasi;
    };
    ".config/rofi/screenshot.rasi" = {
      enable = true;
      source = ./themes/screenshot.rasi;
    };
  };
}
