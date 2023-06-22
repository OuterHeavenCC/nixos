{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles."konpf1db.default" = {
      id = 0;
      isDefault = true;
      name = "konpf1db";
      # TODO Trouver comment ça marche plus tard
      # extensions = with inputs.nur.repos.rycee.firefox-addons; [
      #   vimium
      # ];
    };
  };
}
