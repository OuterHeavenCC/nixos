{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice-qt
    hunspell
    hunspellDicts.fr-reforme1990
    hunspellDicts.en-us
  ];
}
