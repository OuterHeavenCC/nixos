{
networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 22 80 443 8000 ];
  allowedUDPPortRanges = [
    { from = 4000; to = 4007; }
    { from = 8000; to = 8010; }
  ];
};
}
