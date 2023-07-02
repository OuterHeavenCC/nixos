{ inputs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./fonts.nix
    ./git.nix
    ./gnupg.nix
    ./input.nix
    ./locale.nix
    ./locate.nix
    ./nix.nix
    ./security.nix
    ./ssh.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs outputs; };


}
