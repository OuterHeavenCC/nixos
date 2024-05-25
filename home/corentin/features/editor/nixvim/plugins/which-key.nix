{
  programs.nixvim.plugins.which-key = {
    enable = true;
    registrations = {
      "<leader>b" = {
        mode = "n";
        name = "Buffer";
      };
      "<leader>f" = {
        mode = "n";
        name = "Rechercher";
      };
      "<leader>n" = {
        mode = "n";
        name = "Neorg";
      };
      "<leader>nj" = {
        mode = "n";
        name = "Neorg Journal";
      };
      "<leader>nt" = {
        mode = "n";
        name = "Taches";
      };
    };
  };
}
