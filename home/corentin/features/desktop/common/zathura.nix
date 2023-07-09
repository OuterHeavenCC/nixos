{ config, ... }:

let
  inherit (config.colorscheme) colors;
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
  default-fg = "#${colors.base05}";
  default-bg = "#${colors.base00}";
  completion-bg = "#${colors.base02}";
  completion-fg = "#${colors.base05}";
  completion-highlight-bg = "#${colors.base04}";
  completion-highlight-fg = "#${colors.base05}";
  completion-group-bg = "#${colors.base02}";
  completion-group-fg = "#${colors.base0D}";
  statusbar-fg = "#${colors.base05}";
  statusbar-bg = "#${colors.base02}";
  notification-bg = "#${colors.base02}";
  notification-fg = "#${colors.base05}";
  notification-error-bg = "#${colors.base02}";
  notification-error-fg = "#${colors.base0F}";
  notification-warning-bg = "#${colors.base02}";
  notification-warning-fg = "#${colors.base0A}";
  inputbar-fg = "#${colors.base05}";
  inputbar-bg = "#${colors.base02}";
  recolor-lightcolor = "#${colors.base00}";
  recolor-darkcolor = "#${colors.base05}";
  index-fg = "#${colors.base05}";
  index-bg = "#${colors.base00}";
  index-active-fg = "#${colors.base05}";
  index-active-bg = "#${colors.base02}";
  render-loading-bg = "#${colors.base00}";
  render-loading-fg = "#${colors.base05}";
  highlight-color = "#${colors.base04}";
  highlight-fg = "#${colors.base06}";
  highlight-active-color = "#${colors.base06}";
    };
  };
}
