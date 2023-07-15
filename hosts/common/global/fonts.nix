{ pkgs, ... }:

{
    fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    source-han-sans
    source-han-sans-japanese
    source-han-serif-japanese
    libertine
    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" "JetBrainsMono" ]; })
  ];

}
