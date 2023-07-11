{ config, pkgs, home, ... }:

let 
  inherit (config.colorscheme) colors;
  # Dependencies
  btm = "${pkgs.bottom}/bin/btm";
  calcurse = "${pkgs.calcurse}/bin/calcurse";

  terminal = "${pkgs.foot}/bin/footclient";
  terminal-spawn = cmd: "${terminal} -e ${cmd}";

  calendar = terminal-spawn calcurse;
  systemMonitor = terminal-spawn btm;


in
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
      });
    style = ''
* {
  border: none;
  font-family: 'Iosevka Nerd Font';
  font-size: 14px;
  font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
  min-height: 25px;
}

window#waybar {
  background: transparent;
}

#custom-arch, #workspaces {
  border-radius: 10px;
  background-color: #${colors.base00};
  color: #${colors.base07};
  margin-top: 15px;
	margin-right: 15px;
  padding-top: 1px;
  padding-left: 10px;
  padding-right: 10px;
}

#custom-arch {
  font-size: 20px;
	margin-left: 15px;
}

#workspaces button {
  background: #${colors.base00};
  color: #${colors.base05};
}

#workspaces button.active {
  color: #${colors.base07};
}

#custom-unread-mail, #cpu, #memory, #pulseaudio, #clock, #clock#date #backlight, #network, #battery{
  border-radius: 10px;
  background-color: #${colors.base00};
  color: #${colors.base07};
  margin-top: 15px;
  padding-left: 10px;
  padding-right: 10px;
  margin-right: 15px;
}

#cpu #memory #pulseaudio #clock #clock#date {
  margin-right: 0;
}

@keyframes blink {
  to {
    background-color: #ffffff;
    color: black;
  }
}

#battery.warning:not(.charging) {
  background: #${colors.base08};
  color: white;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}
    '';
    settings = {
       mainBar = {
    layer = "top";
    modules-left = [ "custom/arch" "wlr/workspaces" ];
    modules-center = [ "clock" ];
    modules-right = [ "pulseaudio" "cpu" "memory" "network" "clock#date" "battery" ];

    "custom/arch" = {
      format = " ";
      on-click = "sh ${config.home.homeDirectory}/.local/bin/rofi-powermenu";
    };

    "wlr/workspaces" = {
      format = "{name}";
      on-click = "activate";
      tooltip = false;
      all-outputs = true;
    };

    "clock" = {
      format = "<span color='#${colors.base07}'> </span>{:%H:%M}";
    };

    "clock#date" = {
      format = "<span color=\"#${colors.base07}\"> </span>{: %A %d %B}";
      on-click = calendar;
    };

    backlight = {
      device = "radeon_b10";
      format = "<span color='#${colors.base07}'>{icon}</span> {percent}%";
      format-icons = [ "" "" "" "" "" "" "" "" "" ];
    };

    network = {
      interface = "enp42s0";
      format = "{ifname}";
      format-wifi = "<span color='#${colors.base07}'> </span>{essid}";
      format-ethernet = "{ipaddr}/{cidr} <span color ='#${colors.base07}'>󰈀</span>";
      format-disconnected = "<span color='#${colors.base07}'>󰖪 </span>No Network";
      on-click = "networkmanager_dmenu -theme ${config.home.homeDirectory}/.config/rofi/config/networkmenu.rasi";
    };

    battery = {
      format = "<span color='#${colors.base07}'>{icon}</span> {capacity}%";
      format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
      format-charging = "<span color='#${colors.base07}'>󰂄</span> {capacity}%";
    };

    pulseaudio = {
      scroll-step = 2;
      format = "{icon} {volume}%";
      format-muted = "<span color='#${colors.base07}'> </span>";
      format-icons.default = [ "<span color=\"#${colors.base07}\"></span> " ];
      on-click = "pamixer -t";
    };

    cpu = {
      format = "<span color=\"#${colors.base07}\">  CPU</span> {usage}%";
      on-click = systemMonitor;
    };

    memory = {
      format = "<span color=\"#${colors.base07}\">  RAM</span> {used:0.1f}G/{total:0.1f}G";
      on-click = systemMonitor;
      };
    };
  };
};
}
