{
  programs.ledger = {
    enable = true;
    settings = {
      date-format = "%d-%m-%Y";
      no-pager = true;
      file = [ "~/.config/ledger/professionnel.dat" ];
    };
  };
}
