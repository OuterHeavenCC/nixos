{
  programs.git = {
    enable = true;
    userName = "Corentin CHAMINAND";
    userEmail = "corent.cham@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
    ignores = [
      ".direnv"
      "result"
    ];
  };
}
