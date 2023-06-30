{ inputs, outputs, ... }:
# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd
    # inputs.nix-minecraft.nixosModules.minecraft-servers

    # You can also split up your configuration and import pieces of it here:
    #
    ./sysconfig/display.nix
    ./sysconfig/hyprland.nix
    ./sysconfig/networking.nix

    ../common/global
    ../common/optional/minecraft
    ../common/optional/sshfs.nix
    ../common/optional/jellyfin.nix
    ../common/optional/kdeconnect.nix
    # ./users.nix
    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];


  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
