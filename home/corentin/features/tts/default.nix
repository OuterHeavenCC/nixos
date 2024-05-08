{ pkgs, ... }:

{

  home.packages = with pkgs; [
    piper-tts # Text to Speech
    alsa-utils # for piper --output-raw
  ];

  programs.zsh.shellAliases = {
    piper = "piper --model ~/.config/piper-tts/fr_FR-upmc-medium.onnx";
  };
}
