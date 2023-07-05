{ pkgs, lib, inputs, ... }:

let 
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  home.sessionVariables.BROWSER = "firefox";

  programs.firefox = {
    enable = true;
    profiles."0.default" = {
    settings = {
    extensions = 
    with addons; [
      ublock-origin
      sponsorblock
      vimium
      stylus
      browserpass
    ];};
      id = 0;
      isDefault = true;
      name = "0";
    };

  };

  programs.browserpass = {
    enable = true;
    browsers = [
      "firefox"
    ];
  };

}
