{ inputs, lib, pkgs, config, outputs, ... }:
let
  inherit (inputs.nix-colors) colorSchemes;
in
{
  imports = [
    ../features/cli
    inputs.nix-colors.homeManagerModule
  ] ++ (builtins.attrValues outputs.homeManagerModules);

    nixpkgs = {
      overlays = [
        outputs.overlays.modifications
      ];

      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };

    };

    nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home = {
    username = lib.mkDefault "corentin";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.05";
    sessionPath = [ "$HOME/.local/bin" ];
  };

  # colorscheme = lib.mkDefault colorSchemes.catppuccin-mocha;
  colorscheme = lib.mkDefault colorSchemes.nord;
  # colorscheme = lib.mkDefault colorSchemes.tokyo-night-storm;
  # colorscheme = lib.mkDefault colorSchemes.gruvbox-dark-hard;
  # colorscheme = lib.mkDefault colorSchemes.everforest;


}
