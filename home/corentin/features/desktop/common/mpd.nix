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
      audio_output {
      type                    "fifo"
      name                    "my_fifo"
      path                    "/tmp/mpd.fifo"
      format                  "44100:16:2"
      }
      user "${config.home.username}"
    '';
  };

  services.mpd-mpris = {
    enable = true;
  };

  home.packages = with pkgs; [ mpc-cli ]; # Mpd controls via CLI
}
