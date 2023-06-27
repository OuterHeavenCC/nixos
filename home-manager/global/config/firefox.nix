{ config, pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles."0.default" = {
      id = 0;
      isDefault = true;
      name = "0";
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        vimium
        stylus
        ublock-origin
        browserpass
        sponsorblock
      ];
    };
  };
}
