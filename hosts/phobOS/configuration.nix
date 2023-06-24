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
    ../../modules/nixos/minecraft-server.nix
    ../../modules/nixos/sshfs.nix
    ../../modules/nixos/jellyfin.nix
    ../../modules/nixos/kdeconnect.nix
    #
    ./sysconfig/audio.nix
    ./sysconfig/bluetooth.nix
    ./sysconfig/mpd.nix
    ./sysconfig/boot.nix
    ./sysconfig/display.nix
    ./sysconfig/fonts.nix
    ./sysconfig/gnupg.nix
    ./sysconfig/home-manager-config.nix
    ./sysconfig/hyprland.nix
    ./sysconfig/input.nix
    ./sysconfig/locale.nix
    ./sysconfig/locate.nix
    ./sysconfig/networking.nix
    ./sysconfig/mullvad.nix
    ./sysconfig/nix-config.nix
    ./sysconfig/packages.nix
    ./sysconfig/security.nix
    ./sysconfig/ssh.nix
    ./sysconfig/mimeApps.nix
    ./sysconfig/users.nix
    ./sysconfig/steam.nix
    ./sysconfig/torrent.nix
    # ./users.nix
    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  programs.waybar.enable = true;
  
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
