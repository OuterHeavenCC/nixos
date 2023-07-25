{ config, pkgs, home, ... }:

let 
  inherit (config.colorscheme) colors;
  # Dependencies
  btm = "${pkgs.bottom}/bin/btm";
  calcurse = "${pkgs.calcurse}/bin/calcurse";
  pulsemixer = "${pkgs.pulsemixer}/bin/pulsemixer";
  networkmanager_dmenu = "${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";

  terminal = "${pkgs.foot}/bin/footclient";
  terminal-spawn = cmd: "${terminal} -e ${cmd}";

  calendar = terminal-spawn calcurse;
  audioMonitor = terminal-spawn pulsemixer;
  systemMonitor = terminal-spawn btm;
in
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
      });
    style = (import ./style.nix { 
      inherit (config) colorscheme fontProfiles; 
    });
    settings = {
       mainBar = {
    layer = "top";
    modules-left = [ "custom/nixos" "wlr/workspaces" ];
    modules-center = [ "clock" ];
    modules-right = [ "pulseaudio" "cpu" "memory" "network" "clock#date" "battery" ];

    "custom/nixos" = {
      format = "";
      on-click = "sh ${config.home.homeDirectory}/.local/bin/rofi-powermenu";
    };

    "wlr/workspaces" = {
      format = "{icon}";
      on-click = "activate";
      tooltip = false;
      all-outputs = false;
      format-icons = {
        active = "";
        default = "";
        urgent = "";
      };
    };

    "clock" = {
      format = " {:%H:%M}";
      on-click = calendar;
    };

    "clock#date" = {
      format = "{: %A %d %B}";
      on-click = calendar;
    };

    backlight = {
      device = "radeon_b10";
      format = "{icon} {percent}%";
      format-icons = [ "" "" "" "" "" "" "" "" "" ];
    };

    network = {
      interface = "enp42s0";
      format = "{ifname}";
      format-wifi = " {essid}";
      format-ethernet = "󰈀 {ipaddr}/{cidr}";
      format-disconnected = "󰖪 No Network";
      on-click = networkmanager_dmenu;
    };


    battery = {
      format = "{icon} {capacity}%";
      format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
      format-charging = "󰂄 {capacity}%";
    };

    pulseaudio = {
      scroll-step = 2;
      format = "{icon}{volume}%";
      format-muted = " ";
      format-icons.default = [ " " ];
      on-click = audioMonitor;
    };

    cpu = {
      format = " CPU {usage}%";
      on-click = systemMonitor;
    };

    memory = {
      format = " RAM {used:0.1f}G/{total:0.1f}G";
      on-click = systemMonitor;
      };
    };
  };
};
}
