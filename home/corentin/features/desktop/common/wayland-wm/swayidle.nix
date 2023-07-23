{ pkgs, lib, config, ... }:

let
  inherit (config.colorscheme) colors;

  swaylock = "${pkgs.swaylock}/bin/swaylock";
  actionLock = "${swaylock} --daemonize -c ${colors.base00}";

  lockTime = 5 * 60; 

  mkEvent = time: start: resume: ''
    timeout ${toString (lockTime + time)} '${start}' ${lib.optionalString (resume != null) "resume '${resume}'"}
  '';
in
{
  home.packages = with pkgs; [ swayidle ];
  xdg.configFile."swayidle/config".text = ''
    timeout ${toString lockTime} '${actionLock}'
  '' +
  # Hyprland - Turn off screen (DPMS)
  lib.optionalString config.wayland.windowManager.hyprland.enable
    (let hyprctl = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl";
    in mkEvent 40 "${hyprctl} dispatch dpms off" "${hyprctl} dispatch dpms on") +
  # Sway - Turn off screen (DPMS)
  lib.optionalString config.wayland.windowManager.sway.enable
    (let swaymsg = "${config.wayland.windowManager.sway.package}/bin/swaymsg";
    in mkEvent 40 "${swaymsg} 'output * dpms off'" "${swaymsg} 'output * dpms on'");
}
