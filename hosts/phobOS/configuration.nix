{ inputs, outputs, ... }:
# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{
  # You can import other NixOS modules here
  imports = [

    ../common/global
    ../common/users/corentin

    ../common/optional/minecraft
    ../common/optional/sshfs.nix
    ../common/optional/jellyfin.nix
    ../common/optional/kdeconnect.nix

    ./hardware-configuration.nix

  ];

  networking = {
    hostName = "phobOS";
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
    networkmanager.enable = true;
  };

  services.xserver = {
    enable = true;
    layout = "fr";
    videoDrivers = ["nvidia"];
    displayManager.lightdm.enable = false;
  };
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      open = true;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
