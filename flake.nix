{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in
    rec {
      # Your custom packages
      # Acessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; }
      );
      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; }
      );

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs; };
      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      homeManagerModules = import ./modules/home-manager;


      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        # FIXME replace with your hostname
        phobOS = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            # > Our main nixos configuration file <
            ./hosts/phobOS/configuration.nix
          ];
        };

        deimOS = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            # > Our main nixos configuration file <
            ./hosts/deimOS/configuration.nix
          ];
        };


        # TODO M'en occuper plus tard
        # iso = nixpkgs.lib.nixosSystem {
        #   specialArgs = {
        #     inherit inputs outputs;
        #   };
        #   modules = [
        #     (nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-graphical-calamares.nix")
        #     ./hosts/liveUSB/configuration.nix
        #   ];
        # };


      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      # homeConfigurations = {
      #   # FIXME replace with your username@hostname
      #   "corentin@nixos" = home-manager.lib.homeManagerConfiguration {
      #     pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
      #     extraSpecialArgs = { inherit inputs outputs; };
      #     modules = [
      #       # > Our main home-manager configuration file <
      #       ./home-manager/home.nix
      #     ];
      #   };
      # };
    };
};
}
