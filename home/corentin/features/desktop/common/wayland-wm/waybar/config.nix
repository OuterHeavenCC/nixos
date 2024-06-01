{ config, pkgs, ... }:

let
  inherit (config.colorscheme) palette;
  pulsemixer = "${pkgs.pulsemixer}/bin/pulsemixer";
  networkManager = "${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";
  jq = "${pkgs.jq}/bin/jq";
  xml = "${pkgs.xmlstarlet}/bin/xml";
  neomutt = "${pkgs.neomutt}/bin/neomutt";
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  ncmpcpp = "${pkgs.ncmpcpp}/bin/ncmpcpp";

  terminal = "${pkgs.foot}/bin/footclient";
  terminal-spawn = cmd: "${terminal} -e ${cmd}";
  powermenu = "${pkgs.powermenu}/bin/powermenu";
  audioMonitor = terminal-spawn pulsemixer;
  mail = terminal-spawn neomutt;
  musicPlayer = terminal-spawn ncmpcpp;

  cfg.mailpath = config.accounts.email.maildirBasePath;

  jsonOutput =
    name:
    {
      pre ? "",
      text ? "",
      tooltip ? "",
      alt ? "",
      class ? "",
      percentage ? "",
    }:
    "${pkgs.writeShellScriptBin "waybar-${name}" ''
      set -euo pipefail
      ${pre}
      ${jq} -cn \
          --arg text "${text}" \
          --arg tooltip "${tooltip}" \
          --arg alt "${alt}" \
          --arg class "${class}" \
          --arg percentage "${percentage}" \
          '{text:$text,tooltip:$tooltip,alt:$alt,class:$class,percentage:$percentage}'
    ''}/bin/waybar-${name}";
