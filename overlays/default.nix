# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  # additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  # TODO Pourquoi ctpv ne fonctionne pas alors que j'ai la bonne version ? Mystère...

  lf-sixel = final: prev: {
  lf = prev.lf.overrideAttrs (oldAttrs: rec {
    src = prev.fetchFromGitHub {
      owner = "horriblename";
      repo = "lf";
      rev = "r30";
      sha256 = "sha256-hlhmnkPm1x7uJMwUM/B02rXLffsXFbkxXYITKD3BERY=";
      };
    });
  };

  ncmpcpp-visualizerSupport = final: prev: 
  {
    ncmpcpp = prev.ncmpcpp.override {
      visualizerSupport = true;
      };
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
