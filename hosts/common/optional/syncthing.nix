{
  services.syncthing = {
    enable = true;
    user = "corentin";
    systemService = true;

    dataDir = "/home/corentin/.local/share/syncthing";
    configDir = "/home/corentin/.config/syncthing";
    databaseDir = "/home/corentin/.config/syncthing";

    guiAddress = "127.0.0.1:8384";

    settings = {
      gui = {
        theme = "black";
      };
      devices = {
        phone = {
          name = "Pixel 8";
          id = "P6LUW47-LWQFKIE-ZYW7S2T-6RPRXMP-PL5SN6R-JSSNVNQ-43MIZRQ-4MQMPQF";
        };
        phobos = {
          name = "phobOS";
          id = "77E4AOM-QIDFG5A-UMAK5CI-SLXY5DC-TM7U5TN-G4BCMZ7-K3ZEWFM-SLWSGAX";
        };
      };
      folders = {
        "/home/corentin/Documents/Notes" = {
          enable = true;
          devices = [ "phone" "phobos" ];
          id = "notes";
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
        "/home/corentin/Documents/Livres" = {
          enable = true;
          devices = [ "phone" "phobos" ];
          id = "livres";
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
      };
    };


  };
}
