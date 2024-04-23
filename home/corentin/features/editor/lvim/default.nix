{ pkgs, ... }:

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
