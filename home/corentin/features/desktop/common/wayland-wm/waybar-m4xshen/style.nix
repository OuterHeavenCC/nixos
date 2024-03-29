{ colorscheme, ... }:
''
* {
  border: none;
  font-family: 'Fira Code Nerd Font';
  font-size: 14px;
  font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
  min-height: 25px;
}

window#waybar {
  background: transparent;
}

#custom-nixos, #workspaces {
  border-radius: 10px;
  background-color: #11111b;
  color: #${colorscheme.palette.base07};
  margin-top: 15px;
	margin-right: 15px;
  padding-top: 1px;
  padding-left: 10px;
  padding-right: 10px;
}

#custom-nixos {
  font-size: 20px;
	margin-left: 15px;
  padding-right: 18px;
}

#workspaces button {
  background: #11111b;
  color: #${colorscheme.palette.base05};
}

#workspaces button.active {
  color: #${colorscheme.palette.base07};
}

#workspaces button.urgent {
  color: #${colorscheme.palette.base08};
}

#custom-mail, #cpu, #memory, #tray, #pulseaudio, #clock, #clock#date #backlight, #network, #battery{
  border-radius: 10px;
  background-color: #11111b;
  color: #${colorscheme.palette.base05};
  margin-top: 15px;
  padding-left: 10px;
  padding-right: 10px;
  margin-right: 15px;
}

#network {
  padding-right: 12px;
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
  background: #${colorscheme.palette.base08};
  color: white;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}
''
