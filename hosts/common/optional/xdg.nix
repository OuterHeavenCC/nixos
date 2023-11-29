{ pkgs, ... }:

{

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    configPackages = [ 
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

}
