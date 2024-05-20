{
  programs.nixvim.keymaps = [
    # Better indenting
    {
        key = "<";
        action = "<gv";
        mode = "v";
    }
    {
      key = ">";
      action = ">gv";
      mode = "v";
    }
    # Better window movement
    {
      key = "<C-h>";
      action = "<C-w>h";
      mode = "n";
    }
    {
      key = "<C-j>";
      action = "<C-w>j";
      mode = "n";
    }
    {
      key = "<C-k>";
      action = "<C-w>k";
      mode = "n";
    }
    {
      key = "<C-l>";
      action = "<C-w>l";
      mode = "n";
    }
    # Resize with arrows
    {
      key = "<C-Up>";
      action = ":resize -2<CR>";
      mode = "n";
    }
    {
      key = "<C-Down>";
      action = ":resize +2<CR>";
      mode = "n";
    }
    {
      key = "<C-Left>";
      action = ":vertical resize -2<CR>";
      mode = "n";
    }
    {
      key = "<C-Right>";
      action = ":vertical resize -2<CR>";
      mode = "n";
    }
    # Move current line / block with Alt-j/k
    {
      key = "<A-j>";
      action = ":m '>+1<CR>gv-gv";
      mode = "x";
    }
    {
      key = "<A-k>";
      action = ":m '<-2<CR>gv-gv";
      mode = "x";
    }
  ];
}
