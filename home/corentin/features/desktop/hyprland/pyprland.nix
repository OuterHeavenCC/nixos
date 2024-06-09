{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pyprland
  ];
  xdg.configFile."hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = ["scratchpads" ]

    [scratchpads.term]
    command = "foot --app-id=scratchpad"
    margin = 50
    lazy = true

    [scratchpads.yazi]
    command = "foot --app-id=scratchpad -e yazi"
    unfocus = "hide"
    margin = 50
    lazy = true

    [scratchpads.eva]
    command = "foot --app-id=scratchpad -e eva"
    margin = 50
    lazy = true

    [scratchpads.btop]
    command = "foot --app-id=scratchpad -e btop"
    margin = 50
    lazy = true

    [scratchpads.tgpt]
    command = "foot --app-id=scratchpad -e tgpt -i"
    margin = 50
    lazy = true
    
    [scratchpads.pulsemixer]
    command = "foot --app-id=scratchpad -e pulsemixer"
    margin = 50
    lazy = true
  '';
}
