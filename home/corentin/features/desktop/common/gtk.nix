{
  config,
  pkgs,
  inputs,
  ...
}:

let
  inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
in
rec {
  gtk = {
    enable = true;
    theme = {
      name = "${config.colorscheme.slug}";
      package = gtkThemeFromScheme { scheme = config.colorscheme; };
    };
    iconTheme = {
      name = "Zafiro-icons-Dark";
      package = pkgs.zafiro-icons;
    };
  };

  # dconf.settings = {
  #   "org/gnome/desktop/interface" = {
  #     color-scheme = "prefer-dark";
  #   };
  # };
}
