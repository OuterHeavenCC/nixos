{
# Ajoute des tabs pour les différents buffers
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
    };
    keymaps = [
    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options = {
        desc = "Buffer précédent";
      };
    }
    {
      mode = "n";
      key = "<leader>bn";
      action = "<cmd>BufferLineCycleNext<CR>";
      options = {
        desc = "Buffer suivant";
      };
    }
    {
      mode = "n";
      key = "<leader>c";
      action = "<cmd>bdelete<CR>";
      options = {
        desc = "Fermer le buffer";
      };
    }
    ];
  };
}
