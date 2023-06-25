{ config, pkgs, ... }:

{
  programs.ledger = {
    enable = true;
    settings = {
      date-format = "%d-%m-%Y";
      no-pager = true;
      file = [ "${config.home.homeDirectory}/.config/ledger/professionnel.dat" ];
    };
  };
}
