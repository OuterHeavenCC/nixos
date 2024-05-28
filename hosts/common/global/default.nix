{ inputs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./geoclue2.nix
    ./git.nix
    ./input.nix
    ./locale.nix
    ./locate.nix
    ./nix.nix
    ./podman.nix
    ./security.nix
    ./shell.nix
    ./ssh.nix
  ];

  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
  };
}
