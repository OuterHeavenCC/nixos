{ inputs, ... }:

{
  imports = [ 
    inputs.nixvim.homeManagerModules.nixvim 
    ./plugins
    ./config
    ./lsp
  ];

  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
  # TODO Rajouter la documentation pour toutes les options et faire un module pour la configuration de chaque plugin
    enable = true;
    viAlias = true;
    vimAlias = true;

    clipboard.register = "unnamedplus";
    clipboard.providers.wl-copy.enable = true;


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
    };
  };
}
