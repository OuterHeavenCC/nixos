# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays

  modifications = final: prev: {

    ncmpcpp = prev.ncmpcpp.override {
      visualizerSupport = true;
    };

    # lf sixel support TODO à réactiver quand il sera mit à jour (r31)
    # lf = prev.lf.overrideAttrs (old: {
    #   src = prev.fetchFromGitHub {
    #     owner = "horriblename";
    #     repo = "lf";
    #     rev = "1bb0b43feafba0d5dbc40d4cf71a4f22b547be00";
    #     sha256 = "CoWF3virzel8TbW79xc6xXxh6K6r9mCeoaAUYcE7VHc=";
    #   };
    # });

    nginxStable = prev.nginxStable.override { oppenssl = prev.pkgs.libressl; };

  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

}
