{ inputs, config, ... }:

let
  cfg = config.xdg;
in
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
  # TODO Rajouter la documentation pour toutes les options et faire un module pour la configuration de chaque plugin
    enable = true;
    viAlias = true;
    vimAlias = true;
    options = {
      number = true; # Show line numbers
      cmdheight = 1; # more space in the neovim command line for displaying messages
      completeopt = [ "menuone" "noselect" ];
      relativenumber = true; # Show relative line numbers
      spelllang = "fr_fr";
      tabstop = 2;
      shiftwidth = 2; # Tab width should be 2
      expandtab = true;
      fileencoding = "utf-8";
      foldmethod = "manual";
      foldexpr = "";
      hidden = true;
      hlsearch = true;
      ignorecase = true;
      pumheight = 10;
      smartcase = true;
      splitbelow = true;
      splitright = true;
      swapfile = false;
      undofile = true;
      signcolumn = "yes"; # Always show the sign column, otherwise it would shift the text each time
      cursorline = true;
      wrap = false;
      scrolloff = 8;
      sidescrolloff = 8;
      undodir = "${cfg.cacheHome}/nvim/undo";
    };

    clipboard.register = "unnamedplus";
    clipboard.providers.wl-copy.enable = true;

    colorschemes.catppuccin.enable = true;

    plugins = {
      lsp = {
        enable = true;
        servers = {
          bashls.enable = true; # Bash LSP
          ccls.enable = true; # C++ LSP
          cmake.enable = true; # Cmake LSP
          gopls.enable = true; # Go LSP
          tsserver.enable = true; # Javascript/Typescript LSP
          eslint.enable = true; # Javascript/Typescript Linter
          html.enable = true; # HTML LSP
          jsonls.enable = true; # JSON LSP
          lua-ls.enable = true; # Lua LSP
          nil_ls.enable = true; # Nix LSP
          pyright.enable = true; # Python LSP
          rust-analyzer.enable = true; # Rust LSP
          tailwindcss.enable = true; # CSS LSP
          texlab.enable = true; # Latex LSP
          yamlls.enable = true; # YAML LSP
          zls.enable = true; # Zig LSP
        };
      };
      airline = { enable = true; };
      dap = { enable = true; };
      barbar = { enable = true; };
      bufferline = { enable = true; };
      nvim-tree = { enable = true; };
      comment-nvim = { enable = true; };
      telescope = { enable = true; };
      cursorline = { enable = true; };
      gitsigns = { enable = true; };
      indent-blankline = { enable = true; };
      lsp-format = { enable = true; };
      luasnip = { enable = true; };
      nvim-autopairs = { enable = true; };
      nvim-cmp = { enable = true; };
      nvim-colorizer = { enable = true; };
      treesitter = { enable = true; };
      which-key = { enable = true; };
    };
  };
}
