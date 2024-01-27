{ pkgs, ... }:

{
  networking.firewall.allowedTCPPortRanges = [ 8080 ];
}
