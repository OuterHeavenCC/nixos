{
  programs.nixvim = {
    plugins.comment = {
      enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>/";
        action = "<Plug>(comment_toggle_linewise_current)";
        options = {
          desc = "Commenter la ligne";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<leader>/";
        action = "<Plug>(comment_toggle_linewise_visual)";
        options = {
          desc = "Commenter la ligne";
          silent = true;
        };
      }
    ];
  };
}
