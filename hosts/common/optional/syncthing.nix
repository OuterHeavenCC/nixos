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
        deimos = {
          name = "deimOS";
          id = "OZYOKKT-RTGLREG-6ZJKW6F-PUMV2AG-TARLRAP-QQYT5PH-5ZOFV25-FKY7KAZ";
        };
      };
      folders = {
        Notes = {
          enable = true;
          path = "/home/corentin/Documents/Notes";
          devices = [ "phone" "phobos" "deimos" ];
          id = "notes";
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
        Livres = {
          enable = true;
          path = "/home/corentin/Documents/Livres";
          devices = [ "phone" "phobos" "deimos" ];
          id = "livres";
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
        Personnel = {
          enable = true;
          path = "/home/corentin/Documents/Personnel";
          devices = [ "phone" "phobos" "deimos" ];
          id = "personnel";
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
        Professionnel = {
          enable = true;
          path = "/home/corentin/Documents/Professionnel";
          devices = [ "phone" "phobos" "deimos" ];
          id = "professionnel";
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
      };
    };


  };
}
