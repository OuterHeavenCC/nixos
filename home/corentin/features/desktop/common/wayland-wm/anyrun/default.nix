{
  pkgs,
  inputs,
  config,
  ...
}:

{
  imports = [ inputs.anyrun.homeManagerModules.default ];

  programs.anyrun = {
    enable = true;

    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
        stdin
        symbols
        translate
      ];

      width.fraction = 0.3;
      y.absolute = 15;
      hidePluginInfo = true;
      closeOnClick = true;
    };

    extraCss = import ./style.nix { inherit inputs config; };

    extraConfigFiles."applications.ron".text = ''
      Config(
        desktop_actions: false,
        max_entries: 5,
        terminal: Some("foot"),
      )
    '';
  };

  programs.zsh.sessionVariables = {
    ANYRUN_STDIN_PLUGIN_PATH = "${inputs.anyrun.packages.${pkgs.system}.stdin}/lib/libstdin.so";
  };
}
