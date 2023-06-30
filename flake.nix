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
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    hyprland = {
      url = "github:hyprwm/hyprland/v0.25.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    

  };


  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forEachSystem = f: lib.genAttrs systems (sys: f pkgsFor.${sys});
      pkgsFor = nixpkgs.legacyPackages;
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
        phobOS =  lib.nixosSystem {
          modules = [ ./hosts/phobOS/configuration.nix ];
          specialArgs = { inherit inputs outputs; };
        };
        # PC Portable
        deimOS = lib.nixosSystem {
          modules = [ ./hosts/deimOS/configuration.nix ];
          specialArgs = { inherit inputs outputs; };
        };

      # Available through 'home-manager --flake .#corentin@hostname'
      homeConfigurations = {
        "corentin@phobOS" = lib.homeManagerConfiguration {
          modules = [ ./home/corentin/phobOS.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
        "corentin@deimOS" = lib.homeManagerConfiguration {
          modules = [ ./home/corentin/deimOS.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
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

          };
        };
      };
}
