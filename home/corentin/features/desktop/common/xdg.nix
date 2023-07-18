{ config, ... }:

{
    xdg = {
        userDirs = {
          enable = true;
          download = "${config.home.homeDirectory}/Téléchargements";
          music = "${config.home.homeDirectory}/Musique";
          pictures = "${config.home.homeDirectory}/Images";
          videos = "${config.home.homeDirectory}/Vidéos";
          templates = "${config.home.homeDirectory}/Modèles";
          };

        desktopEntries = {
          torrent = {
            type = "Application";
            name = "Torrent";
            exec= "/usr/bin/env transadd %U";
          };
        };
    };
}

