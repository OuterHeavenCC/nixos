{ lib, ... }:

{

  home.sessionVariables.TERMINAL = "footclient";

  programs.foot = {
    enable = true;
    settings = {
      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        alpha = lib.mkForce 0.7;
      };
    };
  };
}
