{ pkgs, config, ... }:

{
  services.mullvad-vpn = {
    enable = true;
  };
}