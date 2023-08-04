{ config, pkgs, ... }:

let 
  inherit (config.colorscheme) colors;
  pulsemixer = "${pkgs.pulsemixer}/bin/pulsemixer";
  networkManager = "${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";
  jq = "${pkgs.jq}/bin/jq";
  xml = "${pkgs.xmlstarlet}/bin/xml";
  neomutt = "${pkgs.neomutt}/bin/neomutt";
  playerctl = "${pkgs.playerctl}/bin/playerctl";


  terminal = "${pkgs.foot}/bin/footclient";
  terminal-spawn = cmd: "${terminal} -e ${cmd}";
  powermenu = "${pkgs.rofi-powermenu}/bin/rofi-powermenu";
  audioMonitor = terminal-spawn pulsemixer;
  mail = terminal-spawn neomutt;

  cfg.mailpath = config.accounts.email.maildirBasePath;


  jsonOutput = name: { pre ? "", text ? "", tooltip ? "", alt ? "", class ? "", percentage ? "" }: "${pkgs.writeShellScriptBin "waybar-${name}" ''
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
  mainBar = {
    position= "top";
    layer= "top";
    height= 42;
    margin-top= 0;
    margin-bottom= 0;
    margin-left= 0;
    margin-right= 0;
    modules-left= ["custom/powermenu" "custom/playerctl" "custom/playerlabel"];
    modules-center= [ "wlr/workspaces" ];
    modules-right= [
      "network"
      "custom/unread-mail"
      "battery" 
			"pulseaudio" 
			"tray" 
			"clock" 
    ];
		clock= {
			format= " {:%A %d %B, %H:%M}";
			tooltip= "true";
			tooltip-format= "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
		};
	

		"wlr/workspaces"= {
			active-only= false;
			all-outputs= false;
			disable-scroll= false;
			on-scroll-up= "hyprctl dispatch workspace e-1";
			on-scroll-down= "hyprctl dispatch workspace e+1";
			format= "{icon}";
			on-click= "activate";
			format-icons= {
				urgent= "";
				active= "";
				default= "";
			sort-by-number= true;
			};
		};

    "custom/playerctl"= {
      format= "{icon}";
      return-type= "json";
      max-length= 64;
      exec= "${playerctl} -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
      on-click-middle= "${playerctl} previous";
      on-click= "${playerctl} play-pause";
      on-click-right= "${playerctl} next";
      format-icons= {
        Playing= "<span foreground='#${colors.base07}'>󰐌 </span>";
        Paused= "<span foreground='#${colors.base05}'>󰏥 </span>";
      };
    };

    "custom/playerlabel"= {
      format= "<span>{}</span>";
      return-type= "json";
      max-length= 48;
      exec= "${playerctl} -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
      on-click-middle= "${playerctl} previous";
      on-click= "${playerctl} play-pause";
      on-click-right= "${playerctl} next";
      format-icons= {
        Playing= "<span foreground='#${colors.base07}'>󰐌 </span>";
        Paused= "<span foreground='#${colors.base05}'>󰏥 </span>";
      };
    };

    battery = {
      format = "{icon} {capacity}%";
      format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
      format-charging = "󰂄 {capacity}%";
    };

    network = {
      format = "{ifname}";
      format-wifi = " {essid}";
      format-ethernet = "󰌗";
      format-disconnected = "󰖪 Non connecté";
      on-click = networkManager;
    };

		tray= {
			icon-size= 16;
			spacing= 5;
		};

		backlight= {
			format= "{icon} {percent}%";
			format-icons= ["" "" "" "" "" "" "" "" ""];
		};

		pulseaudio= {
			format= "{icon} {volume}%";
			format-muted= "󰝟";
			format-icons= {
				default= ["󰕿" "󰖀" "󰕾"];
			};
			on-click= audioMonitor;
		};

		"custom/powermenu"= {
			format= "";
			on-click= "sleep 0.1; ${powermenu}";        # Fix rofi+hyprland+waybar (see https://github.com/Alexays/Waybar/issues/1968)
      tooltip = false;
		};

              "custom/unread-mail" = {
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
