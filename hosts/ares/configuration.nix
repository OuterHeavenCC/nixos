{ pkgs, ...}:

{

# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

  # You can import other NixOS modules here
  imports = [

    <nixpkgs/nixos/modules/virtualisation/openstack-config.nix>
    ../common/global
    ../common/users/corentin

    ../common/optional/audio.nix
    ../common/optional/xdg.nix
    ../common/optional/mimeapps.nix
    ../common/optional/bluetooth.nix

    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "deimOS";
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
    networkmanager.enable = true;
  };

{
  environment.systemPackages = with pkgs;
	[
	  git
	  neovim
        ];
}

