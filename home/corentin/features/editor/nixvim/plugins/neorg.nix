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
    ];
  };
}
