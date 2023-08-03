
{
  pkgs,
  config,
  ...
}:
let
  waybar_config = import ./config.nix {inherit config pkgs;};
  waybar_style = import ./style.nix {inherit (config) colorscheme;};
in {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
      });
    settings = waybar_config;
    style = waybar_style;
  };
}
