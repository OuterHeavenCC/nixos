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
          };
        };
      };
    };
    extraLuaPackages = with pkgs.luaPackages; [
      lua-utils-nvim
      nvim-nio
      pathlib-nvim
    ];
  };
}
