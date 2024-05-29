{ config, lib, ... }:

{
  programs.nixvim = {
    keymaps =
      let
        normal =
          lib.mapAttrsToList
            (key: action: {
              mode = "n";
              inherit action key;
            })
            {
              # Esc to clear search results
              "<esc>" = ":noh<CR>";

              # fix Y behaviour
              Y = "y$";

              # better window movement
              "<C-h>" = "<C-w>h";
              "<C-j>" = "<C-w>j";
              "<C-k>" = "<C-w>k";
              "<C-l>" = "<C-w>l";

              # resize with arrows
              "<C-Up>" = ":resize -2<CR>";
              "<C-Down>" = ":resize +2<CR>";
              "<C-Left>" = ":vertical resize +2<CR>";
              "<C-Right>" = ":vertical resize -2<CR>";
            };
        visual =
          lib.mapAttrsToList
            (key: action: {
              mode = "v";
              inherit action key;
            })
            {
              # better indenting
              "<" = "<gv";
              ">" = ">gv";

              # move selected line / block of text in visual mode
              "<A-k>" = ":m '<-2<CR>gv=gv";
              "<A-j>" = ":m '>+1<CR>gv=gv";
            };
      in
      config.nixvim.helpers.keymaps.mkKeymaps { options.silent = true; } (normal ++ visual);
  };
}
