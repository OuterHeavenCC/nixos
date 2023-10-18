{ pkgs, inputs, config, ... }:
# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{
  # You can import other NixOS modules here
  imports = [

    inputs.hardware.nixosModules.common-cpu-amd

    ../common/global
    ../common/users/corentin

    ../common/optional/bluetooth.nix
    ../common/optional/fail2ban.nix
    ../common/optional/flatpak.nix
    # ../common/optional/gaming.nix
    ../common/optional/kdeconnect.nix
    ../common/optional/mimeApps.nix
    ../common/optional/mullvad.nix
    ../common/optional/pipewire.nix
    ../common/optional/ratbag.nix
    ../common/optional/sshfs.nix
    ../common/optional/systemd-boot.nix
    ../common/optional/xdg.nix
    ./services

    ./hardware-configuration.nix

  ];

  networking = {
    hostName = "phobOS";
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
    networkmanager = { 
      enable = true;
      dns = "none";
      unmanaged = [ "rc-manager" ];
    };
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
      extraPackages = with pkgs; [
        vaapiVdpau
      ];
    };
    nvidia = {
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
