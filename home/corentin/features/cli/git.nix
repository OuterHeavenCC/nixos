{
  programs.git = {
    enable = true;
    userName = "Corentin CHAMINAND";
    userEmail = "corent.cham@gmail.com";
    extraConfig = {
      safe = {
        directory = "*";
      };
      init.defaultBranch = "main";
    };
    ignores = [
      ".direnv"
      "result"
    ];
  };
}
