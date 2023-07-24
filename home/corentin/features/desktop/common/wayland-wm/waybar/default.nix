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
      all-outputs = true;
      format-icons = {
        active = "";
        default = "";
        urgent = "";
      };
    };

    "clock" = {
      format = "<span color='#${colors.base0E}'> </span>{:%H:%M}";
      on-click = calendar;
    };

    "clock#date" = {
      format = "<span color=\"#${colors.base0E}\"></span>{: %A %d %B}";
      on-click = calendar;
    };

    backlight = {
      device = "radeon_b10";
      format = "<span color='#${colors.base0E}'>{icon}</span> {percent}%";
      format-icons = [ "" "" "" "" "" "" "" "" "" ];
    };

    network = {
      interface = "enp42s0";
      format = "{ifname}";
      format-wifi = "<span color='#${colors.base0E}'> </span>{essid}";
      format-ethernet = "{ipaddr}/{cidr} <span color ='#${colors.base0E}'>󰈀</span>";
      format-disconnected = "<span color='#${colors.base0E}'>󰖪 </span>No Network";
      on-click = networkmanager_dmenu;
    };

    battery = {
      format = "<span color='#${colors.base0E}'>{icon}</span> {capacity}%";
      format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
      format-charging = "<span color='#${colors.base0E}'>󰂄</span> {capacity}%";
    };

    pulseaudio = {
      scroll-step = 2;
      format = "{icon}{volume}%";
      format-muted = "<span color='#${colors.base0E}'> </span>";
      format-icons.default = [ "<span color=\"#${colors.base0E}\"></span> " ];
      on-click = audioMonitor;
    };

    cpu = {
      format = "<span color=\"#${colors.base0E}\"> CPU</span> {usage}%";
      on-click = systemMonitor;
    };

    memory = {
      format = "<span color=\"#${colors.base0E}\"> RAM</span> {used:0.1f}G/{total:0.1f}G";
      on-click = systemMonitor;
      };
    };
  };
};
}
