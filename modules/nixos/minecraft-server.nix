{
  # TODO Chercher comment faire un serveur fabric ? 
  services.minecraft-server = {
    enable = true;
    eula = true;
    declarative = true;
    openFirewall = true;
    whitelist = {
      EtaIonDuCuI = "d5f4c517-85e0-4ed6-a1d1-ef1c864d1133";
      JadeBlackice = "c3da32c6-08d9-490a-aca9-fcddc93d7974";
    }; 
    
    serverProperties = {
        difficulty = "hard";
        enable-command-block = false;
        enable-query = false;
        enable-rcon = true;
        enable-status = true;
        white-list = true;
        "rcon.password" = "eXf75ooKleCfq7xGDFTO";
    };
  };
}
