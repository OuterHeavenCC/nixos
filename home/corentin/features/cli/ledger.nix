{ config, ... }:

let
  cfg = config.xdg;
in
{
  programs.ledger = {
    enable = true;
    settings = {
      date-format = "%d-%m-%Y";
      no-pager = true;
      file = [
        "${cfg.configHome}/ledger/professionnel.dat"
        "${cfg.configHome}/ledger/2023-pro.dat"
        "${cfg.configHome}/ledger/2022-pro.dat"
        "${cfg.configHome}/ledger/2021-pro.dat"
      ];
    };
  };
}
