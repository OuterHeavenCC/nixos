{
  programs.ledger = {
    enable = true;
    settings = {
      date-format = "%d-%m-%Y";
      no-pager = true;
      file = [ 
        "~/.config/ledger/professionnel.dat"
        "~/.config/ledger/2022-pro.dat" 
        "~/.config/ledger/2021-pro.dat" 
      ];
    };
  };
}
