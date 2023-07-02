{ config, pkgs, ... }:

{

  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Musique";

    extraConfig = ''
    audio_output {
    type "pipewire"
    name "My PipeWire Output"
    }
    user "${config.home.username}"
'';
  };

  home.packages = with pkgs; [ mpc-cli ]; # Mpd controls via CLI

}
