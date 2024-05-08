{ lib, ... }:
let
  inherit (lib) types mkOption;
in
{
  options.wallpaper = mkOption {
    type = types.path;
    default = "/home/corentin/.local/share/bg";
    description = ''
      Wallpaper path
    '';
  };
}
