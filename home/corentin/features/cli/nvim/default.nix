{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;
    options = {
      number = true;                            # Show line numbers
      relativenumber = true;                    # Show relative line numbers
      shiftwidth = 2;                           # Tab width should be 2
    };
    plugins.lsp = {
      enable = true;
      servers = {
        bashls.enable = true;                   # Bash LSP
        ccls.enable = true;                     # C++ LSP
        cmake.enable = true;                    # Cmake LSP
        nil_ls.enable = true;                   # Nix LSP
        html.enable = true;                     # HTML LSP
        jsonls.enable = true;                   # JSON LSP
        texlab.enable = true;                   # Latex LSP
        rust-analyzer.enable = true;            # Rust LSP
        lua-ls.enable = true;                   # Lua LSP
        zls.enable = true;                      # Zig LSP
        pyright.enable = true;                  # Python LSP
        tailwindcss.enable = true;              # CSS LSP
        yamlls.enable = true;                   # YAML LSP
      };
    };
    plugins.ledger = {
      enable = true;                            # Ledger language features
    };
    colorschemes.catppuccin.enable = true;
  };

}
