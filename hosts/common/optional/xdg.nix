{ pkgs, inputs, ... }:

{

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland ];
    configPackages = [ 
      inputs.hyprland.packages.${pkgs.system}.hyprland
    ];
  };

}
