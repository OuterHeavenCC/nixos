{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles."0.default" = {
      id = 0;
      isDefault = true;
      name = "0";
      # # TODO Trouver comment ça marche plus tard
      # extensions = with pkgs.repos.rycee.firefox-addons; [
      #   vimium
      #   stylus
      #   ublock-origin
      #   browserpass
      #   sponsorblock
      # ];
    };
  };
}
