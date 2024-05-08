{ config, ... }:

let
  HOME = config.home.homeDirectory;
in
{
  xdg = {
    userDirs = {
      enable = true;
      desktop = "${HOME}/Bureau";
      documents = "${HOME}/Documents";
      download = "${HOME}/Téléchargements";
      music = "${HOME}/Musique";
      pictures = "${HOME}/Images";
      videos = "${HOME}/Vidéos";
      templates = "${HOME}/Modèles";
      extraConfig = {
        XDG_GAME_DIR = "/mnt/Jeux/SteamLibrary/steamapps/common/";
      };
    };

    desktopEntries = {
      torrent = {
        type = "Application";
        name = "Torrent";
        exec = "/usr/bin/env transadd %U";
      };
    };
  };
  home.sessionVariables = {
    XDG_DATA_HOME = "${HOME}/.local/share";
    XDG_CONFIG_HOME = "${HOME}/.config";
    XDG_STATE_HOME = "${HOME}/.local/state";
    XDG_CACHE_HOME = "${HOME}/.cache";
    OPENER = "xdg-open";
  };
}
