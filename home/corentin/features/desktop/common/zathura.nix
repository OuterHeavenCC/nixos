{ config, inputs, ... }:

let
  inherit (config.colorscheme) palette;
  hexToRGBString = inputs.nix-colors.lib.conversions.hexToRGBString;
in
{
  home.sessionVariables.READER = "zathura";
  programs.zathura = {
    enable = true;
    mappings = {
      u = "scroll half-up";
      d = "scroll half-down";
      D = "toggle_page_mode";
      r = "reload";
      R = "rotate";
      K = "zoom in";
      J = "zoom out";
      i = "recolor";
      p = "print";
      g = "goto top";
      b = "toggle_statusbar";
    };
    options = {
      sandbox = "none";
      guioptions = "";
      statusbar-h-padding = 0;
      statusbar-v-padding = 0;
      page-padding = 1;
      selection-clipboard = "clipboard";
      default-fg = "#${palette.base05}";
      default-bg = "#${palette.base00}";
      completion-bg = "#${palette.base02}";
      completion-fg = "#${palette.base05}";
      completion-highlight-bg = "#${palette.base04}";
      completion-highlight-fg = "#${palette.base05}";
      completion-group-bg = "#${palette.base02}";
      completion-group-fg = "#${palette.base0D}";
      statusbar-fg = "#${palette.base05}";
      statusbar-bg = "#${palette.base02}";
      notification-bg = "#${palette.base02}";
      notification-fg = "#${palette.base05}";
      notification-error-bg = "#${palette.base02}";
      notification-error-fg = "#${palette.base0F}";
      notification-warning-bg = "#${palette.base02}";
      notification-warning-fg = "#${palette.base0A}";
      inputbar-fg = "#${palette.base05}";
      inputbar-bg = "#${palette.base02}";
      recolor-lightcolor = "#${palette.base00}";
      recolor-darkcolor = "#${palette.base05}";
      index-fg = "#${palette.base05}";
      index-bg = "#${palette.base00}";
      index-active-fg = "#${palette.base05}";
      index-active-bg = "#${palette.base02}";
      render-loading-bg = "#${palette.base00}";
      render-loading-fg = "#${palette.base05}";
      highlight-color = "rgba(${hexToRGBString "," palette.base04},0.5)";
      highlight-fg = "#${palette.base06}";
      highlight-active-color = "#${palette.base06}";
    };
  };
}
