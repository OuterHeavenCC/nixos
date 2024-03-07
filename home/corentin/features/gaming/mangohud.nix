{ pkgs, ... }:

{
  programs.mangohud = {
    enable = true;
    settings = {
      toggle_hud = "Shift_L+F12";
    };
  };
}
