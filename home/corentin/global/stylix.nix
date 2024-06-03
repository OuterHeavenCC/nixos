{ pkgs, ... }:

let
  colorscheme = "gruvbox-dark-hard";
in
{
  stylix = {
    image = ./gruvbox.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${colorscheme}.yaml";

    opacity = {
      desktop = 1.0;
      popups = 1.0;
      terminal = 0.7;
    };

    fonts = {
      serif = {
        package = pkgs.libertine;
        name = "Linux Libertine";
      };
      sansSerif = {
        package = pkgs.fira;
        name = "Fira Sans";
      };
      monospace = {
        package = pkgs.nerdfonts.override { fonts =  [ "FiraCode" ];};
        name = "FiraCode Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        desktop = 12;
        popups = 12;
        terminal = 14;
      };
    };

    cursor = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "Catppuccin-Mocha-Dark-Cursors";
      size = 16;
    };
  };
}
