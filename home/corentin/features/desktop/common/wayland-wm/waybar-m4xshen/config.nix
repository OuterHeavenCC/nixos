{ config, pkgs, ... }:

let 
  inherit (config.colorscheme) palette;
  pulsemixer = "${pkgs.pulsemixer}/bin/pulsemixer";
  networkManager = "${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";
  jq = "${pkgs.jq}/bin/jq";
  xml = "${pkgs.xmlstarlet}/bin/xml";
  neomutt = "${pkgs.neomutt}/bin/neomutt";
  calcurse = "${pkgs.calcurse}/bin/calcurse";
  terminal = "${pkgs.foot}/bin/footclient";
  terminal-spawn = cmd: "${terminal} -e ${cmd}";
  powermenu = "${pkgs.powermenu}/bin/powermenu";
  audioMonitor = terminal-spawn pulsemixer;
  mail = terminal-spawn neomutt;
  calendar = terminal-spawn calcurse;

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
          layer = "top";
          modules-left = [ "custom/nixos" "hyprland/workspaces" ];
          modules-center = [ "clock" ];
          modules-right = [ "tray" "custom/mail" "pulseaudio" "network" "battery" ];

          "custom/nixos" = {
            format = "";
            on-click = "sleep 0.1; ${powermenu}";
          };

          "custom/mail" = {
            interval = 5;
            return-type = "json";
            exec = jsonOutput "mail" {
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
              "read" = "<span color='#${palette.base07}'>󰇯</span>";
              "unread" = "<span color='#${palette.base07}'>󰇮</span>";
              "syncing" = "<span color='#${palette.base07}'>󰁪</span>";
            };
            on-click = mail;
          };

          "hyprland/workspaces" = {
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
            format = "<span color='#${palette.base07}'></span> {:%H:%M}";
            on-click = calendar;
          };

          backlight = {
            device = "radeon_b10";
            format = "<span color='#${palette.base07}'>{icon}</span> {percent}%";
            format-icons = [ "" "" "" "" "" "" "" "" "" ];
          };

          network = {
            format = "{ifname}";
            format-wifi = "<span color='#${palette.base07}'></span> {essid}";
            format-ethernet = "<span color='#${palette.base07}'>󰌗</span>";
            format-disconnected = "<span color='#${palette.base07}'>󰖪</span> Non connecté";
            on-click = networkManager;
          };

          tray= {
            icon-size= 16;
            spacing= 5;
          };


          battery = {
            format = "<span color='#${palette.base07}'>{icon}</span> {capacity}%";
            format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            format-charging = "<span color='#${palette.base07}'>󰂄</span> {capacity}%";
          };

          pulseaudio = {
            scroll-step = 2;
            format = "<span color='#${palette.base07}'>{icon}</span>{volume}%";
            format-muted = "<span color='#${palette.base07}'></span> ";
            format-icons.default = [ " " ];
            on-click = audioMonitor; };
  };
}
