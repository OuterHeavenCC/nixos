{ colorscheme, fontProfiles, ... }:
''
* {
  border: none;
  font-family: '${fontProfiles.regular.family}';
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
  color: #${colorscheme.colors.base07};
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
  color: #${colorscheme.colors.base05};
}

#workspaces button.active {
  color: #${colorscheme.colors.base07};
}

#custom-unread-mail, #cpu, #memory, #pulseaudio, #clock, #clock#date #backlight, #network, #battery{
  border-radius: 10px;
  background-color: #11111b;
  color: #${colorscheme.colors.base07};
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
  background: #${colorscheme.colors.base08};
  color: white;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}
''
