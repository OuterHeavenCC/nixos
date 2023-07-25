{ config, pkgs, home, ... }:

let 
  inherit (config.colorscheme) colors;
  # Dependencies
  calcurse = "${pkgs.calcurse}/bin/calcurse";
  pulsemixer = "${pkgs.pulsemixer}/bin/pulsemixer";
  networkmanager_dmenu = "${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";

  terminal = "${pkgs.foot}/bin/footclient";
  terminal-spawn = cmd: "${terminal} -e ${cmd}";

  calendar = terminal-spawn calcurse;
  audioMonitor = terminal-spawn pulsemixer;
in
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
      });
    style = (import ./style.nix { 
      inherit (config) colorscheme; 
    });
    settings = {
      mainBar = {
          layer = "top";
          modules-left = [ "custom/nixos" "wlr/workspaces" ];
          modules-center = [ "clock" ];
          modules-right = [ "pulseaudio" "network" "battery" ];

          "custom/nixos" = {
            format = "";
            on-click = "sh ${config.home.homeDirectory}/.local/bin/rofi-powermenu";
          };

          "wlr/workspaces" = {
            format = "{icon}";
            on-click = "activate";
            all-outputs = false;
            format-icons = {
              active = "";
              default = "";
              urgent = "";
            };
          };

          "clock" = {
            format = "<span color='#${colors.base07}'></span> {:%H:%M}";
            on-click = calendar;
          };

          backlight = {
            device = "radeon_b10";
            format = "<span color='#${colors.base07}'>{icon}</span> {percent}%";
            format-icons = [ "" "" "" "" "" "" "" "" "" ];
          };

          network = {
            format = "{ifname}";
            format-wifi = "<span color='#${colors.base07}'></span> {essid}";
            format-ethernet = "<span color='#${colors.base07}'>󰌗</span>";
            format-disconnected = "<span color='#${colors.base07}'>󰖪</span> Non connecté";
            on-click = networkmanager_dmenu;
          };

          battery = {
            format = "<span color='#${colors.base07}'>{icon}</span> {capacity}%";
            format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            format-charging = "<span color='#${colors.base07}'>󰂄</span> {capacity}%";
          };

          pulseaudio = {
            scroll-step = 2;
            format = "<span color='#${colors.base07}'>{icon}</span>{volume}%";
            format-muted = "<span color='#${colors.base07}'></span> ";
            format-icons.default = [ " " ];
            on-click = audioMonitor;
          };
      };
    };
  };
}
