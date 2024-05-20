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
              ":ene<CR>"
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
          on_press.raw = "require('telescope.builtin').find_files";
          opts = {
            keymap = [
              "n"
              "f"
              ":Telescope find_files <CR>"
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
          val = "󰈚  Fichiers récents";
          on_press.raw = "require('telescope.builtin').oldfiles";
          opts = {
            keymap = [
              "n"
              "r"
              ":Telescope oldfiles <CR>"
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
          on_press.raw = "function() vim.cmd[[Neorg workspace]] end";
          opts = {
            keymap = [
              "n"
              "w"
              ":Neorg workspace notes <CR>"
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
              ":qa<CR>"
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
