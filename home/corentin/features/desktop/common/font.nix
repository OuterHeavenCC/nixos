{ pkgs, ... }: {
  fontProfiles = {
    monospace =  {
      family = "Fira Code Nerd Font Mono";
      package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
    };
    regular = {
      family = "Fira Code Nerd Font";
      package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
    };
  };
}
