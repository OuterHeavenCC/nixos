{
  networking = {
    firewall = {
      allowedTCPPorts = [ 9 ];
      allowedUDPPorts = [ 9 ];
    };
    interfaces.enp42s0.wakeOnLan = {
      enable = true;
    };
  };
}
