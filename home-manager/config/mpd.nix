{ pkgs, config, ... }:

{

  home.file.".config/mpd/mpd.conf" = {
    text = ''
music_directory		"~/Musique"
playlist_directory	"~/.config/mpd/playlists"

auto_update "yes"
bind_to_address "127.0.0.1"
restore_paused "yes"
max_output_buffer_size "16384"

audio_output {
	type "pulse"
	name "pulse"
	#type  "alsa"
	#name  "ALSA"
}

audio_output {
       type	"fifo"
       name	"Visualizer feed"
       path	"/tmp/mpd.fifo"
       format	"44100:16:2"
}
    '';
  };
}
