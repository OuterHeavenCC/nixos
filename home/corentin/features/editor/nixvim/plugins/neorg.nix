{ pkgs, inputs, ... }:

{

  nixpkgs.overlays = [ inputs.neorg-overlay.overlays.default ];

  programs.nixvim = {
    autoCmd = [
    {
      event = "FileType";
      pattern = "norg";
      command = "setlocal conceallevel=2";
    }
    ];
    plugins.neorg = {
      enable = true;
      package = pkgs.vimPlugins.neorg;
      modules = {
        "core.defaults" = { __empty = null; };
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
            icon_preset = "diamond";
            init_open_folds = "auto";
          };
        };
        "core.export" = {
          __empty = null;
          "markdown".__empty = null;
        };
        "core.integrations.treesitter" = { __empty = null; };
        "core.integrations.telescope" = { __empty = null; };
        "core.summary" = { __empty = null; };
      };
    };
  };
}
