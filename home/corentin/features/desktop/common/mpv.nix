{ config, pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      screenshot-directory = "${config.home.homeDirectory}/Images/ss/mpv";
      loop-file = "inf";
    };
    bindings = {
      l = "seek 5";
      h = "seek -5";
      j = "seek -60";
      k = "seek 60";
      S = "cycle sub";
      C = "script-message-to crop toggle-crop";
      E = "script-message-to encode set-timestamp encode_slice";
      T = "script-message-to seek_to toggle-seeker";
    };
    scripts = [ pkgs.mpvScripts.sponsorblock ];
  };

}
