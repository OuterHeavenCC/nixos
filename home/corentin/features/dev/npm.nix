{ pkgs, config, ... }:

let
  cfg = config.xdg;
in
{
    home = {
      sessionVariables = {
        NPM_CONFIG_USERCONFIG= "${cfg.configHome}/npm/npmrc";
    };
      packages = with pkgs; [ 
        nodejs                        # Basic programming stuff
      ];
    };

    xdg.configFile."npm/npmrc".text = ''
        prefix='${cfg.dataHome}/npm'
        cache='${cfg.cacheHome}/npm'                                                                                      
        init-module='${cfg.configHome}/npm/config/npm-init.js'
    '';
}
