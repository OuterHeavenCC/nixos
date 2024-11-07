{ pkgs, ... }:

let
  colorscheme = "catppuccin-mocha";
in
{
  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "https://github.com/OuterHeavenCC/wallpapers/blob/main/rose-pine.jpg?raw=true";
      sha256 = "YLHsj9SKuJNwiYxCQ5zFDrdEfTSEH89ue95yBvQZ+MI=";
    };
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
        package = pkgs.nerdfonts.override {
          fonts = [
            "FiraCode"
            "Ubuntu"
          ];
        };
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
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 16;
    };
  };
}