in
{
  home.packages = [
    pkgs.playerctl
    pkgs.pavucontrol
  ];

  mainBar = {
    height = 45;
    layer = "top";
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    margin-top = -1;
    position = "top";
    modules-left = [
      "custom/powermenu"
      "custom/playerctl#backward"
      "custom/playerctl#play"
      "custom/playerctl#foward"
      "custom/playerlabel"
    ];
    modules-center = [
      "cava#left"
      "hyprland/workspaces"
      "cava#right"
    ];
    modules-right = [
      "tray"
      "custom/mail"
      "battery"
      "pulseaudio"
      "network"
      "clock"
    ];

    clock = {
      format = " {:%a, %d %b, %I:%M %p}";
      format-alt = " {:%d/%m}";
      tooltip = "true";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    };

    battery = {
      states = {
        good = 95;
        warning = 30;
        critical = 15;
      };
      format = "{icon}  {capacity}%";
      format-charging = "  {capacity}%";
      format-plugged = " {capacity}% ";
      format-alt = "{icon} {time}";
      format-icons = [
        ""
        ""
        ""
        ""
        ""
      ];
    };

    memory = {
      format = "󰍛 {}%";
      format-alt = "󰍛 {used}/{total} GiB";
      interval = 5;
    };

    cpu = {
      format = "󰻠 {usage}%";
      format-alt = "󰻠 {avg_frequency} GHz";
      interval = 5;
    };

    network = {
      format-wifi = "  {signalStrength}%";
      format-ethernet = "󰈀 100% ";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "󰖪 0% ";
      on-click = networkManager;
    };

    "hyprland/workspaces" = {
      active-only = false;
      all-outputs = false;
      on-click = "activate";
      on-scroll-up = "hyprctl dispatch workspace e-1";
      on-scroll-down = "hyprctl dispatch workspace e+1";
      format = "{name}";
      format-icons = {
        urgent = "";
        active = "";
        default = "";
        sort-by-number = true;
      };
    };

    "cava#left" = {
      framerate = 60;
      autosens = 1;
      bars = 18;
      lower_cutoff_freq = 50;
      higher_cutoff_freq = 10000;
      method = "pipewire";
      source = "auto";
      stereo = true;
      reverse = false;
      bar_delimiter = 0;
      monstercat = false;
      waves = false;
      input_delay = 2;
      format-icons = [
        "<span foreground='#${palette.base0E}'>▁</span>"
        "<span foreground='#${palette.base0E}'>▂</span>"
        "<span foreground='#${palette.base0E}'>▃</span>"
        "<span foreground='#${palette.base0E}'>▄</span>"
        "<span foreground='#${palette.base0D}'>▅</span>"
        "<span foreground='#${palette.base0D}'>▆</span>"
        "<span foreground='#${palette.base0D}'>▇</span>"
        "<span foreground='#${palette.base0D}'>█</span>"
      ];
    };
    "cava#right" = {
      framerate = 60;
      autosens = 1;
      bars = 18;
      lower_cutoff_freq = 50;
      higher_cutoff_freq = 10000;
      method = "pipewire";
      source = "auto";
      stereo = true;
      reverse = false;
      bar_delimiter = 0;
      monstercat = false;
      waves = false;
      input_delay = 2;
      format-icons = [
        "<span foreground='#${palette.base0E}'>▁</span>"
        "<span foreground='#${palette.base0E}'>▂</span>"
        "<span foreground='#${palette.base0E}'>▃</span>"
        "<span foreground='#${palette.base0E}'>▄</span>"
        "<span foreground='#${palette.base0D}'>▅</span>"
        "<span foreground='#${palette.base0D}'>▆</span>"
        "<span foreground='#${palette.base0D}'>▇</span>"
        "<span foreground='#${palette.base0D}'>█</span>"
      ];
    };

    "custom/playerctl#backward" = {
      format = "󰙣 ";
      on-click = "${playerctl} previous";
      on-scroll-down = "${playerctl} volume .05-";
      on-scroll-up = "${playerctl} volume .05+";
    };

    "custom/playerctl#play" = {
      exec = "${playerctl} -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
      format = "{icon}";
      format-icons = {
        Paused = "<span> </span>";
        Playing = "<span>󰏥 </span>";
        Stopped = "<span> </span>";
      };
      on-click = "${playerctl} play-pause";
      on-scroll-down = "${playerctl} volume .05-";
      on-scroll-up = "${playerctl} volume .05+";
      return-type = "json";
    };

    "custom/playerctl#foward" = {
      format = "󰙡 ";
      on-click = "${playerctl} next";
      on-scroll-down = "${playerctl} volume .05-";
      on-scroll-up = "${playerctl} volume .05+";
    };

    "custom/playerlabel" = {
      exec = "${playerctl} -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
      format = "<span>󰎈 {} 󰎈</span>";
      max-length = "40";
      on-click = musicPlayer;
      return-type = "json";
    };

    tray = {
      icon-size = 20;
      spacing = 8;
    };

    backlight = {
      format = "{icon} {percent}%";
      format-icons = [
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
      ];
    };

    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "󰝟";
      format-icons = {
        default = [
          "󰕿"
          "󰖀"
          "󰕾"
        ];
      };
      on-click = audioMonitor;
    };

    "custom/powermenu" = {
      format = "";
      on-click = "sleep 0.1; ${powermenu}";
      tooltip = false;
    };

    "custom/mail" = {
      interval = 5;
      return-type = "json";
      exec = jsonOutput "unread-mail" {
        pre = ''
          count=$(find ${cfg.mailpath}/*/[Ii][Nn][Bb][Oo][Xx]/new -type f | wc -l)
          if [ "$count" == "0" ]; then
            subjects="No new mail"
            status="read"
          else
            subjects=$(\
              grep -h "Subject: " -r ${cfg.mailpath}/*/[Ii][Nn][Bb][Oo][Xx]/new | cut -d ':' -f2- | \
              perl -CS -MEncode -ne 'print decode("MIME-Header", $_)' | ${xml} esc | sed -e 's/^/\-/'\
            )
            status="unread"
          fi
          if pgrep mbsync &>/dev/null; then
            status="syncing"
          fi
        '';
        text = "$count";
        tooltip = "$subjects";
        alt = "$status";
      };
      format = "{icon} {}";
      format-icons = {
        "read" = "󰇯";
        "unread" = "󰇮";
        "syncing" = "󰁪";
      };
      on-click = mail;
    };
  };
}
