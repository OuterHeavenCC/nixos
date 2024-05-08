{ pkgs, ... }:

{

  services.minecraft-servers.servers.survival = {
    enable = true;
    package = pkgs.fabricServers.fabric-1_20;

    jvmOpts = "-Xmx2G";
    whitelist = import ../../whitelist.nix;
    serverProperties = {
      difficulty = "hard";
      enable-command-block = false;
      enable-query = "false";
      enable-rcon = true;
      white-list = true;
      "rcon.password" = "eXf75ooKleCfq7xGDFTO";
    };

    symlinks = {
      mods = pkgs.linkFarmFromDrvs "mods" (
        builtins.attrValues {
          Starlight = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/H8CaAYZC/versions/XGIsoVGT/starlight-1.1.2%2Bfabric.dbc156f.jar";
            sha512 = "6b0e363fc2d6cd2f73b466ab9ba4f16582bb079b8449b7f3ed6e11aa365734af66a9735a7203cf90f8bc9b24e7ce6409eb04d20f84e04c7c6b8e34f4cc8578bb";
          };
          Lithium = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/2KMrj5c1/lithium-fabric-mc1.20-0.11.2.jar";
            sha512 = "sha512-EuDrhYzovsGxm/jL3n2Q7cWkD4u/0KeF71SM4WkaqNKT+GN0IcCV06sdqE7R/EQMY+3II8tbGYZJiMx4WtmijQ==";
          };
          FabricApi = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/n2c5lxAo/fabric-api-0.83.0%2B1.20.jar";
            sha512 = "sha512-sSHuALE4BNaFDN9Qb5shY0inbujBmYSSBi0bPQn37pIciRU0Sf2ditkH0bjvtmCpz0xUDCDcCuiS4PVnrGVB/g==";
          };
        }
      );
    };
  };
}
