{
  pkgs,
  lib,
  ...
}:

let
  theme = {
    name = "adw-gtk3-dark";
    package = pkgs.adw-gtk3;
  };

  iconTheme = {
    name = "MoreWaita";
    package = pkgs.morewaita-icon-theme;
  };
in
{

  home.packages = with pkgs; [
    theme.package
    iconTheme.package
    adwaita-icon-theme    # Needed for ags symbols
  ];

  gtk = {
    inherit iconTheme;
    theme.name = lib.mkForce theme.name;
    enable = true;
  };

}
