{ pkgs, ... }:

{
  programs.adb.enable = true;
  users.users.corentin.extraGroups = [ "adbusers" ];

  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  services.gvfs.enable = true;
}
