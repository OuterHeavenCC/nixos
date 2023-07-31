{ config, ... }:

let
  cfg = config.xdg;
in
{
  programs.nixvim.options = {
      number = true; # Show line numbers
      cmdheight = 1; # more space in the neovim command line for displaying messages
      completeopt = [ "menuone" "noselect" ];
      relativenumber = true; # Show relative line numbers
      spelllang = "fr_fr";
      tabstop = 2;
      shiftwidth = 2; # Tab width should be 2
      expandtab = true;
      fileencoding = "utf-8";
      foldmethod = "manual";
      foldexpr = "";
      hidden = true;
      hlsearch = true;
      ignorecase = true;
      pumheight = 10;
      smartcase = true;
      splitbelow = true;
      splitright = true;
      swapfile = false;
      undofile = true;
      signcolumn = "yes"; # Always show the sign column, otherwise it would shift the text each time
      cursorline = true;
      wrap = false;
      scrolloff = 8;
      sidescrolloff = 8;
      undodir = "${cfg.cacheHome}/nvim/undo";
  };
}
