{
  services.syncthing = {
    enable = true;
    user = "corentin";
    systemService = true;
    dataDir = "/home/corentin/.local/share/syncthing";
    configDir = "/home/corentin/.config/syncthing";
    databaseDir = "/home/corentin/.config/syncthing";


    settings = {
      gui = {
        theme = "black";
      };
    };

    folders = {
      "/home/corentin/Documents/Notes" = {
        enable = true;
        id = "notes";
        versioning = {
          type = "simple";
          params.keep = "5";
        };
      };
    };

  };
}
