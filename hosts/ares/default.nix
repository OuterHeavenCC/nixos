{
# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

  # You can import other NixOS modules here
  imports = [

    ./hardware-configuration.nix
    ../common/global
    ../common/users/corentin
    ../common/optional/nginx

  ];

  networking = {
    hostName = "ares";
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
    networkmanager = { 
      enable = true;
      dns = "none";
      unmanaged = [ "rc-manager" ];
    };
  };

}
