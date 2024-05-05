{ inputs, ... }:

{
  imports = [
    inputs.hosts.nixosModule
  ];

  networking.stevenBlackHosts = {
      enable = true;
      blockFakenews = true;
      blockSocial = true;
      blockGambling = true;
  };
}
