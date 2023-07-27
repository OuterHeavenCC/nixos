{ pkgs, config, ... }:

{
    home.packages = with pkgs; [ 
      nodejs                        # Basic programming stuff
    ];

    xdg.configFile."npm/npmrc".text = ''
        prefix=''${XDG_DATA_HOME}/npm                                                                                       
        cache=''${XDG_CACHE_HOME}/npm                                                                                       
        init-module=''${XDG_CONFIG_HOME}/npm/config/npm-init.js    
    '';
}
