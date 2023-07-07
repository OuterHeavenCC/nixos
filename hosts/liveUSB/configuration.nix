{ lib, ... }:
# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{
  # You can import other NixOS modules here
  imports = [

    ../common/global
    ../common/users/corentin

    ../common/optional/audio.nix
    ../common/optional/xdg.nix
    ../common/optional/mimeApps.nix
    ../common/optional/bluetooth.nix
    ../common/optional/boot.nix
    ../common/optional/kdeconnect.nix
  ];

  networking = {
    useDHCP = lib.mkDefault true;
    hostName = "liveUSB";
    };

  services.xserver = {
    enable = true;
    layout = "fr";
    displayManager.lightdm.enable = false;
    libinput.touchpad = {
      middleEmulation = true;
      tapping = true;
      disableWhileTyping = true;
    };
  };
  hardware = {
    opengl.enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";


}
