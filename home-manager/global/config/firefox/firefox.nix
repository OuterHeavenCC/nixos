{ config, pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles."0.default" = {
    settings = {
    extensions.activeThemeID = "76aabc99-c1a8-4c1e-832b-d4f2941d5a7a";
    };
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
