# This file defines overlays
{ inputs, ... }:

{
  flake-inputs = final: _: {
    inputs = builtins.mapAttrs (
      _: flake:
      let
        legacyPackages = ((flake.legacyPackages or { }).${final.system} or { });
        packages = ((flake.packages or { }).${final.system} or { });
      in
      if legacyPackages != { } then legacyPackages else packages
    ) inputs;
  };
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays

  modifications = final: prev: {

    ncmpcpp = prev.ncmpcpp.override { visualizerSupport = true; };

    nginxStable = prev.nginxStable.override { oppenssl = prev.pkgs.libressl; };

    pass = prev.pass.overrideAttrs (oldAttrs: {
      waylandSupport = true;
      dmenuSupport = true;
      postPatch =
        oldAttrs.postPatch
        + ''
          substituteInPlace "contrib/dmenu/passmenu" \
          --replace "dmenu-wl" "\"${final.fuzzel}/bin/fuzzel -d\"" \
          --replace '"$dmenu"' '$dmenu'
        '';
    });

    inherit (inputs.nixos-stable.legacyPackages.${final.system}) rpcs3;
    inherit (inputs.nixos-stable.legacyPackages.${final.system}) calibre;
    inherit (inputs.nixos-stable.legacyPackages.${final.system}) anki;
    inherit (inputs.nixos-stable.legacyPackages.${final.system}) transmission;
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.master'
  master-packages = final: _prev: {
    master = import inputs.nixos-master {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  stable-packages = final: _prev: {
    stable = import inputs.nixos-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
