# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    ./sysconfig/display.nix
    ./sysconfig/home-manager-config.nix
    ./sysconfig/hyprland.nix
    ./sysconfig/networking.nix

    ../common/sysconfig/audio.nix
    ../common/sysconfig/bluetooth.nix
    ../common/sysconfig/boot.nix
    ../common/sysconfig/fonts.nix
    ../common/sysconfig/gnupg.nix
    ../common/sysconfig/input.nix
    ../common/sysconfig/locale.nix
    ../common/sysconfig/locate.nix
    ../common/sysconfig/mimeApps.nix
    ../common/sysconfig/mpd.nix
    ../common/sysconfig/mullvad.nix
    ../common/sysconfig/nix-config.nix
    ../common/sysconfig/packages.nix
    ../common/sysconfig/security.nix
    ../common/sysconfig/ssh.nix
    ../common/sysconfig/steam.nix
    ../common/sysconfig/torrent.nix
    ../common/sysconfig/users.nix
    # ./users.nix
    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  programs.waybar.enable = true;
  
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
