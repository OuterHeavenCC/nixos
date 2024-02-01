{ pkgs, ... }:

{
  programs.mangohud = {
    enable = false;
    settings = {
      toggle_hud = "Shift_L+F12";
    };
  };
}
