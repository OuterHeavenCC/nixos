{ inputs, ... }:

{

  imports = [
    ./servers/ourcraft
    inputs.nix-minecraft.nixosModules.minecraft-servers
  ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
  };

}
