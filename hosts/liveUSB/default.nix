{ pkgs, modulesPath, ... }:
# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{
  # You can import other NixOS modules here
  imports = [

    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"

    ../common/global
    ../common/users/corentin

    ../common/optional/bluetooth.nix
    ../common/optional/fail2ban.nix
    ../common/optional/kdeconnect.nix
    ../common/optional/mimeApps.nix
    ../common/optional/mullvad.nix
    ../common/optional/pipewire.nix
    ../common/optional/printer.nix
    ../common/optional/syncthing.nix
    ../common/optional/systemd-boot.nix
    ../common/optional/upower.nix
    ../common/optional/waydroid.nix
    ../common/optional/xdg.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking = {
    hostName = "liveUSB";
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    networkmanager = {
      enable = true;
      dns = "none";
      unmanaged = [ "rc-manager" ];
    };
  };

  services.xserver = {
    enable = true;
    xkb.layout = "fr";
    displayManager.lightdm.enable = true;
    libinput.touchpad = {
      middleEmulation = true;
      tapping = true;
      disableWhileTyping = true;
    };
  };
  hardware = {
    graphics.enable = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
