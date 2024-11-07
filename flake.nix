{
  description = "My NixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    nixos-master.url = "github:nixos/nixpkgs/master";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";

    neorg-overlay.url = "github:nvim-neorg/nixpkgs-neorg-overlay";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    hardware.url = "github:nixos/nixos-hardware";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    yazi.url = "github:sxyazi/yazi";

    ags.url = "github:Aylur/ags";
    ags.inputs.nixpkgs.follows = "nixpkgs";

    matugen.url = "github:InioX/matugen?ref=v2.2.0";

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );
    in
    {
      inherit lib;
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      overlays = import ./overlays { inherit inputs outputs; };

      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
      formatter = forEachSystem (pkgs: pkgs.nixpkgs-fmt);

      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        # Desktop
        phobOS = lib.nixosSystem {
          modules = [ ./hosts/phobOS ];
          specialArgs = {
            inherit inputs outputs;
          };
        };
        # PC Portable
        deimOS = lib.nixosSystem {
          modules = [ ./hosts/deimOS ];
          specialArgs = {
            inherit inputs outputs;
          };
        };
        liveUSB = lib.nixosSystem {
          modules = [ ./hosts/liveUSB ];
          specialArgs = {
            inherit inputs outputs;
          };
        };

        # Serveur
        ares = lib.nixosSystem {
          modules = [ ./hosts/ares ];
          specialArgs = {
            inherit inputs outputs;
          };
        };
      };
      homeConfigurations = {
        # Desktops
        "corentin@phobOS" = lib.homeManagerConfiguration {
          modules = [ ./home/corentin/phobOS.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
        };
        "corentin@deimOS" = lib.homeManagerConfiguration {
          modules = [ ./home/corentin/deimOS.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
        };
        "corentin@ares" = lib.homeManagerConfiguration {
          modules = [ ./home/corentin/ares.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
        };

        "corentin@liveUSB" = lib.homeManagerConfiguration {
          modules = [ ./home/corentin/liveUSB.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
        };
      };
    };
}
