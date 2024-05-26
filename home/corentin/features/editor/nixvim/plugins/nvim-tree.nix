{
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;
    };
    keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>NvimTreeToggle<CR>";
      options = {
        desc = "Explorer";
      };
    }
    ];
  };
}
