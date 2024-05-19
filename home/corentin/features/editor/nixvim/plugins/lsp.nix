{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      bashls.enable = true;
      html.enable = true;
      clangd.enable = true;
      cssls.enable = true;
      lua-ls.enable = true;
      jsonls.enable = true;
      marksman.enable = true;
      nil_ls.enable = true;
      pyright.enable = true;
      rust-analyzer.enable = true;
      texlab.enable = true;
      tsserver.enable = true;
    };
  };
}
