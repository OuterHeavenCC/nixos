{

  services.mpd = {
    enable = true;
    user = "corentin";
    musicDirectory = "/home/corentin/Musique";
    extraConfig = ''
    audio_output {
    type "pipewire"
    name "My PipeWire Output"
    }
'';
  };
    
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };

}
