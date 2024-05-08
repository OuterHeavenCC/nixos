{ inputs, ... }:

{

  imports = [

    inputs.nix-minecraft.nixosModules.minecraft-servers
    ./servers/survival
  ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
  };

  networking.firewall = {
    allowedTCPPorts = [ 25565 ];
    allowedUDPPorts = [
      25565
      19132
    ];
  };
}
