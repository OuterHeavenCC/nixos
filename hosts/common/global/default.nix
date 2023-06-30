{ inputs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./fonts.nix
    ./gnupg.nix
    ./input.nix
    ./locale.nix
    ./locate.nix
    ./mimeApps.nix
    ./mpd.nix
    ./mullvad.nix
    ./nix-config.nix
    ./packages.nix
    ./security.nix
    ./ssh.nix
    ./steam.nix
    ./theming.nix
    ./torrent.nix
    ./users.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs outputs; };


}
