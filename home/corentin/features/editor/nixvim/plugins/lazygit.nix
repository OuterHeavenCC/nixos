{
  programs.nixvim = {
    plugins.lazygit = {
      enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>lg";
        action = "<cmd>LazyGit<CR>";
        options = {
          desc = "LazyGit";
          silent = true;
        };
      }
    ];
  };
}
