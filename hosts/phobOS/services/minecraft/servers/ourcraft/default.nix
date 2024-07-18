{ pkgs, ... }:

{

  services.minecraft-servers.servers.ourcraft = {
    enable = true;
    package = pkgs.fabricServers.fabric-1_20_4;

    jvmOpts = "-Xmx2G";
    whitelist = import ../../whitelist.nix;
    serverProperties = {
      motd = "☭ OURCRAFT ☭";
      difficulty = "hard";
      enable-command-block = true;
      enable-query = false;
      enable-rcon = true;
      white-list = true;
      "rcon.password" = "eXf75ooKleCfq7xGDFTO";
    };

    symlinks = {
      mods =
        with pkgs;
        linkFarmFromDrvs "mods" (
          builtins.attrValues {
            Starlight = fetchurl {
              url = "https://cdn.modrinth.com/data/H8CaAYZC/versions/HZYU0kdg/starlight-1.1.3%2Bfabric.f5dcd1a.jar";
              sha512 = "6bc9e4582f6e28dada721cd5a3eea5b817e3445883a3717c1927c558ee991dc327239c62afd4ce9215fa7735c3afa6e870f287826dc4c2d773a524903a7b8fb4";
            };
            Lithium = fetchurl {
              url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/nMhjKWVE/lithium-fabric-mc1.20.4-0.12.1.jar";
              sha512 = "70bea154eaafb2e4b5cb755cdb12c55d50f9296ab4c2855399da548f72d6d24c0a9f77e3da2b2ea5f47fa91d1258df4d08c6c6f24a25da887ed71cea93502508";
            };
            FabricApi = fetchurl {
              url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/tAwdMmKY/fabric-api-0.97.1%2B1.20.4.jar";
              sha512 = "161d5d8c67330cbda4ce825f92f23b96bfa884f881d5931c0375aba9ceef0f5e14b11c8607b5368fb6b72b796694a86a48271eecc3d9b63991f4b01352d66d5f";
            };
            ElytraSlot = fetchurl {
              url = "https://cdn.modrinth.com/data/mSQF1NpT/versions/PXl1xHES/elytraslot-fabric-7.0.0%2B1.20.4.jar";
              sha512 = "ae050359f88377de0a66de38e4434e66c93573c243b733ad48a8fe99732fba8c0ba9969c4d0fc736f883e2da7bfb15a0de8c0869c0065aa644047b4ec1c1e06c";
            };
            Trinkets = fetchurl {
              url = "https://cdn.modrinth.com/data/5aaWibi9/versions/7aQD4OG8/trinkets-3.8.1.jar";
              sha512 = "42c66bd280f5030bafc50f5e9a6e4bacda10e0d717903a03448013d86ba373718bce0f3550e653043eb2e4bae4334557f234b621801a4b84bf59f1e9dd579447";
            };
            AppleSkin = fetchurl {
              url = "https://cdn.modrinth.com/data/EsAfCjCV/versions/pmFyu3Sz/appleskin-fabric-mc1.20.3-2.5.1.jar";
              sha512 = "d121c5b760da0df1882f74bedfe84f2033d81a679cb0aa15e38eeae5fefefba8b23b1a87e43095c3cb9cbde5d0960b52d99856209111069923078c39c8750aa6";
            };
            CarryOn = fetchurl {
              url = "https://cdn.modrinth.com/data/joEfVgkn/versions/EvDx8gEe/carryon-fabric-1.20.4-2.1.3.13.jar";
              sha512 = "b66a7cb6b96c94921a8d7516e2cbad69ee1844130c359c88612792b5176f2aa0b650688424585c062e3a18de700df503bdcebe459f2e76e60dba69094dcf096b";
            };
            # Tectonic = fetchurl {
            #   url = "https://cdn.modrinth.com/data/lWDHr9jE/versions/GxY5oM7Y/tectonic-fabric-1.20-2.3.5b.jar";
            #   sha512 = "02d7cc6d5c4a87012b28db8ce4608dff6dcfa6b97a900abcb21c28abf50676d6b37f5b7350977f04d04946408c6d41c8998158cf1dfdb1e235c95200ad71d0a5";
            # };
            JourneyMap = fetchurl {
              url = "https://cdn.modrinth.com/data/lfHFW1mp/versions/mMICqfH9/journeymap-1.20.4-5.9.28-fabric.jar";
              sha512 = "3c867f5dac319f2e7b5426d56bf737835e1c4a79f9d61f112dcfcd5b87b01cef2230cab0533271aa7134c3d0a0439b51b7d50dd31423203b48ad69685d8a231d";
            };
            # Terralith = fetchurl {
            #   url = "https://cdn.modrinth.com/data/8oi3bsk5/versions/rWmFwtGy/Terralith_1.20_v2.5.1.jar";
            #   sha512 = "459fec3da3474011195dff101c8303a5d9d8f1e431d99b4398cc087d0c4045fd42b49b16720ca4ea17e18180e9bc9d19a327361a58fe0ebae7a3f7f6db34b5d1";
            # };
            InfinityAndMending = fetchurl {
              url = "https://cdn.modrinth.com/data/tUvQMFwZ/versions/fFn78X1h/infinity-and-mending-1.20.x-1.0.0.jar";
              sha512 = "7e75161b50b4745d64a3373c07f00c43b288089be3d27e3984448abfa750dd38495cb18af7bbfedfeacfacccb2440bdf549fb850fd2b577e9c7745c24041c177";
            };
            Servux = fetchurl {
              url = "https://cdn.modrinth.com/data/zQhsx8KF/versions/y3YGV2rC/servux-fabric-1.20.2-0.1.0.jar";
              sha512 = "c59e7ec87d0388d5d6b3b51b655616e78fb348bbaec7e9c9dc0bd4e20c6d2751b2035cf16ee051c03f349a001c6136352921f0375fff4ca51ec4cb7e31cf350d";
            };
            WorldEdit = fetchurl {
              url = "https://cdn.modrinth.com/data/1u6JkXh5/versions/ZOhVauWn/worldedit-mod-7.3.0.jar";
              sha512 = "0b58ba7d59cb01b7e594da28bbcf6f97624549bb427a3e8c64108f21b49892c6732c068604cabba6ee5aa4ebaf317f94219a4108a37d74c0de2a114e4e0a5812";
            };
            Chunky = fetchurl {
              url = "https://cdn.modrinth.com/data/fALzjamp/versions/NHWYq9at/Chunky-1.3.146.jar";
              sha512 = "9dbb82993302a8dfbe6ce1f46a051d72b5ada924424f4e23674ce660d209257584159a33248fa9247793e9ba03d3a117299ce1ff6685f06a7fb87c96504459aa";
            };
            ChunkyBorder = fetchurl {
              url = "https://cdn.modrinth.com/data/s86X568j/versions/22AFyYWv/ChunkyBorder-1.1.63.jar";
              sha512 = "56bbcd124a0c727366ca40152e4f79aef0c84c66720033eb362be60c464fa11ebaf8649c0a29d0b60e2868dc830d26558f4ebc0744435b526db57f637526a8e0";
            };
          }
        );
    };
  };
}
