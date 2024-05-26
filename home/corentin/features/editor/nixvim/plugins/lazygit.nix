{
  programs.nixvim = {
    plugins.lazygit = {
      enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>g";
        action = "<cmd>LazyGit<CR>";
        options = {
          desc = "LazyGit";
          silent = true;
        };
      }
    ];
  };
}
