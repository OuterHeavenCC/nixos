{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let

  requiredDeps = with pkgs; [
    config.wayland.windowManager.hyprland.package
    bash
    coreutils
    dart-sass
    gawk
    imagemagick
    procps
    ripgrep
    util-linux
  ];

  guiDeps = with pkgs; [
    gnome.gnome-control-center
    mission-center
    blueman
    powermenu
  ];

  dependencies = requiredDeps ++ guiDeps;

  cfg = config.programs.ags;
in
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
  };

  systemd.user.services.ags = {
    Unit = {
      Description = "Aylur's Gtk Shell";
      PartOf = [
        "tray.target"
        "graphical-session.target"
      ];
    };
    Service = {
      Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
      ExecStart = "${cfg.package}/bin/ags";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  xdg.configFile."ags/config.js".source = ./config/config.js;
  xdg.configFile."ags/imports.js".source = ./config/imports.js;
  xdg.configFile."ags/services".source = ./config/services;
  xdg.configFile."ags/windows".source = ./config/windows;
  xdg.configFile."ags/utils".source = ./config/utils;
  xdg.configFile."ags/style.css".text = import ./style.nix { inherit inputs config; };
}
