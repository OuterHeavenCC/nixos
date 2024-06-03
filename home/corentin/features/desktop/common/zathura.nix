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
    };
  };
}
