{
  programs.nixvim = {
    globals = {
      mapleader = "<Space>";
    };
    options = {
      number = true;
      relativenumber = true;

      tabstop = 2;
      shiftwidth = 2;
      smartindent = true;
      autoindent = true;
      expandtab = true;

      mouse = "a";

      clipboard = "unnamedplus";
      cursorline = true;
      cursorlineopt = "number";


      ruler = false;
      
      undofile = true;

      autoread = true;

      textwidth = 0;
      wrapmargin = 0;
      breakindent = true;

      wildmenu = true;

      # ignore case if all lowercase
      ignorecase = true;
      smartcase = true;

      # highlight search results as you type
      hlsearch = true;
      incsearch = true;
    };
  };
}
