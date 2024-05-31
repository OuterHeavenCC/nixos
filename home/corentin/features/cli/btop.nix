{ inputs, config, ... }:

let 
  colorscheme = config.colorscheme.slug;
in
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme =
        if (colorscheme == "gruvbox-dark-hard") then
          "gruvbox_dark"
        else if (colorscheme == "catppuccin-mocha") then
          "catppuccin_mocha"
        else if (colorscheme == "nord") then
          "nord"
        else
          "rose-pine";
      vim_keys = true;
    };
  };

  xdg.configFile."btop/themes/catppuccin_mocha.theme".source = "${inputs.catppuccin-btop}/themes/catppuccin_mocha.theme";
  xdg.configFile."btop/themes/rose-pine.theme".source = "${inputs.rose-pine-btop}/rose-pine.theme";
}
