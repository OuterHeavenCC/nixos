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
      action = ":vertical resize +2<CR>";
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

    # Rechercher

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
      key = "<leader>fC";
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
    {
      mode = "n";
      key = "<leader>z";
      action = "<cmd>ZenMode<CR>";
      options = {
        desc = "Zen Mode";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>Neorg keybind all core.integrations.treesitter.next.link<CR>";
      options = {
        desc = "Trouver le lien suivant";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>Neorg keybind all core.integrations.treesitter.previous.link<CR>";
      options = {
        desc = "Trouver le lien précédent";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fn";
      action = "<cmd>Neorg keybind all core.integrations.telescope.find_norg_files<CR>";
      options = {
        desc = "Rechercher un fichier norg";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ntd";
      action = "<cmd>Neorg keybind all core.qol.todo_items.todo.task_done<CR>";
      options = {
        desc = "Task done";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ntu";
      action = "<cmd>Neorg keybind all core.qol.todo_items.todo.task_undone<CR>";
      options = {
        desc = "Task undone";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ntp";
      action = "<cmd>Neorg keybind all core.qol.todo_items.todo.task_pending<CR>";
      options = {
        desc = "Task pending";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>nti";
      action = "<cmd>Neorg keybind all core.qol.todo_items.todo.task_important<CR>";
      options = {
        desc = "Task important";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>nta";
      action = "<cmd>Neorg keybind all core.qol.todo_items.todo.task_ambiguous<CR>";
      options = {
        desc = "Task ambiguous";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>nth";
      action = "<cmd>Neorg keybind all core.qol.todo_items.todo.task_on_hold<CR>";
      options = {
        desc = "Task on hold";
        silent = true;
      };
    }
  ];
}
