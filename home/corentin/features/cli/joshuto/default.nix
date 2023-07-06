{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ joshuto ];
  xdg.configFile."joshuto/bookmarks.toml".text = import ./bookmarks.nix;
  xdg.configFile."joshuto/icons.toml".text = import ./icons.nix;
  xdg.configFile."joshuto/joshuto.toml".text = import ./joshuto.nix;
  xdg.configFile."joshuto/keymap.toml".text = import ./keymap.nix;
  xdg.configFile."joshuto/mimetype.toml".text = import ./mimetype.nix;
  xdg.configFile."joshuto/theme.toml".text = import ./theme.nix { inherit (config) colorscheme; };
  home.file.".config/joshuto/preview_file.sh" = {
    enable = true;
    source = ./preview_file.sh;
    executable = true;
  };
}
