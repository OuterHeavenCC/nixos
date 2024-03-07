{ inputs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./autoupgrade.nix
    ./fonts.nix
    ./geoclue2.nix
    ./git.nix
    ./input.nix
    ./locale.nix
    ./locate.nix
    ./nix.nix
    ./podman.nix
    ./security.nix
    ./ssh.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs outputs; };


}
