{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
    };
    keymaps = [
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers previewer=false<CR>";
      options = {
        desc = "Rechercher un buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>fC";
      action = "<cmd>Telescope commands<cr>";
      options = {
        desc = "Rechercher dans les commandes neovim";
      };
    }
    {
      mode = "n";
      key = "<leader>fgb";
      action = "<cmd>Telescope git_branches<cr>";
      options = {
        desc = "Rechercher une branche git";
      };
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>Telescope colorscheme<cr>";
      options = {
        desc = "Rechercher un colorscheme";
      };
    }
    {
      mode = "n";
      key = "<leader>fgc";
      action = "<cmd>Telescope git_commits<cr>";
      options = {
        desc = "Rechercher un commit";
      };
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
      options = {
        desc = "Rechercher un fichier";
      };
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<cr>";
      options = {
        desc = "Rechercher de l'aide";
      };
    }
    {
      mode = "n";
      key = "<leader>fk";
      action = "<cmd>Telescope keymaps<cr>";
      options = {
        desc = "Rechercher dans les keymaps";
      };
    }
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd>Telescope projects<cr>";
      options = {
        desc = "Rechercher un projet";
      };
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>Telescope oldfiles<cr>";
      options = {
        desc = "Rechercher un fichier récent";
      };
    }
    {
      mode = "n";
      key = "<leader>fR";
      action = "<cmd>Telescope registers<cr>";
      options = {
        desc = "Rechercher un registre";
      };
    }
    {
      mode = "n";
      key = "<leader>ft";
      action = "<cmd>Telescope live_grep<cr>";
      options = {
        desc = "Rechercher du texte";
      };
    }
    ];
  };
}
