{
  programs.nixvim.keymaps = [

    # General movements

    ## Better indenting
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
    ## Better window movement
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
    ## Resize with arrows
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

    ## Move current line / block with Alt-j/k

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

    # Actions

    ## General actions

    {
      mode = "n";
      key = "<leader>w";
      action = "<cmd>w!<CR>";
      options = {
        desc = "Sauvegarder";
      };
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>confirm q<CR>";
      options = {
        desc = "Quitter neovim";
      };
    }

    ## Buffers action

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
      key = "<leader>bf";
      action = "<cmd>Telescope buffers previewer=false<CR>";
      options = {
        desc = "Rechercher un buffer";
      };
    }

    # Rechercher

    {
      mode = "n";
      key = "<leader>sgb";
      action = "<cmd>Telescope git_branches<cr>";
      options = {
        desc = "Rechercher une branche git";
      };
    }
    {
      mode = "n";
      key = "<leader>sc";
      action = "<cmd>Telescope colorscheme<cr>";
      options = {
        desc = "Rechercher un colorscheme";
      };
    }
    {
      mode = "n";
      key = "<leader>sgc";
      action = "<cmd>Telescope git_commits<cr>";
      options = {
        desc = "Rechercher un commit";
      };
    }
    {
      mode = "n";
      key = "<leader>sf";
      action = "<cmd>Telescope find_files<cr>";
      options = {
        desc = "Rechercher un fichier";
      };
    }
    {
      mode = "n";
      key = "<leader>sh";
      action = "<cmd>Telescope help_tags<cr>";
      options = {
        desc = "Rechercher de l'aide";
      };
    }
    {
      mode = "n";
      key = "<leader>sr";
      action = "<cmd>Telescope oldfiles<cr>";
      options = {
        desc = "Rechercher un fichier récent";
      };
    }
    {
      mode = "n";
      key = "<leader>sR";
      action = "<cmd>Telescope registers<cr>";
      options = {
        desc = "Rechercher un registre";
      };
    }
    {
      mode = "n";
      key = "<leader>st";
      action = "<cmd>Telescope live_grep<cr>";
      options = {
        desc = "Rechercher du texte";
      };
    }
    {
      mode = "n";
      key = "<leader>sk";
      action = "<cmd>Telescope keymaps<cr>";
      options = {
        desc = "Rechercher dans les keymaps";
      };
    }
    {
      mode = "n";
      key = "<leader>sC";
      action = "<cmd>Telescope commands<cr>";
      options = {
        desc = "Rechercher dans les commandes neovim";
      };
    }

    # Plugins

    # alpha

    {
      mode = "n";
      key = "<leader>;";
      action = "<cmd>Alpha<CR>";
      options = {
        desc = "Dashboard";
      };
    }

    ## Nvim-Tree

    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>NvimTreeToggle<CR>";
      options = {
        desc = "Explorer";
      };
    }

    ## nvim-comment

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

    ## Neorg

    ### Neorg workspace

    {
      mode = "n";
      key = "<leader>ni";
      action = "<cmd>Neorg workspace default<CR>";
      options = {
        desc = "Neorg Index";
        silent = true;
      };
    }

    ### Neorg Journal

    {
      mode = "n";
      key = "<leader>nja";
      action = "<cmd>Neorg journal today<CR>";
      options = {
        desc = "Journal Neorg (Aujourd'hui)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>njd";
      action = "<cmd>Neorg journal tomorrow<CR>";
      options = {
        desc = "Journal Neorg (Demain)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>njh";
      action = "<cmd>Neorg journal yesterday<CR>";
      options = {
        desc = "Journal Neorg (Hier)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>nc";
      action = "<cmd>Neorg toggle-concealer<CR>";
      options = {
        desc = "Toggle concealer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>nn";
      action = "<cmd>Neorg mode norg<CR>";
      options = {
        desc = "Norg Mode";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>nh";
      action = "<cmd>Neorg mode traverse-heading<CR>";
      options = {
        desc = "Traverse-heading mode";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>nl";
      action = "<cmd>Neorg mode traverse-link<CR>";
      options = {
        desc = "Traverse-link mode";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ns";
      action = "<cmd>Neorg toc<CR>";
      options = {
        desc = "Sommaire";
        silent = true;
      };
    }
  ];
}
