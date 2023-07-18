# This is the configuration required to run NixOS on GandiCloud.
{ lib, modulesPath, ... }:
{
  imports = [
    (modulesPath + "/virtualisation/openstack-config.nix")
  ];
  config = {
    boot.initrd.kernelModules = [
      "xen-blkfront" "xen-tpmfront" "xen-kbdfront" "xen-fbfront"
      "xen-netfront" "xen-pcifront" "xen-scsifront"
    ];

    # Show debug kernel message on boot then reduce loglevel once booted
    boot.consoleLogLevel = 7;
    boot.kernel.sysctl."kernel.printk" = "4 4 1 7";

    # For "openstack console log show"
    boot.kernelParams = [ "console=ttyS0" ];
    systemd.services."serial-getty@ttyS0" = {
      enable = true;
      wantedBy = [ "multi-user.target" ];
      serviceConfig.Restart = "always";
    };

    # This is to get a prompt via the "openstack console url show" command
    systemd.services."getty@tty1" = {
      enable = lib.mkForce true;
      wantedBy = [ "multi-user.target" ];
      serviceConfig.Restart = "always";
    };

    # This is required to get an IPv6 address on our infrastructure
    networking.tempAddresses = "disabled";

    system.stateVersion = "23.05";

    fileSystems."/" =
      { device = "/dev/disk/by-label/nixos";
        fsType = "ext4";
      };

    swapDevices = [{
      device = "/swap/swapfile";
      size = 1024;
    }];


    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.enX0.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}

