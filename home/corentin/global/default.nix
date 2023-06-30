{ inputs, lib, pkgs, config, outputs, ... }:
{
  imports = [
    ./config/abook.nix
    ./config/bottom.nix
    ./config/browserpass.nix
    ./config/btop.nix
    ./config/calcurse.nix
    ./config/cursor.nix
    ./config/dunst.nix
    ./config/firefox/firefox.nix
    ./config/git.nix
    ./config/gpg.nix
    ./config/ledger.nix
    ./config/lf.nix
    ./config/lvim.nix
    ./config/mpv/mpv.nix
    ./config/firefox/firefox.nix
    ./config/ncmpcpp.nix
    ./config/newsboat.nix
    ./config/nvim.nix
    ./config/rofi/rofi.nix
    ./config/scripts.nix
    ./config/swayidle.nix
    ./config/theming.nix
    ./config/userDirs.nix
    ./config/zathura.nix
  ];

  home = {
    username = lib.mkDefault "corentin";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.05";
    sessionPath = [ "$HOME/.local/bin" ];

  };

    nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      # outputs.overlays.additions
      # outputs.overlays.modifications
      # outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];

    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };

  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

}
