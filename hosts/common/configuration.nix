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

    # You can also split up your configuration and import pieces of it here:

    ./sysconfig/audio.nix
    ./sysconfig/bluetooth.nix
    ./sysconfig/boot.nix
    ./sysconfig/fonts.nix
    ./sysconfig/gnupg.nix
    ./sysconfig/input.nix
    ./sysconfig/locale.nix
    ./sysconfig/locate.nix
    ./sysconfig/mimeApps.nix
    ./sysconfig/mpd.nix
    ./sysconfig/mullvad.nix
    ./sysconfig/nix-config.nix
    ./sysconfig/packages.nix
    ./sysconfig/security.nix
    ./sysconfig/ssh.nix
    ./sysconfig/steam.nix
    ./sysconfig/torrent.nix
    ./sysconfig/users.nix
    ./sysconfig/theming.nix
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
