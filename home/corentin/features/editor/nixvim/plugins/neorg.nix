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
            icon_preset = "diamond";
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
  };
}
