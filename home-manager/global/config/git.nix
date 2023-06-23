{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Corentin CHAMINAND";
    userEmail = "corent.cham@gmail.com";
  };
}
