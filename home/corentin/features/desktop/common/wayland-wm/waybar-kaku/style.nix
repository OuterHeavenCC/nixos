{colorscheme}:
''
* {
    border: none;
    border-radius: 0px;
    font-family: Fira Code Nerd Font, Iosevka Nerd Font;
    font-size: 12px;
    font-style: normal;
    min-height: 0;
	}

window#waybar {
    background: rgba(16, 18, 19, 0.8);
    border-bottom: 1px solid #${colorscheme.palette.base00};
    color: #${colorscheme.palette.base05}
}

#workspaces {
	background: #${colorscheme.palette.base00};
	margin: 5px 5px;
  padding: 8px 5px;
	border-radius: 16px;
  border: solid 0px #${colorscheme.palette.base05};
  font-weight: normal;
  font-style: normal;
}
#workspaces button {
    padding: 0px 5px;
    margin: 0px 3px;
    border-radius: 16px;
    color: #${colorscheme.palette.base02};
    background-color: #${colorscheme.palette.base02};
    transition: all 0.3s ease-in-out;
}

#workspaces button.active {
    color: #${colorscheme.palette.base05};
    background-color: #${colorscheme.palette.base05};
    border-radius: 16px;
    min-width: 50px;
    background-size: 400% 400%;
    transition: all 0.3s ease-in-out;
}

#workspaces button:hover {
	background-color: #${colorscheme.palette.base05};
	color: #${colorscheme.palette.base05};
	border-radius: 16px;
  min-width: 50px;
  background-size: 400% 400%;
}

#custom-date, #clock, #battery, #pulseaudio, #network, #custom-unread-mail, #custom-powermenu {
	background: transparent;
	padding: 5px 5px 5px 5px;
	margin: 5px 5px 5px 5px;
  border-radius: 8px;
  border: solid 0px #${colorscheme.palette.base0F};
}

#custom-date {
	color: #${colorscheme.palette.base08};
}

#tray {
    background: #${colorscheme.palette.base00};
    margin: 5px 5px 5px 5px;
    border-radius: 16px;
    padding: 0px 5px;
}

#clock {
    color: #${colorscheme.palette.base05};
    background-color: #${colorscheme.palette.base00};
    border-radius: 0px 0px 0px 24px;
    padding-left: 13px;
    padding-right: 15px;
    margin-right: 0px;
    margin-left: 10px;
    margin-top: 0px;
    margin-bottom: 0px;
    font-weight: bold;
}


#battery {
    color: #${colorscheme.palette.base0B};
}

#battery.charging {
    color: #${colorscheme.palette.base0B};
}

#battery.warning:not(.charging) {
    background-color: #${colorscheme.palette.base08};
    color: #${colorscheme.palette.base04};
    border-radius: 5px 5px 5px 5px;
}

#backlight {
    background-color: #${colorscheme.palette.base02};
    color: #${colorscheme.palette.base08};
    border-radius: 0px 0px 0px 0px;
    margin: 5px;
    margin-left: 0px;
    margin-right: 0px;
    padding: 0px 0px;
}

#network {
    color: #${colorscheme.palette.base05};
    border-radius: 8px;
    margin-right: 5px;
}

#pulseaudio {
    color: #${colorscheme.palette.base05};
    border-radius: 8px;
    margin-left: 0px;
    font-weight: bold;
}

#pulseaudio.muted {
    color: #${colorscheme.palette.base02};
    border-radius: 8px;
    margin-left: 0px;
    font-weight: bold;
}

#custom-randwall {
    color: #${colorscheme.palette.base05};
    border-radius: 8px;
    margin-right: 0px;
}

#custom-powermenu {
    color: #${colorscheme.palette.base07};
    background-color: #${colorscheme.palette.base00};
    border-radius: 0px 0px 24px 0px;
    margin: 0px 0px 0px 0px;
    padding: 0 20px 0 13px;
    font-size: 20px;
}

#custom-powermenu button:hover {
    background-color: #${colorscheme.palette.base08};
    color: transparent;
    border-radius: 8px;
    margin-right: -5px;
    margin-left: 10px;
}

#custom-playerctl {
	background: #${colorscheme.palette.base00};
  padding: 0px 5px 0px 10px;
	border-radius: 16px;
  margin: 5px 7px;
  font-weight: normal;
  font-style: normal;
  font-size: 16px;
}

#custom-playerlabel {
    background: transparent;
    padding-left: 10px;
    padding-right: 5px;
    border-radius: 16px;
    margin-top: 5px;
    margin-bottom: 5px;
    font-weight: normal;
    font-style: normal;
}

#window {
    background: #${colorscheme.palette.base00};
    padding-left: 15px;
    padding-right: 15px;
    border-radius: 16px;
    margin-top: 5px;
    margin-bottom: 5px;
    font-weight: normal;
    font-style: normal;
}

#custom-wf-recorder {
    padding: 0 20px;
    color: #${colorscheme.palette.base08};
    background-color: #${colorscheme.palette.base00};
}

#cpu {
    background-color: #${colorscheme.palette.base00};
    /*color: #${colorscheme.palette.base0A};*/
    border-radius: 16px;
    margin: 5px;
    margin-left: 5px;
    margin-right: 5px;
    padding: 0px 10px 0px 10px;
    font-weight: bold;
}

#memory {
    background-color: #${colorscheme.palette.base00};
    /*color: #${colorscheme.palette.base0C};*/
    border-radius: 16px;
    margin: 5px;
    margin-left: 5px;
    margin-right: 5px;
    padding: 0px 10px 0px 10px;
    font-weight: bold;
}

#disk {
    background-color: #${colorscheme.palette.base00};
    /*color: #${colorscheme.palette.base0B};*/
    border-radius: 16px;
    margin: 5px;
    margin-left: 5px;
    margin-right: 5px;
    padding: 0px 10px 0px 10px;
    font-weight: bold;
}

#custom-randwall {
    background-color: #${colorscheme.palette.base00};
    /*color: #${colorscheme.palette.base07};*/
    border-radius: 16px;
    margin: 5px;
    margin-left: 5px;
    margin-right: 5px;
    padding: 0px 11px 0px 9px;
    font-weight: bold;
}

''
