{ pkgs, config, ... }:

let
nvim-spell-fr-utf8-dictionary = builtins.fetchurl {
  url = "http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl";
  sha256 = "abfb9702b98d887c175ace58f1ab39733dc08d03b674d914f56344ef86e63b61";
};

nvim-spell-fr-utf8-suggestions = builtins.fetchurl {
  url = "http://ftp.vim.org/vim/runtime/spell/fr.utf-8.sug";
  sha256 = "0294bc32b42c90bbb286a89e23ca3773b7ef50eff1ab523b1513d6a25c6b3f58";
};

nvim-spell-fr-latin1-dictionary = builtins.fetchurl {
  url = "http://ftp.vim.org/vim/runtime/spell/fr.latin1.spl";
  sha256 = "086ccda0891594c93eab143aa83ffbbd25d013c1b82866bbb48bb1cb788cc2ff";
};

nvim-spell-fr-latin1-suggestions = builtins.fetchurl {
  url = "http://ftp.vim.org/vim/runtime/spell/fr.latin1.sug";
  sha256 = "5cb2c97901b9ca81bf765532099c0329e2223c139baa764058822debd2e0d22a";
};
in
{

  home.packages = with pkgs; [
    lunarvim

    nodePackages_latest.pyright # Python
    nodePackages_latest.bash-language-server # Bash
    lua-language-server # Lua
    ccls # C
    nil # Nix
    texlab # Latex
    marksman # Markdown
    # Web stuff LSP
    nodePackages_latest.vscode-html-languageserver-bin
    nodePackages_latest.vscode-css-languageserver-bin
    nodePackages_latest.vscode-json-languageserver
    nodePackages_latest.typescript-language-server

  ];

  home.sessionVariables.EDITOR = "lvim";

  programs.zsh.shellAliases = {
    v = "$EDITOR";
    vi = "$EDITOR";
    vim = "$EDITOR";
    nvim = "$EDITOR";
  };


  home.file."${config.xdg.configHome}/lvim/spell/fr.utf-8.spl".source = nvim-spell-fr-utf8-dictionary;
  home.file."${config.xdg.configHome}/lvim/spell/fr.utf-8.sug".source = nvim-spell-fr-utf8-suggestions;
  home.file."${config.xdg.configHome}/lvim/spell/fr.latin1.spl".source = nvim-spell-fr-latin1-dictionary;
  home.file."${config.xdg.configHome}/lvim/spell/fr.latin1.sug".source = nvim-spell-fr-latin1-suggestions;

  xdg.configFile."lvim/config.lua" = {
    text = ''
      lvim.plugins = {
        { "catppuccin/nvim" },
        { "vimwiki/vimwiki" },
      }


      lvim.colorscheme = "catppuccin-macchiato"

      vim.opt.relativenumber = true
      vim.opt.textwidth = 80

      vim.g.vimwiki_list = {{path = '~/Documents/Notes/'}}

      lvim.builtin.alpha.dashboard.section.buttons.entries = {
          { "f", lvim.icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>" },
          { "n", lvim.icons.ui.NewFile .. "  New File", "<CMD>ene!<CR>" },
          { "p", lvim.icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>" },
          { "r", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>" },
          { "t", lvim.icons.ui.FindText .. "  Find Text", "<CMD>Telescope live_grep<CR>" },
          { "w", lvim.icons.ui.Note .. "  Wiki", "<CMD>VimwikiIndex<CR>"},
          {
            "c",
            lvim.icons.ui.Gear .. "  Configuration",
            "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
          },
          { "q", lvim.icons.ui.Close .. "  Quit", "<CMD>quit<CR>" },
      }
      '';
  };

}
