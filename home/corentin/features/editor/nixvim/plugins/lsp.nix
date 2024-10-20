{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      bashls.enable = true;
      html.enable = true;
      clangd.enable = true;
      cssls.enable = true;
      lua_ls.enable = true;
      jsonls.enable = true;
      marksman.enable = true;
      nil_ls.enable = true;
      pyright.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      texlab.enable = true;
      ts_ls.enable = true;
    };
  };
}
