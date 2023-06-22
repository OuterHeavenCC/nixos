{ config, pkgs, ... }:

{
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
  default-fg = "#CDD6F4";
  default-bg = "#1E1E2E";
  completion-bg = "#313244";
  completion-fg = "#CDD6F4";
  completion-highlight-bg = "#575268";
  completion-highlight-fg = "#CDD6F4";
  completion-group-bg = "#313244";
  completion-group-fg = "#89B4FA";
  statusbar-fg = "#CDD6F4";
  statusbar-bg = "#313244";
  notification-bg = "#313244";
  notification-fg = "#CDD6F4";
  notification-error-bg = "#313244";
  notification-error-fg = "#F38BA8";
  notification-warning-bg = "#313244";
  notification-warning-fg = "#FAE3B0";
  inputbar-fg = "#CDD6F4";
  inputbar-bg = "#313244";
  recolor-lightcolor = "#1E1E2E";
  recolor-darkcolor = "#CDD6F4";
  index-fg = "#CDD6F4";
  index-bg = "#1E1E2E";
  index-active-fg = "#CDD6F4";
  index-active-bg = "#313244";
  render-loading-bg = "#1E1E2E";
  render-loading-fg = "#CDD6F4";
  highlight-color = "#575268";
  highlight-fg = "#F5C2E7";
  highlight-active-color = "#F5C2E7";
    };
  };
}
