{ inputs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./fonts.nix
    ./git.nix
    ./gnupg.nix
    ./input.nix
    ./locale.nix
    ./locate.nix
    ./mimeApps.nix
    ./mullvad.nix
    ./nix.nix
    ./security.nix
    ./ssh.nix
    ./xdg.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs outputs; };


}
