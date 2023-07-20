{ config, ... }:

{
  xdg.configFile."rofi/colors.rasi".text = import ./themes/colors.nix { inherit (config) colorscheme; };
  xdg.configFile."rofi/askpass.rasi".text = import ./themes/askpass.nix ;
  xdg.configFile."rofi/bluetooth.rasi".text = import ./themes/bluetooth.nix { inherit (config) fontProfiles; };
  xdg.configFile."rofi/confirm.rasi".text = import ./themes/confirm.nix;
  xdg.configFile."rofi/font.rasi".text = import ./themes/font.nix { inherit (config) fontProfiles; };
  xdg.configFile."rofi/launcher.rasi".text = import ./themes/launcher.nix { inherit (config) fontProfiles; };
  xdg.configFile."rofi/long-launcher.rasi".text = import ./themes/long-launcher.nix { inherit (config) fontProfiles; };
  xdg.configFile."rofi/mpd.rasi".text = import ./themes/mpd.nix { inherit (config) fontProfiles; };
  xdg.configFile."rofi/network.rasi".text = import ./themes/network.nix { inherit (config) fontProfiles; };
  xdg.configFile."rofi/networkmenu.rasi".text = import ./themes/networkmenu.nix { inherit (config) fontProfiles; };
  xdg.configFile."rofi/powermenu.rasi".text = import ./themes/powermenu.nix { inherit (config) fontProfiles; };
  xdg.configFile."rofi/runner.rasi".text = import ./themes/runner.nix { inherit (config) fontProfiles; };
  xdg.configFile."rofi/screenshot.rasi".text = import ./themes/screenshot.nix { inherit (config) fontProfiles; };
}
