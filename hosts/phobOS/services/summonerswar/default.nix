{
  networking.firewall.allowedTCPPorts = [ 8080 ];
  security.pki.certificateFiles = [ ./ca.pem ];
}
