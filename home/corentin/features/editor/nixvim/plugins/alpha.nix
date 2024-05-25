{
# TODO Compléter le menu
# Ajoute un menu au démarrage de nvim sans argument
  programs.nixvim.plugins.alpha = {
    enable = true;
    iconsEnabled = true;
    layout =
      let
      padding = val: {
        type = "padding";
        inherit val;
      };
    in
      [
      (padding 4)
      {
        opts = {
          hl = "AlphaHeader";
          position = "center";
        };
        type = "text";
        val = [
          "                                                    "
            " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ "
            " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ "
            " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ "
            " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ "
            " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ "
            " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ "
            "                                                    "
        ];
      }
    (padding 6)
    {
      type = "button";
      val = "  Nouveau fichier";
      on_press.__raw = "function() vim.cmd[[ene]] end";
      opts = {
        keymap = [
          "n"
            "n"
            "<cmd>:ene<CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
        ];
        shortcut = "n";

        position = "center";
        cursor = 3;
        width = 40;
        align_shortcut = "right";
        hl_shortcut = "Keyword";
      };
    }
    (padding 1)
    {
      type = "button";
      val = "  Rechercher un fichier";
      on_press.raw = "<cmd>:Telescope find_files<CR>";
      opts = {
        keymap = [
          "n"
            "f"
            "<cmd>:Telescope find_files<CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
        ];
        shortcut = "f";

        position = "center";
        cursor = 3;
        width = 40;
        align_shortcut = "right";
        hl_shortcut = "Keyword";
      };
    }
    (padding 1)
    {
      type = "button";
      val = "  Projets";
      on_press.raw = "<cmd>:Telescope projects<CR>";
      opts = {
        keymap = [
          "n"
            "p"
            "<cmd>:Telescope projects<CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
        ];
        shortcut = "p";

        position = "center";
        cursor = 3;
        width = 40;
        align_shortcut = "right";
        hl_shortcut = "Keyword";
      };
    }

    (padding 1)
    {
      type = "button";
      val = "󰈚  Fichiers récents";
      on_press.raw = "<cmd>:Telescope oldfiles<CR>";
      opts = {
        keymap = [
          "n"
            "r"
            "<cmd>:Telescope oldfiles<CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
        ];

        shortcut = "r";

        position = "center";
        cursor = 3;
        width = 40;
        align_shortcut = "right";
        hl_shortcut = "Keyword";
      };
    }
    (padding 1)
    {
      type = "button";
      val = "  Neorg";
      on_press.raw = "<cmd>:Neorg workspace notes<CR>";
      opts = {
        keymap = [
          "n"
            "w"
            "<cmd>:Neorg workspace notes<CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
        ];
        shortcut = "w";

        position = "center";
        cursor = 3;
        width = 40;
        align_shortcut = "right";
        hl_shortcut = "Keyword";
      };
    }
    (padding 1)
    {
      type = "button";
      val = "  Quitter Neovim";
      on_press.__raw = "function() vim.cmd[[qa]] end";
      opts = {
        keymap = [
          "n"
            "q"
            "<cmd>:qa<CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
        ];
        shortcut = "q";

        position = "center";
        cursor = 3;
        width = 40;
        align_shortcut = "right";
        hl_shortcut = "Keyword";
      };
    }
    ];
  };
}
