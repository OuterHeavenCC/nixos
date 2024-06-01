{ config, inputs, ... }:

let
  hexToRGBString = inputs.nix-colors.lib.conversions.hexToRGBString;
  inherit (config.colorscheme) palette;
in
''
  * {
      border: none;
      border-radius: 0px;
      font-family: ${config.fontProfiles.monospace.family};
      font-size: 14px;
      min-height: 0;
  }

  window#waybar {
      background: rgba(${hexToRGBString "," palette.base01}, 1);
  }


  #cava.left, #cava.right {
      background: #${palette.base02};
      margin: 5px; 
      padding: 8px 16px;
      color: #${palette.base0E};
  }

  #cava.left {
      border-radius: 24px 10px 24px 10px;

  }
  #cava.right {
      border-radius: 10px 24px 10px 24px;
  }

  #workspaces {
      background: #${palette.base02};
      margin: 5px 5px;
      padding: 8px 5px;
      border-radius: 16px;
      color: #${palette.base0E}
  }

  #workspaces button {
      padding: 0px 5px;
      margin: 0px 3px;
      border-radius: 16px;
      color: transparent;
      background: rgba(${hexToRGBString "," palette.base01}, 1);
      transition: all 0.3s ease-in-out;
  }

  #workspaces button.active {
      background-color: #${palette.base0D};
      color: #${palette.base01};
      border-radius: 16px;
      min-width: 50px;
      background-size: 400% 400%;
      transition: all 0.3s ease-in-out;
  }

  #workspaces button:hover {
      background-color: #${palette.base05};
      color: #${palette.base01};
      border-radius: 16px;
      min-width: 50px;
      background-size: 400% 400%;
  }

  #tray, #pulseaudio, #custom-mail, #network, #battery,
  #custom-playerctl.backward, #custom-playerctl.play, #custom-playerctl.foward{
      background: #${palette.base02};
      font-weight: bold;
      margin: 5px 0px;
  }

  #tray, #pulseaudio, #network, #battery #custom-mail{
      color: #${palette.base05};
      border-radius: 10px 24px 10px 24px;
      padding: 0 20px;
      margin-left: 7px;
  }

  #clock {
      color: #${palette.base05};
      background: #${palette.base02};
      border-radius: 0px 0px 0px 40px;
      padding: 10px 10px 15px 25px;
      margin-left: 7px;
      font-weight: bold;
      font-size: 14px;
  }

  #custom-powermenu {
      color: #${palette.base0D};
      background: #${palette.base02};
      border-radius: 0px 0px 40px 0px;
      margin: 0px;
      padding: 0px 35px 0px 15px;
      font-size: 28px;
  }

  #custom-playerctl.backward, #custom-playerctl.play, #custom-playerctl.foward {
      background: #${palette.base02};
      font-size: 22px;
  }
  #custom-playerctl.backward:hover, #custom-playerctl.play:hover, #custom-playerctl.foward:hover{
      color: #${palette.base05};
  }
  #custom-playerctl.backward {
      color: #${palette.base0E};
      border-radius: 24px 0px 0px 10px;
      padding-left: 16px;
      margin-left: 7px;
  }
  #custom-playerctl.play {
      color: #${palette.base0D};
      padding: 0 5px;
  }
  #custom-playerctl.foward {
      color: #${palette.base0E};
      border-radius: 0px 10px 24px 0px;
      padding-right: 12px;
      margin-right: 7px
  }
  #custom-playerlabel {
      background: #${palette.base02};
      color: #${palette.base05};
      padding: 0 20px;
      border-radius: 24px 10px 24px 10px;
      margin: 5px 0;
      font-weight: bold;
  }
  #window{
      background: #${palette.base02};
      padding-left: 15px;
      padding-right: 15px;
      border-radius: 16px;
      margin-top: 5px;
      margin-bottom: 5px;
      font-weight: normal;
      font-style: normal;
  }

#custom-mail {
    background: #${palette.base02};
    color: #${palette.base05};
    padding: 0 20px;
    border-radius: 10px 24px 10px 24px;
    margin: 5px 0;
    font-weight: bold;
    margin-left: 7px
}

''
