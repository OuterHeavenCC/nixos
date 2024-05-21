{ pkgs, ... }:

{

  programs.nixvim = {
    plugins.neorg = {
      enable = true;
      package = pkgs.stable.vimPlugins.neorg;
      modules = {
        "core.defaults" = {
          __empty = null;
        };
        "core.dirman" = {
          config = {
            workspaces = {
              notes = "~/Documents/Notes";
            };
            default_workspace = "notes";
          };
        };
        "core.concealer" = {
          config = {
            folds = true;
            icon_preset = "basic";
            init_open_folds = "auto";
          };
        };
        "core.export" = {
          __empty = null;
          "markdown".__empty = null;
          };
        };
      };
    };
}
