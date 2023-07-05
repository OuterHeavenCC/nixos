{ config, ... }:

{
  xdg.configFile."rofi/colors.rasi".text = import ./themes/colors.nix { inherit (config) colorscheme; };
  xdg.configFile."rofi/askpass.rasi".text = import ./themes/askpass.nix;
  xdg.configFile."rofi/bluetooth.rasi".text = import ./themes/bluetooth.nix;
  xdg.configFile."rofi/confirm.rasi".text = import ./themes/confirm.nix;
  xdg.configFile."rofi/font.rasi".text = import ./themes/font.nix;
  xdg.configFile."rofi/launcher.rasi".text = import ./themes/launcher.nix;
  xdg.configFile."rofi/long-launcher.rasi".text = import ./themes/long-launcher.nix;
  xdg.configFile."rofi/mpd.rasi".text = import ./themes/mpd.nix;
  xdg.configFile."rofi/network.rasi".text = import ./themes/network.nix;
  xdg.configFile."rofi/networkmenu.rasi".text = import ./themes/networkmenu.nix;
  xdg.configFile."rofi/powermenu.rasi".text = import ./themes/powermenu.nix;
  xdg.configFile."rofi/runner.rasi".text = import ./themes/runner.nix;
  xdg.configFile."rofi/screenshot.rasi".text = import ./themes/screenshot.nix;
}
