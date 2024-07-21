{ pkgs, inputs, ... }:

{

  nixpkgs.overlays = [ inputs.neorg-overlay.overlays.default ];

  programs.nixvim = {
    autoCmd = [
      {
        event = "FileType";
        pattern = "norg";
        command = "setlocal conceallevel=2";
      }
      {
        event = "FileType";
        pattern = "norg";
        command = "TSEnable highlight";
      }
    ];
    plugins.neorg = {
      enable = true;
      package = pkgs.vimPlugins.neorg;
      modules = {
        "core.defaults" = {
          __empty = null;
        };
        "core.dirman" = {
          config = {
            workspaces = {
              notes = "~/Documents/Notes";
            };
            default_workspace = "notes";
          };
        };
        "core.concealer" = {
          config = {
            folds = true;
            icon_preset = "basic";
            init_open_folds = "auto";
          };
        };
        "core.export" = {
          __empty = null;
          "markdown".__empty = null;
        };
        "core.integrations.treesitter" = {
          __empty = null;
        };
        "core.integrations.telescope" = {
          __empty = null;
        };
        "core.summary" = {
          __empty = null;
        };
      };
    };
    keymaps = [
      
      # Global stuff

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
        key = "<leader>ni";
        action = "<cmd>Neorg workspace default<CR>";
        options = {
          desc = "Neorg Index";
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

      # Modes

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


      # Journal 

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

      # Telescope integration

      {
        mode = "n";
        key = "<leader>fn";
        action = "<Plug>(neorg.telescope.find_norg_files)";
        options = {
          desc = "Rechercher un fichier norg";
          silent = true;
        };
      }

      # Treesitter integration

      {
        mode = "n";
        key = "<Tab>";
        action = "<Plug>(neorg.treesitter.next.link)";
        options = {
          desc = "Treesitter (lien suivant)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<S-Tab>";
        action = "<Plug>(neorg.treesitter.previous.link)";
        options = {
          desc = "Treesitter (lien précédent)";
          silent = true;
        };
      }

      # Tasks

      {
        mode = "n";
        key = "<leader>nta";
        action = "<Plug>(neorg.qol.todo-items.todo.task-ambiguous)";
        options = {
          desc = "Task Ambiguous";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ntc";
        action = "<Plug>(neorg.qol.todo-items.todo.task-cancelled)";
        options = {
          desc = "Task Cancelled";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ntd";
        action = "<Plug>(neorg.qol.todo-items.todo.task-done)";
        options = {
          desc = "Task Done";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>nth";
        action = "<Plug>(neorg.qol.todo-items.todo.task-on-hold)";
        options = {
          desc = "Task On Hold";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>nti";
        action = "<Plug>(neorg.qol.todo-items.todo.task-important)";
        options = {
          desc = "Task Important";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ntp";
        action = "<Plug>(neorg.qol.todo-items.todo.task-pending)";
        options = {
          desc = "Task Pending";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ntr";
        action = "<Plug>(neorg.qol.todo-items.todo.task-recurring)";
        options = {
          desc = "Task Recurring";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ntu";
        action = "<Plug>(neorg.qol.todo-items.todo.task-undone)";
        options = {
          desc = "Task Undone";
          silent = true;
        };
      }
    ];
  };
}
