{ config, ... }:
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
      nixd = {
        enable = true;
        settings.nixpkgs.expr = "import <nixpkgs> { }";
        settings.options.nixos.expr = "(builtins.getFlake \"${config.home.sessionVariables.FLAKE}\").nixosConfigurations.phobOS.options"; # TODO Changer phobOS avec une variable
        settings.options.home_manager.expr = "(builtins.getFlake \"${config.home.sessionVariables.FLAKE}\").homeConfigurations.\"corentin@phobOS\".options"; # TODO Même chose ici
      };
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
