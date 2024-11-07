{
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings = {
      delay = 200;
      preset = false;
      spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffer";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "Rechercher";
        }
        {
          __unkeyed-1 = "<leader>n";
          group = "Neorg";
        }
        {
          __unkeyed-1 = "<leader>nj";
          group = "Neorg Journal";
        }
        {
          __unkeyed-1 = "<leader>nt";
          group = "Taches";
        }
      ];
    };
  };

}
