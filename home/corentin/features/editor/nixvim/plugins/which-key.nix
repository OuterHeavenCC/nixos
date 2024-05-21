{
  programs.nixvim.plugins.which-key = {
    enable = true;
    registrations = {
      "<leader>b" = {
        mode = "n";
        name = "Buffer";
      };
      "<leader>s" = {
        mode = "n";
        name = "Search";
      };
      "<leader>n" = {
        mode = "n";
        name = "Neorg";
      };
      "<leader>nj" = {
        mode = "n";
        name = "Neorg Journal";
      };
    };
  };
}
