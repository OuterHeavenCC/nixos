{
  config,
  colorscheme,
  inputs,
  pkgs,
  ...
}:
let
  waybar_config = import ./config.nix {
    inherit
      config
      colorscheme
      inputs
      pkgs
      ;
  };
  waybar_style = import ./style.nix {
    inherit
      config
      colorscheme
      inputs
      pkgs
      ;
  };
in
{
  programs.waybar = {
    enable = true;
    settings = waybar_config;
    style = waybar_style;
  };
}
