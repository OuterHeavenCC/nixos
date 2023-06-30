{ inputs, lib, pkgs, config, outputs, ... }:
{
  imports = [
    ../features/cli
  ];


    nixpkgs = {

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

}
